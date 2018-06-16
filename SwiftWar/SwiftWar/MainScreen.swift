//
//  MainScreen.swift
//  SwiftWar
//
//  Created by i9access on 16/05/18.
//  Copyright © 2018 i9access. All rights reserved.
//

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
   
    var brasil: [UILabel] = []
    
    var playerTurn: Bool = true
    var playerEstados: [UILabel] = []
    var computerEstados: [UILabel] = []
    var ganhouBatalha: Bool = false
    
    var estadoSelecionado: UILabel? = nil
    
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
    
    override func viewDidLoad() {
        var contentRect = CGRect.zero
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size

        self.brasil = [acre,amazonas,roraima,rondonia,para,amapa,tocantins,goias,matoGrosso,matoGrossoDoSul,saoPaulo,minasGerais,rioDeJaneiro,espiritoSanto,parana,santaCatarina,rioGrandeDoSul,bahia,maranhao,ceara,piaui,rioGrandeDoNorte,paraiba,pernambuco,alagoas,sergipe]
    
        
        let tapGestureMapa = UITapGestureRecognizer(target: self, action: #selector(self.mapaSelecionado(gesture:)))
        mapa.addGestureRecognizer(tapGestureMapa)
        mapa.isUserInteractionEnabled = true
        // NORTE
        let tapGestureAcre = UITapGestureRecognizer(target: self, action: #selector(acreSelecionado(gesture:))) //acre
        acre.addGestureRecognizer(tapGestureAcre)
        acre.isUserInteractionEnabled = true
        let tapGestureAmazonas = UITapGestureRecognizer(target: self, action: #selector(amazonasSelecionada(gesture:))) //amazonas
        amazonas.addGestureRecognizer(tapGestureAmazonas)
        amazonas.isUserInteractionEnabled = true
        let tapGestureRoraima = UITapGestureRecognizer(target: self, action: #selector(roraimaSelecionado(gesture:))) //roraima
        roraima.addGestureRecognizer(tapGestureRoraima)
        roraima.isUserInteractionEnabled = true
        let tapGestureRondonia = UITapGestureRecognizer(target: self, action: #selector(rondoniaSelecionado(gesture:))) //rondonia
        rondonia.addGestureRecognizer(tapGestureRondonia)
        rondonia.isUserInteractionEnabled = true
        let tapGesturePara = UITapGestureRecognizer(target: self, action: #selector(paraSelecionado(gesture:))) //para
        para.addGestureRecognizer(tapGesturePara)
        para.isUserInteractionEnabled = true
        let tapGestureAmapa = UITapGestureRecognizer(target: self, action: #selector(amapaSelecionado(gesture:))) //amapa
        amapa.addGestureRecognizer(tapGestureAmapa)
        amapa.isUserInteractionEnabled = true
        let tapGestureTocantins = UITapGestureRecognizer(target: self, action: #selector(tocantinsSelecionado(gesture:))) //tocantins
        tocantins.addGestureRecognizer(tapGestureTocantins)
        tocantins.isUserInteractionEnabled = true
        // CENTRO-OESTE
        let tapGestureMatoGrosso = UITapGestureRecognizer(target: self, action: #selector(matoGrossoSelecionado(gesture:))) //matoGrosso
        matoGrosso.addGestureRecognizer(tapGestureMatoGrosso)
        matoGrosso.isUserInteractionEnabled = true
        let tapGestureGoias = UITapGestureRecognizer(target: self, action: #selector(goiasSelecionado(gesture:))) //goias
        goias.addGestureRecognizer(tapGestureGoias)
        goias.isUserInteractionEnabled = true
        let tapGestureMatoGrossoDoSul = UITapGestureRecognizer(target: self, action: #selector(matoGrossoDoSulSelecionado(gesture:))) //matoGrossoDoSul
        matoGrossoDoSul.addGestureRecognizer(tapGestureMatoGrossoDoSul)
        matoGrossoDoSul.isUserInteractionEnabled = true
        // SUDESTE
        let tapGestureSaoPaulo = UITapGestureRecognizer(target: self, action: #selector(saoPauloSelecionado(gesture:))) //saoPaulo
        saoPaulo.addGestureRecognizer(tapGestureSaoPaulo)
        saoPaulo.isUserInteractionEnabled = true
        let tapGestureMinasGerais = UITapGestureRecognizer(target: self, action: #selector(minasGeraisSelecionado(gesture:))) //minasGerais
        minasGerais.addGestureRecognizer(tapGestureMinasGerais)
        minasGerais.isUserInteractionEnabled = true
        let tapGestureRioDeJaneiro = UITapGestureRecognizer(target: self, action: #selector(rioDeJaneiroSelecionado(gesture:))) //rioDeJaneiro
        rioDeJaneiro.addGestureRecognizer(tapGestureRioDeJaneiro)
        rioDeJaneiro.isUserInteractionEnabled = true
        let tapGestureEspiritoSanto = UITapGestureRecognizer(target: self, action: #selector(espiritoSantoSelecionado(gesture:))) //espiritoSanto
        espiritoSanto.addGestureRecognizer(tapGestureEspiritoSanto)
        espiritoSanto.isUserInteractionEnabled = true
        // SUL
        let tapGestureParana = UITapGestureRecognizer(target: self, action: #selector(paranaSelecionado(gesture:))) //parana
        parana.addGestureRecognizer(tapGestureParana)
        parana.isUserInteractionEnabled = true
        let tapGestureSantaCatarina = UITapGestureRecognizer(target: self, action: #selector(santaCatarinaSelecionado(gesture:))) //santaCatarina
        santaCatarina.addGestureRecognizer(tapGestureSantaCatarina)
        santaCatarina.isUserInteractionEnabled = true
        let tapGestureRioGrandeDoSul = UITapGestureRecognizer(target: self, action: #selector(rioGrandeDoSulSelecionado(gesture:))) //rioGrandeDoSul
        rioGrandeDoSul.addGestureRecognizer(tapGestureRioGrandeDoSul)
        rioGrandeDoSul.isUserInteractionEnabled = true
        // NORDESTE
        let tapGestureBahia = UITapGestureRecognizer(target: self, action: #selector(bahiaSelecionado(gesture:))) //bahia
        bahia.addGestureRecognizer(tapGestureBahia)
        bahia.isUserInteractionEnabled = true
        let tapGestureMaranhao = UITapGestureRecognizer(target: self, action: #selector(maranhaoSelecionado(gesture:))) //maranhao
        maranhao.addGestureRecognizer(tapGestureMaranhao)
        maranhao.isUserInteractionEnabled = true
        let tapGesturePiaui = UITapGestureRecognizer(target: self, action: #selector(piauiSelecionado(gesture:))) //piaui
        piaui.addGestureRecognizer(tapGesturePiaui)
        piaui.isUserInteractionEnabled = true
        let tapGestureCeara = UITapGestureRecognizer(target: self, action: #selector(cearaSelecionado(gesture:))) //ceara
        ceara.addGestureRecognizer(tapGestureCeara)
        ceara.isUserInteractionEnabled = true
        let tapGestureRioGrandeDoNorte = UITapGestureRecognizer(target: self, action: #selector(rioGrandeDoNorteSelecionado(gesture:))) //rioGrandeDoNorte
        rioGrandeDoNorte.addGestureRecognizer(tapGestureRioGrandeDoNorte)
        rioGrandeDoNorte.isUserInteractionEnabled = true
        let tapGestureParaiba = UITapGestureRecognizer(target: self, action: #selector(paraibaSelecionado(gesture:))) //paraiba
        paraiba.addGestureRecognizer(tapGestureParaiba)
        paraiba.isUserInteractionEnabled = true
        let tapGesturePernambuco = UITapGestureRecognizer(target: self, action: #selector(pernambucoSelecionado(gesture:))) //pernambuco
        pernambuco.addGestureRecognizer(tapGesturePernambuco)
        pernambuco.isUserInteractionEnabled = true
        let tapGestureAlagoas = UITapGestureRecognizer(target: self, action: #selector(alagoasSelecionado(gesture:))) //alagoas
        alagoas.addGestureRecognizer(tapGestureAlagoas)
        alagoas.isUserInteractionEnabled = true
        let tapGestureSergipe = UITapGestureRecognizer(target: self, action: #selector(sergipeSelecionado(gesture:))) //sergipe
        sergipe.addGestureRecognizer(tapGestureSergipe)
        sergipe.isUserInteractionEnabled = true
        
        povoarMapa()
        self.updatePlacar()
        self.updateBonusContinente()
        self.updateTropasDisponiveis()
    
    }
    
// todo fazer func para transformar as variaveis <estado>Front em array de string
func encontraFront(estado: UILabel)->[String]{
    // NORTE
    if estado == acre {
        return acreFront
    }
    if estado == amazonas {
        return amazonasFront
    }
    if estado == roraima {
        return roraimaFront
    }
    if estado == rondonia {
        return rondoniaFront
    }
    if estado == para {
        return paraFront
    }
    if estado == tocantins {
        return tocantinsFront
    }
    // CENTRO-OESTE
    if estado ==  matoGrosso {
        return matoGrossoFront
    }
    if estado == goias {
        return goiasFront
    }
    if estado == matoGrossoDoSul {
        return matoGrossoDoSulFront
    }
    // SUDESTE
    if estado == saoPaulo {
        return saoPauloFront
    }
    if estado == minasGerais {
        return minasGeraisFront
    }
    if estado == rioDeJaneiro {
        return rioDeJaneiroFront
    }
    if estado == espiritoSanto {
        return espiritoSantoFront
    }
    // SUL
    if estado == parana {
        return paranaFront
    }
    if estado == santaCatarina {
        return santaCatarinaFront
    }
    if estado == rioGrandeDoSul {
        return rioGrandeDoSulFront
    }
    // NORDESTE
    if estado == bahia {
        return bahiaFront
    }
    if estado == maranhao {
        return maranhaoFront
    }
    if estado == ceara {
        return cearaFront
    }
    if estado == piaui {
        return piauiFront
    }
    if estado == rioGrandeDoNorte {
        return rioGrandeDoNorteFront
    }
    if estado == paraiba {
        return paraibaFront
    }
    if estado == pernambuco {
        return pernambucoFront
    }
    if estado == alagoas {
        return alagoasFront
    }
    if estado == sergipe {
        return sergipeFront
    }
    
    return []
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
    
    func conquistouTerritorioInimigo(territorioConquistado: UILabel){
        territorioConquistado.textColor = UIColor.green
        territorioConquistado.text = "1"
        
        playerEstados.append(territorioConquistado)
        
        if let index = computerEstados.index(of: territorioConquistado) {
            computerEstados.remove(at: index)
        }
    }
    
    @IBAction func atacar(_ sender: Any) {
        if playerTurn == true{
            if estadoSelecionado != nil{
                if estadoSelecionado?.textColor == UIColor.brown{
                    
                    let estadoSelecionadoFront = encontraFront(estado: estadoSelecionado!)
                    let estadoSelecionadoFrontLabel = encontaFrontLabel(estado: estadoSelecionado!)
                    
                    let alerta = UIAlertController(title: "Atacar!", message: "Selecione de onde virão as tropas para atacar este estado:", preferredStyle: .actionSheet)
                    
                    for (index, estadoVizinho) in estadoSelecionadoFront.enumerated() {
                        if(estadoSelecionadoFrontLabel[index].text != "1" && estadoSelecionadoFrontLabel[index].textColor != UIColor.brown) {
                            alerta.addAction(UIAlertAction(title: estadoVizinho,style: .default, handler: {
                                (action) in
                                
                                //TODO: criar funcao de rolar dados
                                self.ganhouBatalha = true
                                
                                if self.ganhouBatalha == true{
                                    self.conquistouTerritorioInimigo(territorioConquistado: self.estadoSelecionado!)
                                
                                    estadoSelecionadoFrontLabel[index].text = String(describing: Int(estadoSelecionadoFrontLabel[index].text!)! - 1)
                                
                                    
                                    self.updatePlacar()
                                    self.updateBonusContinente()
                                    
                                }else{ //TODO tratar quando perde a batalha
                                    print("perdeu batalha")
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
                if estadoSelecionado?.textColor == UIColor.green {
                    let estadoSelecionadoFront = encontraFront(estado: estadoSelecionado!)
                    let estadoSelecionadoFrontLabel = encontaFrontLabel(estado: estadoSelecionado!)
                    let alerta = UIAlertController(title: "Mover Tropas", message: "Selecione de onde virão as tropas para este estado:", preferredStyle: .actionSheet)
                    
                    for (index, estadoVizinho) in estadoSelecionadoFront.enumerated() {
                        if(estadoSelecionadoFrontLabel[index].text != "1" && estadoSelecionadoFrontLabel[index].textColor != UIColor.brown) {
                        alerta.addAction(UIAlertAction(title: estadoVizinho,style: .default, handler: {
                            (action) in
                            self.estadoSelecionado?.text = String(describing: Int((self.estadoSelecionado?.text)!)!+1)
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
                if estadoSelecionado?.textColor == UIColor.green {
                    if tropasDisponiveis.text != "0" {
                        var numeroAtual = Int((estadoSelecionado?.text)!)!
                        numeroAtual = numeroAtual + 1
                        estadoSelecionado?.text = String(describing: numeroAtual)
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
            estadoSelecionado = acre
            turnLabel.text = "Selecionado: Acre"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func amazonasSelecionada(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = amazonas
            turnLabel.text = "Selecionado: Amazonas"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func roraimaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = roraima
            turnLabel.text = "Selecionado: Roraima"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rondoniaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rondonia
            turnLabel.text = "Selecionado: Rondonia"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func paraSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = para
            turnLabel.text = "Selecionado: Para"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func amapaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = amapa
            turnLabel.text = "Selecionado: Amapa"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func tocantinsSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = tocantins
            turnLabel.text = "Selecionado: Tocantins"
            turnLabel.textColor = UIColor.black
        }
    }
    // CENTRO-OESTE
    @objc func matoGrossoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = matoGrosso
            turnLabel.text = "Selecionado: Mato Grosso"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func goiasSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = goias
            turnLabel.text = "Selecionado: Goias"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func matoGrossoDoSulSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = matoGrossoDoSul
            turnLabel.text = "Selecionado: Mato Grosso do Sul"
            turnLabel.textColor = UIColor.black
        }
    }
    // SUDESTE
    @objc func saoPauloSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = saoPaulo
            turnLabel.text = "Selecionado: São Paulo"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func minasGeraisSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = minasGerais
            turnLabel.text = "Selecionado: Minas Gerais"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rioDeJaneiroSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rioDeJaneiro
            turnLabel.text = "Selecionado: Rio de Janeiro"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func espiritoSantoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = espiritoSanto
            turnLabel.text = "Selecionado: Espírito Santo"
            turnLabel.textColor = UIColor.black
        }
    }
    // SUL
    @objc func paranaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = parana
            turnLabel.text = "Selecionado: Paraná"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func santaCatarinaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = santaCatarina
            turnLabel.text = "Selecionado: Santa Catarina"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rioGrandeDoSulSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rioGrandeDoSul
            turnLabel.text = "Selecionado: Rio Grande do Sul"
            turnLabel.textColor = UIColor.black
        }
    }
    // NORDESTE
    @objc func bahiaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = bahia
            turnLabel.text = "Selecionado: Bahia"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func maranhaoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = maranhao
            turnLabel.text = "Selecionado: Maranhão"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func piauiSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = piaui
            turnLabel.text = "Selecionado: Piauí"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func cearaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = ceara
            turnLabel.text = "Selecionado: Ceará"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func rioGrandeDoNorteSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = rioGrandeDoNorte
            turnLabel.text = "Selecionado: Rio Grande do Norte"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func paraibaSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = paraiba
            turnLabel.text = "Selecionado: Paraíba"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func pernambucoSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = pernambuco
            turnLabel.text = "Selecionado: Pernambuco"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func alagoasSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = alagoas
            turnLabel.text = "Selecionado: Alagoas"
            turnLabel.textColor = UIColor.black
        }
    }
    @objc func sergipeSelecionado(gesture: UIGestureRecognizer) {
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = sergipe
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
        //todo: fazer os outros bonus
        
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
    
    func updateLabelsColors(arrayEstados: [UILabel],player: Bool){
        for estado in arrayEstados{
        if player == true{
            estado.textColor = UIColor.green
            }
        else{
            estado.textColor = UIColor.brown
            }
        }
    }
    
    //esta funcao inicializa todos territorios com no minimo 1 tropa
    func povoarMapa(){
        for estado in brasil{
            estado.text = "2"
            
            let n = Int(arc4random_uniform(2)) //numero random (0 ou 1)
            if n == 0 {
                estado.textColor = UIColor.brown
                computerEstados.append(estado)
            } else{estado.textColor = UIColor.green
                playerEstados.append(estado)
            }
        }
        
            //balanceamento
            if computerEstados.count > playerEstados.count {
                while computerEstados.count != playerEstados.count {
                    let limiteSuperior = computerEstados.count
                    print(limiteSuperior)
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
    
 
    
}
