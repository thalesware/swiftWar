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
    
    @IBOutlet weak var mapa: UIImageView!
    
    var brasil: [UILabel] = []
    
    var playerEstados: [UILabel] = []
    var computerEstados: [UILabel] = []
    
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
        povoarMapa()
        self.updatePlacar()
        self.updateBonusContinente()
        self.updateTropasDisponiveis()
    
    }
    
    func updateBonusContinente(){
        let bonusNorte = 3
        let bonusCentroOeste = 1
        let bonusSudeste = 2
        let bonusSul = 1
        let bonusNordeste = 3
        
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
            estado.text = "1"
            
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
