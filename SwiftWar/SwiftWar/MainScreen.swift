import UIKit

class MainScreen: UIViewController {
    
    //mapsize: 500 x 500
    //scrollview size (iphoneSE): 288 324
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var playerTerritorios: UILabel!
    @IBOutlet weak var computerTerritorios: UILabel!
    
    @IBOutlet weak var tropasDisponiveis: UILabel!
    @IBOutlet weak var bonusContinente: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var mapa: UIImageView!
   
    var brasil: [Estado] = []
    
    var playerTurn: Bool = true
    var playerEstados: [Estado] = []
    var computerEstados: [Estado] = []
    var ganhouBatalha: Bool = false
    
    var maquinaBonus: Int = 0
    
    var residuoAtk: Int = 0
    var residuoDef: Int = 0
    
    var estadoSelecionado: Estado? = nil
    
    //Região Norte:
    @IBOutlet weak var acre: UILabel!
    
    @IBOutlet weak var amazonas: UILabel!
    
    @IBOutlet weak var roraima: UILabel!
    
    @IBOutlet weak var rondonia: UILabel!
    
    @IBOutlet weak var para: UILabel!

    @IBOutlet weak var amapa: UILabel!
    
    @IBOutlet weak var tocantins: UILabel!
    
    
    //Região Centro-Oeste:
    @IBOutlet weak var goias: UILabel!
    
    @IBOutlet weak var matoGrosso: UILabel!
    
    @IBOutlet weak var matoGrossoDoSul: UILabel!
    
    //Região Sudeste:
    @IBOutlet weak var saoPaulo: UILabel!
    
    @IBOutlet weak var minasGerais: UILabel!
    
    @IBOutlet weak var rioDeJaneiro: UILabel!
    
    @IBOutlet weak var espiritoSanto: UILabel!
    
    //Região Sul:
    @IBOutlet weak var parana: UILabel!
    
    @IBOutlet weak var santaCatarina: UILabel!
    
    @IBOutlet weak var rioGrandeDoSul: UILabel!
    
    //Região Nordeste:
    @IBOutlet weak var bahia: UILabel!
    
    @IBOutlet weak var maranhao: UILabel!
    
    @IBOutlet weak var ceara: UILabel!
    
    @IBOutlet weak var piaui: UILabel!
    
    @IBOutlet weak var rioGrandeDoNorte: UILabel!
    
    @IBOutlet weak var paraiba: UILabel!
    
    @IBOutlet weak var pernambuco: UILabel!
    
    @IBOutlet weak var alagoas: UILabel!
    
    @IBOutlet weak var sergipe: UILabel!
    
    
    
    

    lazy var acreFront = ["amazonas","rondonia"]
    lazy var amazonasFront = ["acre","roraima","rondonia","para","matoGrosso"]
    lazy var roraimaFront = ["amazonas","para"]
    lazy var rondoniaFront = ["amazonas","acre","matoGrosso"]
    lazy var paraFront = ["amapa","amazonas","matoGrosso","roraima","maranhao","tocantins"]
    lazy var amapaFront = ["para"]
    lazy var tocantinsFront = ["matoGrosso","para","maranhao","piaui","bahia","goias"]
    
    lazy var matoGrossoFront = ["rondonia","amazonas","para","tocantins","goias","matoGrossoDoSul"]
    lazy var goiasFront = ["tocantins","matoGrosso","matoGrossoDoSul","minasGerais","bahia"]
    lazy var matoGrossoDoSulFront = ["parana","matoGrosso","goias","saoPaulo","minasGerais"]
    
    lazy var saoPauloFront = ["parana","matoGrossoDoSul","minasGerais","rioDeJaneiro"]
    lazy var minasGeraisFront = ["goias","matoGrossoDoSul","saoPaulo","rioDeJaneiro","espiritoSanto","bahia"]
    lazy var rioDeJaneiroFront = ["saoPaulo","espiritoSanto","minasGerais"]
    lazy var espiritoSantoFront = ["bahia","rioDeJaneiro","minasGerais"]
    
    lazy var paranaFront = ["saoPaulo","santaCatarina","matoGrossoDoSul"]
    lazy var santaCatarinaFront = ["parana","rioGrandeDoSul"]
    lazy var rioGrandeDoSulFront = ["santaCatarina"]
    
    lazy var bahiaFront = ["minasGerais","espiritoSanto","goias","tocantins","maranhao","piaui","pernambuco","sergipe","alagoas"]
    lazy var maranhaoFront = ["para","piaui","bahia","tocantins"]
    lazy var piauiFront = ["maranhao","bahia","ceara","pernambuco","tocantins"]
    lazy var cearaFront = ["piaui","rioGrandeDoNorte","paraiba","pernambuco"]
    lazy var rioGrandeDoNorteFront = ["ceara","paraiba"]
    lazy var paraibaFront = ["pernambuco","rioGrandeDoNorte","ceara"]
    lazy var pernambucoFront = ["paraiba","ceara","piaui","bahia","alagoas"]
    lazy var alagoasFront = ["sergipe","bahia","pernambuco"]
    lazy var sergipeFront = ["alagoas","bahia"]
    
    var acreEstado: Estado? = nil
    var amazonasEstado: Estado? = nil
    var roraimaEstado: Estado? = nil
    var rondoniaEstado: Estado? = nil
    var paraEstado: Estado? = nil
    var amapaEstado: Estado? = nil
    var tocantinsEstado: Estado? = nil
    
    var matoGrossoEstado: Estado? = nil
    var goiasEstado: Estado? = nil
    var matoGrossoDoSulEstado: Estado? = nil
    
    var saoPauloEstado: Estado? = nil
    var minasGeraisEstado: Estado? = nil
    var rioDeJaneiroEstado: Estado? = nil
    var espiritoSantoEstado: Estado? = nil
    
    var paranaEstado: Estado? = nil
    var santaCatarinaEstado: Estado? = nil
    var rioGrandeDoSulEstado: Estado? = nil
    
    var bahiaEstado: Estado? = nil
    var maranhaoEstado: Estado? = nil
    var piauiEstado: Estado? = nil
    var cearaEstado: Estado? = nil
    var rioGrandeDoNorteEstado: Estado? = nil
    var paraibaEstado: Estado? = nil
    var pernambucoEstado: Estado? = nil
    var alagoasEstado: Estado? = nil
    var sergipeEstado: Estado? = nil
    
    override func viewDidLoad() {
        var contentRect = CGRect.zero
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size

        self.acreEstado = Estado(nome: "acre", fronteiras: acreFront, label: acre)
        self.amazonasEstado = Estado(nome: "amazonas", fronteiras: amazonasFront, label: amazonas)
        self.roraimaEstado = Estado(nome: "roraima", fronteiras: roraimaFront, label: roraima)
        self.rondoniaEstado = Estado(nome: "rondonia", fronteiras: rondoniaFront , label: rondonia)
        self.paraEstado = Estado(nome: "para", fronteiras: paraFront, label: para)
        self.amapaEstado = Estado(nome: "amapa", fronteiras: amapaFront, label: amapa)
        self.tocantinsEstado = Estado(nome: "tocantins", fronteiras: tocantinsFront, label: tocantins)
        self.matoGrossoEstado = Estado(nome: "matoGrosso", fronteiras: matoGrossoFront, label: matoGrosso)
        self.goiasEstado = Estado(nome: "goias", fronteiras: goiasFront, label: goias)
        self.matoGrossoDoSulEstado = Estado(nome: "matoGrossoDoSul", fronteiras: matoGrossoDoSulFront, label: matoGrossoDoSul)
        self.saoPauloEstado = Estado(nome: "saoPaulo", fronteiras: saoPauloFront, label: saoPaulo)
        self.minasGeraisEstado = Estado(nome: "minasGerais", fronteiras: minasGeraisFront, label: minasGerais)
        self.rioDeJaneiroEstado = Estado(nome: "rioDeJaneiro", fronteiras: rioDeJaneiroFront, label: rioDeJaneiro)
        self.espiritoSantoEstado = Estado(nome: "espiritoSanto", fronteiras: espiritoSantoFront, label: espiritoSanto)
        self.paranaEstado = Estado(nome: "parana", fronteiras: paranaFront, label: parana)
        self.santaCatarinaEstado = Estado(nome: "santaCatarina", fronteiras: santaCatarinaFront, label: santaCatarina)
        self.rioGrandeDoSulEstado = Estado(nome: "rioGrandeDoSul", fronteiras: rioGrandeDoSulFront, label: rioGrandeDoSul)
        self.bahiaEstado = Estado(nome: "bahia", fronteiras: bahiaFront, label: bahia)
        self.maranhaoEstado = Estado(nome: "maranhao", fronteiras: maranhaoFront, label: maranhao)
        self.piauiEstado = Estado(nome: "piaui", fronteiras: piauiFront, label: piaui)
        self.cearaEstado = Estado(nome: "ceara", fronteiras: cearaFront, label: ceara)
        self.rioGrandeDoNorteEstado = Estado(nome: "rioGrandeDoNorte", fronteiras: rioGrandeDoNorteFront, label: rioGrandeDoNorte)
        self.paraibaEstado = Estado(nome: "paraiba", fronteiras: paraibaFront, label: paraiba)
        self.pernambucoEstado = Estado(nome: "pernambuco", fronteiras: pernambucoFront, label: pernambuco)
        self.alagoasEstado = Estado(nome: "alagoas", fronteiras: alagoasFront, label: alagoas)
        self.sergipeEstado = Estado(nome: "sergipe", fronteiras: sergipeFront, label: sergipe)
        
        self.brasil = [acreEstado,amazonasEstado,roraimaEstado,rondoniaEstado,paraEstado,amapaEstado,tocantinsEstado,goiasEstado,matoGrossoEstado,matoGrossoDoSulEstado,saoPauloEstado,minasGeraisEstado,rioDeJaneiroEstado,espiritoSantoEstado,paranaEstado,santaCatarinaEstado,rioGrandeDoSulEstado,bahiaEstado,maranhaoEstado,cearaEstado,piauiEstado,rioGrandeDoNorteEstado,paraibaEstado,pernambucoEstado,alagoasEstado,sergipeEstado] as! [Estado]
    
        
        let tapGestureMapa = UITapGestureRecognizer(target: self, action: #selector(self.mapaSelecionado(gesture:)))
        mapa.addGestureRecognizer(tapGestureMapa)
        mapa.isUserInteractionEnabled = true
        // NORTE
        let tapGestureAcre = UITapGestureRecognizer(target: self, action: #selector(acreSelecionado(gesture:))) //acre
        acreEstado?.estadoLabel.addGestureRecognizer(tapGestureAcre)
        acreEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureAmazonas = UITapGestureRecognizer(target: self, action: #selector(amazonasSelecionada(gesture:))) //amazonas
        amazonasEstado?.estadoLabel.addGestureRecognizer(tapGestureAmazonas)
        amazonasEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureRoraima = UITapGestureRecognizer(target: self, action: #selector(roraimaSelecionado(gesture:))) //roraima
        roraimaEstado?.estadoLabel.addGestureRecognizer(tapGestureRoraima)
        roraimaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureRondonia = UITapGestureRecognizer(target: self, action: #selector(rondoniaSelecionado(gesture:))) //rondonia
        rondoniaEstado?.estadoLabel.addGestureRecognizer(tapGestureRondonia)
        rondoniaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGesturePara = UITapGestureRecognizer(target: self, action: #selector(paraSelecionado(gesture:))) //para
        paraEstado?.estadoLabel.addGestureRecognizer(tapGesturePara)
        paraEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureAmapa = UITapGestureRecognizer(target: self, action: #selector(amapaSelecionado(gesture:))) //amapa
        amapaEstado?.estadoLabel.addGestureRecognizer(tapGestureAmapa)
        amapaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureTocantins = UITapGestureRecognizer(target: self, action: #selector(tocantinsSelecionado(gesture:))) //tocantins
        tocantinsEstado?.estadoLabel.addGestureRecognizer(tapGestureTocantins)
        tocantinsEstado?.estadoLabel.isUserInteractionEnabled = true
        // CENTRO-OESTE
        let tapGestureMatoGrosso = UITapGestureRecognizer(target: self, action: #selector(matoGrossoSelecionado(gesture:))) //matoGrosso
        matoGrossoEstado?.estadoLabel.addGestureRecognizer(tapGestureMatoGrosso)
        matoGrossoEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureGoias = UITapGestureRecognizer(target: self, action: #selector(goiasSelecionado(gesture:))) //goias
        goiasEstado?.estadoLabel.addGestureRecognizer(tapGestureGoias)
        goiasEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureMatoGrossoDoSul = UITapGestureRecognizer(target: self, action: #selector(matoGrossoDoSulSelecionado(gesture:))) //matoGrossoDoSul
        matoGrossoDoSulEstado?.estadoLabel.addGestureRecognizer(tapGestureMatoGrossoDoSul)
        matoGrossoDoSulEstado?.estadoLabel.isUserInteractionEnabled = true
        // SUDESTE
        let tapGestureSaoPaulo = UITapGestureRecognizer(target: self, action: #selector(saoPauloSelecionado(gesture:))) //saoPaulo
        saoPauloEstado?.estadoLabel.addGestureRecognizer(tapGestureSaoPaulo)
        saoPauloEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureMinasGerais = UITapGestureRecognizer(target: self, action: #selector(minasGeraisSelecionado(gesture:))) //minasGerais
        minasGeraisEstado?.estadoLabel.addGestureRecognizer(tapGestureMinasGerais)
        minasGeraisEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureRioDeJaneiro = UITapGestureRecognizer(target: self, action: #selector(rioDeJaneiroSelecionado(gesture:))) //rioDeJaneiro
        rioDeJaneiroEstado?.estadoLabel.addGestureRecognizer(tapGestureRioDeJaneiro)
        rioDeJaneiroEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureEspiritoSanto = UITapGestureRecognizer(target: self, action: #selector(espiritoSantoSelecionado(gesture:))) //espiritoSanto
        espiritoSantoEstado?.estadoLabel.addGestureRecognizer(tapGestureEspiritoSanto)
        espiritoSantoEstado?.estadoLabel.isUserInteractionEnabled = true
        // SUL
        let tapGestureParana = UITapGestureRecognizer(target: self, action: #selector(paranaSelecionado(gesture:))) //parana
        paranaEstado?.estadoLabel.addGestureRecognizer(tapGestureParana)
        paranaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureSantaCatarina = UITapGestureRecognizer(target: self, action: #selector(santaCatarinaSelecionado(gesture:))) //santaCatarina
        santaCatarinaEstado?.estadoLabel.addGestureRecognizer(tapGestureSantaCatarina)
        santaCatarinaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureRioGrandeDoSul = UITapGestureRecognizer(target: self, action: #selector(rioGrandeDoSulSelecionado(gesture:))) //rioGrandeDoSul
        rioGrandeDoSulEstado?.estadoLabel.addGestureRecognizer(tapGestureRioGrandeDoSul)
        rioGrandeDoSulEstado?.estadoLabel.isUserInteractionEnabled = true
        // NORDESTE
        let tapGestureBahia = UITapGestureRecognizer(target: self, action: #selector(bahiaSelecionado(gesture:))) //bahia
        bahiaEstado?.estadoLabel.addGestureRecognizer(tapGestureBahia)
        bahiaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureMaranhao = UITapGestureRecognizer(target: self, action: #selector(maranhaoSelecionado(gesture:))) //maranhao
        maranhaoEstado?.estadoLabel.addGestureRecognizer(tapGestureMaranhao)
        maranhaoEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGesturePiaui = UITapGestureRecognizer(target: self, action: #selector(piauiSelecionado(gesture:))) //piaui
        piauiEstado?.estadoLabel.addGestureRecognizer(tapGesturePiaui)
        piauiEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureCeara = UITapGestureRecognizer(target: self, action: #selector(cearaSelecionado(gesture:))) //ceara
        cearaEstado?.estadoLabel.addGestureRecognizer(tapGestureCeara)
        cearaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureRioGrandeDoNorte = UITapGestureRecognizer(target: self, action: #selector(rioGrandeDoNorteSelecionado(gesture:))) //rioGrandeDoNorte
        rioGrandeDoNorteEstado?.estadoLabel.addGestureRecognizer(tapGestureRioGrandeDoNorte)
        rioGrandeDoNorteEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureParaiba = UITapGestureRecognizer(target: self, action: #selector(paraibaSelecionado(gesture:))) //paraiba
        paraibaEstado?.estadoLabel.addGestureRecognizer(tapGestureParaiba)
        paraibaEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGesturePernambuco = UITapGestureRecognizer(target: self, action: #selector(pernambucoSelecionado(gesture:))) //pernambuco
        pernambucoEstado?.estadoLabel.addGestureRecognizer(tapGesturePernambuco)
        pernambucoEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureAlagoas = UITapGestureRecognizer(target: self, action: #selector(alagoasSelecionado(gesture:))) //alagoas
        alagoasEstado?.estadoLabel.addGestureRecognizer(tapGestureAlagoas)
        alagoasEstado?.estadoLabel.isUserInteractionEnabled = true
        let tapGestureSergipe = UITapGestureRecognizer(target: self, action: #selector(sergipeSelecionado(gesture:))) //sergipe
        sergipeEstado?.estadoLabel.addGestureRecognizer(tapGestureSergipe)
        sergipeEstado?.estadoLabel.isUserInteractionEnabled = true
        
        povoarMapa()
        self.updatePlacar()
        self.updateBonusContinente()
        self.updateTropasDisponiveis()
    
    }
    
func encontraFront(estado: UILabel)->[String]{
    
    switch estado {
    //NORTE
    case acre:
        return acreFront
    case amazonas:
        return amazonasFront
    case roraima:
        return roraimaFront
    case rondonia:
        return rondoniaFront
    case para:
        return paraFront
    case tocantins:
        return tocantinsFront
    // CENTRO-OESTE
    case matoGrosso:
        return matoGrossoFront
    case goias:
        return goiasFront
    case matoGrossoDoSul:
        return matoGrossoDoSulFront
    //SUDESTE
    case saoPaulo:
        return saoPauloFront
    case minasGerais:
        return minasGeraisFront
    case rioDeJaneiro:
        return rioDeJaneiroFront
    case espiritoSanto:
        return espiritoSantoFront
    //SUL
    case parana:
        return paranaFront
    case santaCatarina:
        return santaCatarinaFront
    case rioGrandeDoSul:
        return rioGrandeDoSulFront
    //NORDESTE
    case bahia:
        return bahiaFront
    case maranhao:
        return maranhaoFront
    case pernambuco:
        return pernambucoFront
    case paraiba:
        return paraibaFront
    case piaui:
        return piauiFront
    case ceara:
        return cearaFront
    case alagoas:
        return alagoasFront
    case sergipe:
        return sergipeFront
    case rioGrandeDoNorte:
        return rioGrandeDoNorteFront
    default :
            return []
        
        }
    }
    
    func encontaFrontLabel(estado: UILabel)->[UILabel] {
        if estado == acre {
            return [amazonas,rondonia]
        }
        if estado == amazonas {
            return [acre,roraima,rondonia,para,matoGrosso]
        }
        if estado == roraima {
            return [amazonas,para]
        }
        if estado == rondonia {
            return [amazonas,acre,matoGrosso]
        }
        if estado == para {
            return [amapa,amazonas,matoGrosso,roraima,maranhao,tocantins]
        }
        if estado == tocantins {
            return [matoGrosso,para,maranhao,piaui,bahia,goias]
        }
        // CENTRO-OESTE
        if estado == matoGrosso {
            return [rondonia,amazonas,para,tocantins,goias,matoGrossoDoSul]
        }
        if estado == goias {
            return [tocantins,matoGrosso,matoGrossoDoSul,minasGerais,bahia]
        }
        if estado == matoGrossoDoSul {
            return [parana,matoGrosso,goias,saoPaulo,minasGerais]
        }
        // SUDESTE
        if estado == saoPaulo {
            return [parana,matoGrossoDoSul,minasGerais,rioDeJaneiro]
        }
        if estado == minasGerais {
            return [goias,matoGrossoDoSul,saoPaulo,rioDeJaneiro,espiritoSanto,bahia]
        }
        if estado == rioDeJaneiro {
            return [saoPaulo,espiritoSanto,minasGerais]
        }
        if estado == espiritoSanto {
            return [bahia,rioDeJaneiro,minasGerais]
        }
        // SUL
        if estado == parana {
            return [santaCatarina,saoPaulo,matoGrossoDoSul]
        }
        if estado == santaCatarina {
            return [parana,rioGrandeDoSul]
        }
        if estado == rioGrandeDoSul {
            return [santaCatarina]
        }
        // NORDESTE
        if estado == bahia {
            return [minasGerais,espiritoSanto,goias,tocantins,maranhao,piaui,pernambuco,sergipe,alagoas]
        }
        if estado == maranhao {
            return [para,piaui,bahia,tocantins]
        }
        if estado == piaui {
            return [maranhao,bahia,ceara,pernambuco,tocantins]
        }
        if estado == ceara {
            return [piaui,rioGrandeDoNorte,paraiba,pernambuco]
        }
        if estado == rioGrandeDoNorte {
            return [ceara,paraiba]
        }
        if estado == paraiba {
            return [pernambuco,rioGrandeDoNorte,ceara]
        }
        if estado == pernambuco {
            return [paraiba,ceara,piaui,bahia,alagoas]
        }
        if estado == alagoas {
            return [sergipe,bahia,pernambuco]
        }
        if estado == sergipe {
            return [alagoas,bahia]
        }

        return []
    }
    
    func batalhar(estadoAtacante: UILabel , estadoDefensor: UILabel)->Bool{
        
        self.residuoAtk = 0
        self.residuoDef = 0
        
        //dados
        let dado_atk_1 = Int(arc4random_uniform(5)) //sempre existirá
        let dado_atk_2 = Int(arc4random_uniform(5))
        let dado_atk_3 = Int(arc4random_uniform(5))
        let dado_def_1 = Int(arc4random_uniform(5)) //sempre existirá
        let dado_def_2 = Int(arc4random_uniform(5))
        let dado_def_3 = Int(arc4random_uniform(5))
        
        var totalDadosAtk = Int(estadoAtacante.text!)!-1
        if totalDadosAtk > 3{
            totalDadosAtk = 2
        }
        var totalDadosDef = Int(estadoDefensor.text!)!-1
        if totalDadosDef > 3{
            totalDadosDef = 2
        }
        //batalha 1x1
        if totalDadosAtk == 1 && totalDadosDef == 1{
            if dado_atk_1 > dado_def_1{
                //ganhou batalha 1x1
                residuoDef = 1
                return true
            }
            else{
                //perdeu batalha 1x1
                residuoAtk = 1
                return false
            }
        }
        //batalha 2x1
        if totalDadosAtk == 2 && totalDadosDef == 1{
            let maiorDado = max(dado_atk_1, dado_atk_2)
            if maiorDado > dado_def_1{
                //ganhou batalha 2x1
                residuoDef = 1
                return true
            }else{
                residuoAtk = 1
                return false
            }
        }
        //batalha 3x1
        if totalDadosAtk == 3 && totalDadosDef == 1{
            let maiorDado = max(max(dado_atk_1, dado_atk_2),dado_atk_3)
            if maiorDado > dado_def_1{
                //ganhou batalha 3x1
                residuoDef = 1
                return true
            }else{
                residuoAtk = 1
                //perdeu batalha 3x1
                return false
            }
        }
        //batalha 1x2
        if totalDadosAtk == 1 && totalDadosDef == 2{
            let maiorDado = max(dado_def_1,dado_def_2)
            if dado_atk_1 > maiorDado{
                //ganhou batalha 1x2
                residuoDef = 1
                return true
            }else{
                residuoAtk = 1
                //perdeu batalha 1x2
                return false
            }
        }
        //batalha 1x3
        if totalDadosAtk == 1 && totalDadosDef == 3{
            let maiorDado = max(max(dado_def_1,dado_def_2),dado_def_3)
            if dado_atk_1 > maiorDado{
                //ganhou batalha 1x3
                residuoDef = 1
                return true
            }
            else{
                residuoAtk = 1
                //perdeu batalha 1x3
                return false
            }
        }
        //batalha 2x2
        if totalDadosAtk == 2 && totalDadosDef == 2{
            let maiorDadoAtk = max(dado_atk_1, dado_atk_2)
            let menorDadoAtk = min(dado_atk_1, dado_atk_2)
            let maiorDadoDef = max(dado_def_1, dado_def_2)
            let menorDadoDef = min(dado_def_1, dado_def_2)
            
            if maiorDadoAtk > maiorDadoDef{
                if menorDadoAtk > menorDadoDef{
                    //venceu 2x2
                    residuoDef = 2
                    return true
                }
                else{
                    //venceu 2x2 porem perdeu 1 tropa no ataque, defesa 1
                    residuoAtk = 1
                    residuoDef = 1
                    return true
                }
            }else{
                //maiordadodef > maiordadoatk
                if menorDadoAtk > menorDadoDef{
                    //venceu 2x2 porem perdeu 1 tropa no ataque, defesa 1
                    residuoAtk = 1
                    residuoDef = 1
                    return true
                }else{
                    //perdeu tudo
                    residuoAtk = 2
                    return false
                }
            }
        }
        
        if totalDadosAtk == 3 && totalDadosDef == 3{
            let maiorDadoAtk = max(dado_atk_1,dado_atk_2,dado_atk_3)
            let menorDadoAtk = min(dado_atk_1,dado_atk_2,dado_atk_3)
            var meioDadoAtk = 0
            let vetorDadosAtk = [dado_atk_1,dado_atk_2,dado_atk_3]
            for dado in vetorDadosAtk {
                if(dado >= menorDadoAtk && dado <= maiorDadoAtk){
                    meioDadoAtk = dado
                }
            }
            let maiorDadoDef = max(dado_def_1,dado_def_2,dado_def_3)
            let menorDadoDef = min(dado_def_1,dado_def_2,dado_def_3)
            var meioDadoDef = 0
            let vetorDadosDef = [dado_def_1,dado_def_2,dado_def_3]
            for dado in vetorDadosDef {
                if(dado >= menorDadoDef && dado <= maiorDadoDef){
                    meioDadoDef = dado
                }
            }
            
            if maiorDadoAtk > maiorDadoDef{
                if meioDadoAtk > meioDadoDef{
                    if menorDadoAtk > menorDadoDef{
                        //3x0 pro ataque
                        residuoDef = 3
                        return true
                    }else{
                        //2x1 pro ataque
                        residuoDef = 2
                        residuoAtk = 1
                        return true
                    }
                    
                }else{//do meio do ataque perdeu
                    if menorDadoAtk > menorDadoDef{
                        //2x1 pro ataque
                        residuoDef = 2
                        residuoAtk = 1
                        return true
                    }else{
                        //2x1 pra defesa
                        residuoDef = 1
                        residuoAtk = 2
                        return true
                    }
                }
            }
            else{
                //maior do ataque perdeu
                if meioDadoAtk > meioDadoDef{
                    if menorDadoAtk > menorDadoDef{
                        //2x1 pro ataque
                        residuoDef = 2
                        residuoAtk = 1
                        return true
                    }else{
                        //2x1 pra defesa
                        residuoDef = 1
                        residuoAtk = 2
                        return true
                    }
                }else{
                    if menorDadoAtk > menorDadoDef{
                        //2x1 pra defesa
                        residuoDef = 1
                        residuoAtk = 2
                        return true
                    }else{
                        //3x0 pra defesa
                        residuoAtk = 3
                        return false
                    }
                }
                
            }
            
        }
        return true
    }
    
    func conquistouTerritorioInimigo(territorioConquistado: Estado){
        territorioConquistado.estadoLabel.textColor = UIColor.green
        territorioConquistado.estadoLabel.text = "1"
        
        playerEstados.append(territorioConquistado)
        
        var indice = 0
        for estado in computerEstados{
            if(territorioConquistado.nome == estado.nome){
                break
            }
            indice = indice + 1
        }
        
            computerEstados.remove(at: indice)
       
    }
    
    func conquistouTerritorioPlayer(territorioConquistado: Estado){
        territorioConquistado.estadoLabel.textColor = UIColor.brown
        territorioConquistado.estadoLabel.text = "1"
        
        computerEstados.append(territorioConquistado)
        
        var indice = 0
        for estado in playerEstados{
            if(territorioConquistado.nome == estado.nome){
                break
            }
            indice = indice + 1
        }
        
        playerEstados.remove(at: indice)
        
    }
    
    @IBAction func atacar(_ sender: Any) {
        if playerTurn == true{
            if estadoSelecionado != nil{
                if estadoSelecionado?.estadoLabel.textColor == UIColor.brown{
                    
                    let estadoSelecionadoFront = encontraFront(estado: estadoSelecionado!.estadoLabel)
                    let estadoSelecionadoFrontLabel = encontaFrontLabel(estado: estadoSelecionado!.estadoLabel)
                    
                    let alerta = UIAlertController(title: "Atacar!", message: "Selecione de onde virão as tropas para atacar este estado:", preferredStyle: .actionSheet)
                    
                    for (index, estadoVizinho) in estadoSelecionadoFront.enumerated() {
                        if(estadoSelecionadoFrontLabel[index].text != "1" && estadoSelecionadoFrontLabel[index].textColor != UIColor.brown) {
                            alerta.addAction(UIAlertAction(title: estadoVizinho,style: .default, handler: {
                                (action) in
                                
                                self.ganhouBatalha = self.batalhar(estadoAtacante: estadoSelecionadoFrontLabel[index], estadoDefensor: self.estadoSelecionado!.estadoLabel)
                                
                                if self.ganhouBatalha == true{
                                   
                                    if (self.estadoSelecionado?.estadoLabel.text == "1" || (self.estadoSelecionado?.estadoLabel.text == "2" && self.residuoDef == 2)||(self.estadoSelecionado?.estadoLabel.text == "3" && self.residuoDef == 3)){
                                    self.conquistouTerritorioInimigo(territorioConquistado: self.estadoSelecionado!)
                                
                                        estadoSelecionadoFrontLabel[index].text = String(describing: Int(estadoSelecionadoFrontLabel[index].text!)! - self.residuoAtk)
                                
                                    
                                    self.updatePlacar()
                                    self.updateBonusContinente()
                                    
                                        if self.playerTerritorios.text == "26" {
                                            self.turnLabel.text = "você conquistou o BRASIL!"
                                        
                                            let closure={(action:UIAlertAction!) -> Void in
                                                if self.turnLabel.text == "você conquistou o BRASIL!"{
                                                    self.dismiss(animated: true, completion: nil)
                                                }
                                                else {}
                                            }
                                            
                                            let alerta2 = UIAlertController(title: "Atenção", message: "Você conquistou o BRASIL!", preferredStyle: .actionSheet)
                                            alerta2.addAction(UIAlertAction(title: NSLocalizedString("GG", comment: ""), style: .default, handler: closure))
                                            self.present(alerta2, animated: true, completion: nil)
                                            
                                        
                                        }
                                        
                                       
                                    }//aqui ganhou a batalha porem n conquistou territorio
                                    estadoSelecionadoFrontLabel[index].text = String(describing: Int(estadoSelecionadoFrontLabel[index].text!)! - self.residuoAtk)
                                    self.estadoSelecionado?.estadoLabel.text = String(describing: Int((self.estadoSelecionado?.estadoLabel.text)!)!-self.residuoDef)
                                    
                                }else{
                                    estadoSelecionadoFrontLabel[index].text = String(describing: Int(estadoSelecionadoFrontLabel[index].text!)! - self.residuoAtk)
                                    self.estadoSelecionado?.estadoLabel.text = String(describing: Int((self.estadoSelecionado?.estadoLabel.text)!)!-self.residuoDef)
                                }
                            }))
                        }
                    }
                    
                 
                    
                    
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("Cancelar", comment: ""), style: .default, handler: nil))
                    
                    self.present(alerta, animated: true, completion: nil)
                    
                }
                else{
                    let alerta = UIAlertController(title: "Atenção!", message: "Este estado pertence a você, evite uma guerra civil!", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
            }
            else{
                let alerta = UIAlertController(title: "Atenção!", message: "Selecione um estado antes de atacar!", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alerta, animated: true, completion: nil)
            }

        }
    }
    
    
    @IBAction func moverTropas(_ sender: Any) {
        if playerTurn == true {
            if estadoSelecionado != nil {
                if estadoSelecionado?.estadoLabel.textColor == UIColor.green {
                    let estadoSelecionadoFront = encontraFront(estado: estadoSelecionado!.estadoLabel)
                    let estadoSelecionadoFrontLabel = encontaFrontLabel(estado: estadoSelecionado!.estadoLabel)
                    let alerta = UIAlertController(title: "Mover Tropas", message: "Selecione de onde virão as tropas para este estado:", preferredStyle: .actionSheet)
                    
                    for (index, estadoVizinho) in estadoSelecionadoFront.enumerated() {
                        if(estadoSelecionadoFrontLabel[index].text != "1" && estadoSelecionadoFrontLabel[index].textColor != UIColor.brown) {
                        alerta.addAction(UIAlertAction(title: estadoVizinho,style: .default, handler: {
                            (action) in
                            self.estadoSelecionado?.estadoLabel.text = String(describing: Int((self.estadoSelecionado?.estadoLabel.text)!)!+1)
                            estadoSelecionadoFrontLabel[index].text = String(describing: Int(estadoSelecionadoFrontLabel[index].text!)! - 1)
                        }))
                        }
                    }
                    
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("Cancelar", comment: ""), style: .default, handler: nil))
                    
                    self.present(alerta, animated: true, completion: nil)
                    
                } else {
                    let alerta = UIAlertController(title: "Atenção!", message: "Este estado pertence ao seu inimigo!", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
            } else {
                let alerta = UIAlertController(title: "Atenção!", message: "Selecione um estado antes de posicionar sua tropa!", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alerta, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func posicionarTropas(_ sender: Any) {
        if playerTurn == true {
            if estadoSelecionado != nil {
                if estadoSelecionado?.estadoLabel.textColor == UIColor.green {
                    if tropasDisponiveis.text != "0" {
                        var numeroAtual = Int((estadoSelecionado?.estadoLabel.text)!)!
                        numeroAtual = numeroAtual + 1
                        estadoSelecionado?.estadoLabel.text = String(describing: numeroAtual)
                        tropasDisponiveis.text = String(describing: (Int(tropasDisponiveis.text!)! - 1))
                    } else {
                        let alerta = UIAlertController(title: "Atenção!", message: "Você não possui mais tropas!", preferredStyle: .alert)
                        alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                        self.present(alerta, animated: true, completion: nil)
                    }
                } else {
                    let alerta = UIAlertController(title: "Atenção!", message: "Este estado pertence ao seu inimigo!", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
            } else {
                let alerta = UIAlertController(title: "Atenção!", message: "Selecione um estado antes de posicionar sua tropa!", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alerta, animated: true, completion: nil)
            }
        }
    }
    
    @objc func mapaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UIImageView) != nil {
            estadoSelecionado = nil
            turnLabel.text = "Seu Turno!"
            turnLabel.textColor = UIColor.green
        }
    }
    
     @objc func acreSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = acreEstado
            turnLabel.text = "Selecionado: Acre"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func amazonasSelecionada(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = amazonasEstado
            turnLabel.text = "Selecionado: Amazonas"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func roraimaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = roraimaEstado
            turnLabel.text = "Selecionado: Roraima"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rondoniaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rondoniaEstado
            turnLabel.text = "Selecionado: Rondonia"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func paraSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = paraEstado
            turnLabel.text = "Selecionado: Para"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func amapaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = amapaEstado
            turnLabel.text = "Selecionado: Amapa"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func tocantinsSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = tocantinsEstado
            turnLabel.text = "Selecionado: Tocantins"
            turnLabel.textColor = UIColor.black
        }
    }
    // CENTRO-OESTE
    @objc func matoGrossoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = matoGrossoEstado
            turnLabel.text = "Selecionado: Mato Grosso"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func goiasSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = goiasEstado
            turnLabel.text = "Selecionado: Goias"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func matoGrossoDoSulSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = matoGrossoDoSulEstado
            turnLabel.text = "Selecionado: Mato Grosso do Sul"
            turnLabel.textColor = UIColor.black
        }
    }
    // SUDESTE
    @objc func saoPauloSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = saoPauloEstado
            turnLabel.text = "Selecionado: São Paulo"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func minasGeraisSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = minasGeraisEstado
            turnLabel.text = "Selecionado: Minas Gerais"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rioDeJaneiroSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rioDeJaneiroEstado
            turnLabel.text = "Selecionado: Rio de Janeiro"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func espiritoSantoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = espiritoSantoEstado
            turnLabel.text = "Selecionado: Espírito Santo"
            turnLabel.textColor = UIColor.black
        }
    }
    // SUL
    @objc func paranaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = paranaEstado
            turnLabel.text = "Selecionado: Paraná"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func santaCatarinaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = santaCatarinaEstado
            turnLabel.text = "Selecionado: Santa Catarina"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rioGrandeDoSulSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rioGrandeDoSulEstado
            turnLabel.text = "Selecionado: Rio Grande do Sul"
            turnLabel.textColor = UIColor.black
        }
    }
    // NORDESTE
    @objc func bahiaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = bahiaEstado
            turnLabel.text = "Selecionado: Bahia"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func maranhaoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = maranhaoEstado
            turnLabel.text = "Selecionado: Maranhão"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func piauiSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = piauiEstado
            turnLabel.text = "Selecionado: Piauí"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func cearaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = cearaEstado
            turnLabel.text = "Selecionado: Ceará"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rioGrandeDoNorteSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rioGrandeDoNorteEstado
            turnLabel.text = "Selecionado: Rio Grande do Norte"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func paraibaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = paraibaEstado
            turnLabel.text = "Selecionado: Paraíba"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func pernambucoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = pernambucoEstado
            turnLabel.text = "Selecionado: Pernambuco"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func alagoasSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = alagoasEstado
            turnLabel.text = "Selecionado: Alagoas"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func sergipeSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = sergipeEstado
            turnLabel.text = "Selecionado: Sergipe"
            turnLabel.textColor = UIColor.black
        }
    }
    
/*    @objc func labelEstadoSelecionado(estado: UILabel,gesture: UIGestureRecognizer){
        if ((gesture.view as? UILabel) != nil){
            estadoSelecionado = estado
            turnLabel.text = "Selecionado:" + estado.description
        }
        
    } */
    
    func updateBonusContinente() {
        let bonusNorte = 3
        let bonusCentroOeste = 1
        let bonusSudeste = 2
        let bonusSul = 1
        let bonusNordeste = 4
        
        var totalBonus = 0
        
        if (acre.textColor == UIColor.green && amazonas.textColor == UIColor.green && roraima.textColor == UIColor.green && rondonia.textColor == UIColor.green && amapa.textColor == UIColor.green && para.textColor == UIColor.green && tocantins.textColor == UIColor.green){
            totalBonus = totalBonus + bonusNorte
        }
        if (matoGrosso.textColor == UIColor.green && goias.textColor == UIColor.green && matoGrossoDoSul.textColor == UIColor.green){
            totalBonus = totalBonus + bonusCentroOeste
        }
        
        if (parana.textColor == UIColor.green && rioGrandeDoSul.textColor == UIColor.green && santaCatarina.textColor == UIColor.green){
            totalBonus = totalBonus + bonusSul
        }
        
        if(saoPaulo.textColor == UIColor.green && rioDeJaneiro.textColor == UIColor.green && minasGerais.textColor == UIColor.green && espiritoSanto.textColor == UIColor.green){
            totalBonus = totalBonus + bonusSudeste
        }
        
        if(rioGrandeDoNorte.textColor == UIColor.green && pernambuco.textColor == UIColor.green && paraiba.textColor == UIColor.green && alagoas.textColor == UIColor.green && ceara.textColor == UIColor.green && bahia.textColor == UIColor.green && maranhao.textColor == UIColor.green && piaui.textColor == UIColor.green && sergipe.textColor == UIColor.green){
            
            totalBonus = totalBonus + bonusNordeste
        }
        
        bonusContinente.text = String(describing: totalBonus)
    }
    
    func updateTropasDisponiveis() {
        let totalTropas = playerEstados.count + Int(bonusContinente.text!)!
        tropasDisponiveis.text = String(describing:totalTropas)
    }
    
    func updatePlacar() {
        playerTerritorios.text = String(describing: playerEstados.count)
        computerTerritorios.text = String(describing: computerEstados.count)
    }
    
    func updateLabelsColors(arrayEstados: [Estado],player: Bool){
        for estado in arrayEstados{
        if player == true{
            estado.estadoLabel.textColor = UIColor.green
            }
        else{
            estado.estadoLabel.textColor = UIColor.brown
            }
        }
    }
    
    //esta funcao inicializa todos territorios com no minimo 1 tropa
    func povoarMapa(){
        for estado in brasil{
            estado.estadoLabel.text = "2"
            
            let n = Int(arc4random_uniform(2)) //numero random (0 ou 1)
            if n == 0 {
                estado.estadoLabel.textColor = UIColor.brown
                computerEstados.append(estado)
            } else{estado.estadoLabel.textColor = UIColor.green
                playerEstados.append(estado)
            }
        }
        
            //balanceamento
            if computerEstados.count > playerEstados.count {
                while computerEstados.count != playerEstados.count {
                    let limiteSuperior = computerEstados.count
                    let r = Int(arc4random_uniform(UInt32(limiteSuperior)))
                    //numero random entre 1 e o tamanho do array de computerEstados
        
                    playerEstados.append(computerEstados[r])
                    computerEstados.remove(at: r)
                }
            }
            else if computerEstados.count < playerEstados.count{
                while computerEstados.count != playerEstados.count{
                let limiteSuperior = playerEstados.count
                let r = Int(arc4random_uniform(UInt32(limiteSuperior))) //numero random entre 1 e o tamanho do array de computerEstados

                computerEstados.append(playerEstados[r])
                playerEstados.remove(at: r)
                }
                
            }
        
        self.updateLabelsColors(arrayEstados: playerEstados,player: true)
        self.updateLabelsColors(arrayEstados: computerEstados, player: false)
    }
    
    @IBOutlet weak var passarTurno: UIButton!
    @IBAction func passaTurno(_ sender: Any) {
        
        self.maquinaPosiciona()

        self.maquinaAtaca()
        
        var mensagem = "A MAQUINA terminou de jogar, é sua vez!"
        
        self.updatePlacar()
        if self.playerTerritorios.text == "0" {
            self.turnLabel.text = "você perdeu!"
            mensagem = "Você PERDEU!"
            self.turnLabel.textColor = UIColor.red
        }
        else{ //jogo continua
            self.updateBonusContinente()
            self.updateTropasDisponiveis()
        }
        
        let closure={(action:UIAlertAction!) -> Void in
            if self.turnLabel.text == "você perdeu!"{
                self.dismiss(animated: true, completion: nil)
            }
            else {}
        }
        
        let alerta2 = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .actionSheet)
        alerta2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: closure))
        self.present(alerta2, animated: true, completion: nil)
    }


    
func maquinaPosiciona(){
    var tropasDisponiveisNoTurnoMaquina: Int = 0
    self.calculaBonusContinentMaquina()
    tropasDisponiveisNoTurnoMaquina = self.computerEstados.count + self.maquinaBonus
    
    while (tropasDisponiveisNoTurnoMaquina > 0){
        
        let computerEstadosOrdenados = self.computerEstados.sorted { Int($0.estadoLabel.text!)! < Int($1.estadoLabel.text!)! }
        let estadoMenosPovoado = computerEstadosOrdenados.first
        
        
        estadoMenosPovoado?.estadoLabel.text = String(describing:(Int((estadoMenosPovoado?.estadoLabel.text)!)! + 1))
        tropasDisponiveisNoTurnoMaquina = tropasDisponiveisNoTurnoMaquina - 1
    }
    
}

func calculaBonusContinentMaquina(){
    
    let bonusNorte = 3
    let bonusCentroOeste = 1
    let bonusSudeste = 2
    let bonusSul = 1
    let bonusNordeste = 4
    
    var totalBonus = 0
    
    if (acre.textColor == UIColor.brown && amazonas.textColor == UIColor.brown && roraima.textColor == UIColor.brown && rondonia.textColor == UIColor.brown && amapa.textColor == UIColor.brown && para.textColor == UIColor.brown && tocantins.textColor == UIColor.brown){
        totalBonus = totalBonus + bonusNorte
    }
    if (matoGrosso.textColor == UIColor.brown && goias.textColor == UIColor.brown && matoGrossoDoSul.textColor == UIColor.brown){
        totalBonus = totalBonus + bonusCentroOeste
    }
    
    if (parana.textColor == UIColor.brown && rioGrandeDoSul.textColor == UIColor.brown && santaCatarina.textColor == UIColor.brown){
        totalBonus = totalBonus + bonusSul
    }
    
    if(saoPaulo.textColor == UIColor.brown && rioDeJaneiro.textColor == UIColor.brown && minasGerais.textColor == UIColor.brown && espiritoSanto.textColor == UIColor.brown){
        totalBonus = totalBonus + bonusSudeste
    }
    
    if(rioGrandeDoNorte.textColor == UIColor.brown && pernambuco.textColor == UIColor.brown && paraiba.textColor == UIColor.brown && alagoas.textColor == UIColor.brown && ceara.textColor == UIColor.brown && bahia.textColor == UIColor.brown && maranhao.textColor == UIColor.brown && piaui.textColor == UIColor.brown && sergipe.textColor == UIColor.brown){
        
        totalBonus = totalBonus + bonusNordeste
    }
    
    self.maquinaBonus = totalBonus
    }

    func maquinaAtaca(){
        var maquinaTaBraba = 0 //quando esta braba = 2, tem 50% de chance de atacar
        var computerEstadosOrdenados = self.computerEstados.sorted{ Int($0.estadoLabel.text!)! < Int($1.estadoLabel.text!)! }
   /*     let playerEstadosOrdenados = self.playerEstados.sorted{ Int($0.estadoLabel.text!)! < Int($1.estadoLabel.text!)! }*/
        if(computerEstados.count <= playerEstados.count){maquinaTaBraba = 1
            if(((computerEstados.count)-4) <= playerEstados.count){
                maquinaTaBraba = 2
            }
        }else{
            if computerEstados.count >= 20{
                maquinaTaBraba = 2
            }
        }
        var totalAtks = computerEstados.count + (maquinaTaBraba*3) //numero de ataques escala de acordo com brabeza
        while totalAtks > 0 {
            var triggerAtk =  Int(arc4random_uniform(4)) //0 a 5 , 20% de chance de atacar
            triggerAtk = triggerAtk - maquinaTaBraba //podendo subir até 50% de chance
            if triggerAtk < 0{
                triggerAtk = 0
            }
            
            if triggerAtk == 0{
                
                let fonte = computerEstadosOrdenados.last //obs: sempre tera um no minimo

                if let alvo = escolherAlvo(possiveisAlvos: fronteiraToEstado(fronteiras: (fonte?.fronteiras)!)){
                  
                    self.ganhouBatalha = batalhar(estadoAtacante: (fonte?.estadoLabel)! , estadoDefensor: alvo.estadoLabel)

                    if self.ganhouBatalha == true{
                        
                        if (alvo.estadoLabel.text == "1" || (alvo.estadoLabel.text == "2" && self.residuoDef == 2)||(alvo.estadoLabel.text == "3" && self.residuoDef == 3)){
                            self.conquistouTerritorioPlayer(territorioConquistado: alvo)
                            
                            fonte?.estadoLabel.text = String(describing: Int((fonte?.estadoLabel.text!)!)! - self.residuoDef)
                            
                            self.updatePlacar()
                            self.updateBonusContinente()
                            
                            if self.computerTerritorios.text == "26" {
                                self.turnLabel.text = "você perdeu!"
                            }
                            
                        }//aqui ganhou a batalha porem n conquistou territorio
                        fonte?.estadoLabel.text = String(describing: Int((fonte?.estadoLabel.text!)!)! - self.residuoAtk)
                        alvo.estadoLabel.text = String(describing: Int((alvo.estadoLabel.text)!)!-self.residuoDef)
                        
                    }else{
                        fonte?.estadoLabel.text = String(describing: Int((fonte?.estadoLabel.text!)!)! - self.residuoAtk)
                        alvo.estadoLabel.text = String(describing: Int((alvo.estadoLabel.text)!)!-self.residuoDef)
                    }
                    
                    
                    
                }else{
                    //falhou em encontrar um territorio fonte com alvos validos
               
                    if computerEstadosOrdenados.count > 1{
                        computerEstadosOrdenados.removeLast()
                    }
                 
                    totalAtks = totalAtks + 1
                }
  
                
            }
            totalAtks = totalAtks - 1
        }
        
    }
    
    func escolherAlvo(possiveisAlvos: [Estado])->Estado?{
        var alvosValidos: [Estado] = []
        var alvoEscolhido: Estado? = nil
        for alvo in possiveisAlvos{
            if (alvo.estadoLabel.textColor == UIColor.green){
                alvosValidos.append(alvo)
            }
        }
        alvosValidos = alvosValidos.sorted { Int($0.estadoLabel.text!)! < Int($1.estadoLabel.text!)! }
        alvoEscolhido = alvosValidos.first
        return alvoEscolhido
    }
    
    func fronteiraToEstado(fronteiras: [String])->[Estado]{
        var arrayEstados: [Estado] = []
        for fronteira in fronteiras{
            for estado in self.brasil{
                if fronteira == estado.nome{
                    arrayEstados.append(estado)}
            }
        }
        return arrayEstados
    }
    
}
