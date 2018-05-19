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
    //
    
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
    
    override func viewDidLoad() {
        var contentRect = CGRect.zero
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size

        self.brasil = [acre,amazonas,roraima,rondonia,para,amapa,tocantins,goias,matoGrosso,matoGrossoDoSul,saoPaulo,minasGerais,rioDeJaneiro,espiritoSanto,parana,santaCatarina,rioGrandeDoSul,bahia,maranhao,ceara,piaui,rioGrandeDoNorte,paraiba,pernambuco,alagoas,sergipe]
        
        
        let acreFront = [amazonas,rondonia]
        let amazonasFront = [acre,roraima,rondonia,para,matoGrosso]
        let roraimaFront = [amazonas,para]
        let rondoniaFront = [amazonas,acre,matoGrosso]
        let paraFront = [amapa,amazonas,matoGrosso,roraima,maranhao,tocantins]
        let amapaFront = [para]
        let tocantinsFront = [matoGrosso,para,maranhao,piaui,bahia,goias]
        
        let matoGrossoFront = [rondonia,amazonas,para,tocantins,goias,matoGrossoDoSul]
        let goiasFront = [tocantins,matoGrosso,matoGrossoDoSul,minasGerais,bahia]
        let matoGrossoDoSulFront = [parana,matoGrosso,goias,saoPaulo,minasGerais]
        
        let saoPauloFront = [parana,matoGrossoDoSul,minasGerais,rioDeJaneiro]
        let minasGeraisFront = [goias,matoGrossoDoSul,saoPaulo,rioDeJaneiro,espiritoSanto,bahia]
        let rioDeJaneiroFront = [saoPaulo,espiritoSanto,minasGerais]
        let espiritoSantoFront = [bahia,rioDeJaneiro,minasGerais]
        
        let paranaFront = [saoPaulo,santaCatarina,matoGrossoDoSul]
        let santaCatarinaFront = [parana,rioGrandeDoSul]
        let rioGrandeDoSulFront = [santaCatarina]
        
        let bahiaFront = [minasGerais,espiritoSanto,goias,tocantins,maranhao,piaui,pernambuco,sergipe,alagoas]
        let maranhaoFront = [para,piaui,bahia,tocantins]
        let piauiFront = [maranhao,bahia,ceara,pernambuco,tocantins]
        let cearaFront = [piaui,rioGrandeDoNorte,paraiba,pernambuco]
        let rioGrandeDoNorteFront = [ceara,paraiba]
        let paraibaFront = [pernambuco,rioGrandeDoNorte,ceara]
        let pernambucoFront = [paraiba,ceara,piaui,bahia,alagoas]
        let alagoasFront = [sergipe,bahia,pernambuco]
        let sergipeFront = [alagoas,bahia]
        
        let tapGestureMapa = UITapGestureRecognizer(target: self, action: #selector(self.mapaSelecionado(gesture:)))
        mapa.addGestureRecognizer(tapGestureMapa)
        mapa.isUserInteractionEnabled = true
        
        let tapGestureAmazonas = UITapGestureRecognizer(target: self, action: #selector(amazonasSelecionada(gesture:))) //amazonas
        amazonas.addGestureRecognizer(tapGestureAmazonas)
        amazonas.isUserInteractionEnabled = true
        
        povoarMapa()
        self.updatePlacar()
        self.updateBonusContinente()
        self.updateTropasDisponiveis()
    
    }
    



func encontraFront(estado: UILabel)->[String]{
        if estado == amazonas{
            return ["acre","roraima","rondonia","para","matoGrosso"]
        }
    return []
    }
    
    func encontaFrontLabel(estado: UILabel)->[UILabel]{
        if estado == amazonas{
            return [acre,roraima,rondonia,para,matoGrosso]
        }
        return []
    }
        
        
    
    
    
    @IBAction func moverTropas(_ sender: Any) {
        
        if playerTurn == true{
            if estadoSelecionado != nil{
                if estadoSelecionado?.textColor == UIColor.green{
                    
                    let estadoSelecionadoFront = encontraFront(estado: estadoSelecionado!)
                    let estadoSelecionadoFrontLabel = encontaFrontLabel(estado: estadoSelecionado!)
                    
                    let alerta = UIAlertController(title: "Mover Tropas", message: "Selecione de onde virão as tropas para este estado:", preferredStyle: .actionSheet)
                    
                    for (index, estadoVizinho) in estadoSelecionadoFront.enumerated(){
                        
                        if(estadoSelecionadoFrontLabel[index].text != "1" && estadoSelecionadoFrontLabel[index].textColor != UIColor.brown){
                        alerta.addAction(UIAlertAction(title: estadoVizinho,style: .default, handler: {
                            (action) in
                            self.estadoSelecionado?.text = String(describing: Int((self.estadoSelecionado?.text)!)!+1)
                            estadoSelecionadoFrontLabel[index].text = String(describing: Int(estadoSelecionadoFrontLabel[index].text!)! - 1)
                        })
                        )
                        
                        }
                        
                    }
                    
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("Cancelar", comment: ""), style: .default, handler: nil))
                    
                    self.present(alerta, animated: true, completion: nil)
                        
                        
                    
                 /*   alert.addAction(UIAlertAction(title: "", style: .default, handler: { (action) in
                        //execute some code when this option is selected
                        self.skinType = “Fair Skin”
                    }))
                    alert.addAction(UIAlertAction(title: “Dark Skin”, style: .default, handler: { (action) in
                        //execute some code when this option is selected
                        self.skinType = “Dark Skin”
                    }))*/
                    
                  /*  alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alerta, animated: true, completion: nil)*/
                    
                    
                }else{
                    let alerta = UIAlertController(title: "Atenção!", message: "Este estado pertence ao seu inimigo!", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
            }else{
                let alerta = UIAlertController(title: "Atenção!", message: "Selecione um estado antes de posicionar sua tropa!", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alerta, animated: true, completion: nil)
            }
        }
    }
        
    
    
    
    
    @IBAction func posicionarTropas(_ sender: Any) {
        if playerTurn == true{
            if estadoSelecionado != nil{
                if estadoSelecionado?.textColor == UIColor.green{
                    if tropasDisponiveis.text != "0"{
                        var numeroAtual = Int((estadoSelecionado?.text)!)!
                        numeroAtual = numeroAtual + 1
                        estadoSelecionado?.text = String(describing: numeroAtual)
                        tropasDisponiveis.text = String(describing: (Int(tropasDisponiveis.text!)! - 1))
                    }
                    else{
                        let alerta = UIAlertController(title: "Atenção!", message: "Você não possui mais tropas!", preferredStyle: .alert)
                        alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                        self.present(alerta, animated: true, completion: nil)
                    }
                    
                }
                else {
                    let alerta = UIAlertController(title: "Atenção!", message: "Este estado pertence ao seu inimigo!", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
                
                
            }else{
                let alerta = UIAlertController(title: "Atenção!", message: "Selecione um estado antes de posicionar sua tropa!", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alerta, animated: true, completion: nil)
            }
        }
    }
    
    @objc func mapaSelecionado(gesture: UIGestureRecognizer){
        if(gesture.view as? UIImageView) != nil{
            estadoSelecionado = nil
            turnLabel.text = "Seu Turno!"
            turnLabel.textColor = UIColor.green
        }
    }
    
     @objc func amazonasSelecionada(gesture: UIGestureRecognizer){
        if(gesture.view as? UILabel) != nil {
            estadoSelecionado = amazonas
            turnLabel.text = "Selecionado: Amazonas"
            turnLabel.textColor = UIColor.black
        }
    }
    
/*    @objc func labelEstadoSelecionado(estado: UILabel,gesture: UIGestureRecognizer){
        if ((gesture.view as? UILabel) != nil){
            estadoSelecionado = estado
            turnLabel.text = "Selecionado:" + estado.description
        }
        
    } */
    
    func updateBonusContinente(){
        let bonusNorte = 3
        let bonusCentroOeste = 1
        let bonusSudeste = 2
        let bonusSul = 1
        let bonusNordeste = 4
        
        var totalBonus = 0
        
        if (acre.textColor == UIColor.green && amazonas.textColor == UIColor.green && roraima.textColor == UIColor.green && rondonia.textColor == UIColor.green && amapa.textColor == UIColor.green && para.textColor == UIColor.green){
            totalBonus = totalBonus + bonusNorte
        }
        if (matoGrosso.textColor == UIColor.green && goias.textColor == UIColor.green && matoGrossoDoSul.textColor == UIColor.green){
            totalBonus = totalBonus + bonusCentroOeste
        }
        //todo: fazer os outros bonus
        
        
        bonusContinente.text = String(describing: totalBonus)
    }
    func updateTropasDisponiveis(){
        let totalTropas = playerEstados.count + Int(bonusContinente.text!)!
        tropasDisponiveis.text = String(describing:totalTropas)
    }
    
    func updatePlacar(){
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
            if n == 0{
                estado.textColor = UIColor.brown
                computerEstados.append(estado)
            }else{estado.textColor = UIColor.green
                playerEstados.append(estado)
            }
        }
        
            //balanceamento
            if computerEstados.count > playerEstados.count{

                while computerEstados.count != playerEstados.count{
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
