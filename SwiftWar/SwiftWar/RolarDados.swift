//
//  RolarDados.swift
//  SwiftWar
//
//  Created by i9access on 16/06/18.
//  Copyright © 2018 i9access. All rights reserved.
//

import Foundation

class RolarDados {
    
    var estadoAtacante: UILabel
    var estadoDefensor: UILabel
    var ganhouBatalha: Bool
    var residuoAtk: Int
    var residuoDef: Int
    
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
            totalDadosAtk = 3
        }
        var totalDadosDef = Int(estadoDefensor.text!)!-1
        if totalDadosDef > 3{
            totalDadosDef = 3
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
                    //venceu 2x2 porem perdeu 1 tropa no ataque, defesa 2
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
                }else{
                    //perdeu tudo
                    residuoAtk = 2
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
                    }else{
                        //2x1 pro ataque
                        residuoDef = 2
                        residuoAtk = 1
                    }
                    
                }else{//do meio do ataque perdeu
                    if menorDadoAtk > menorDadoDef{
                        //2x1 pro ataque
                        residuoDef = 2
                        residuoAtk = 1
                    }else{
                        //2x1 pra defesa
                        residuoDef = 1
                        residuoAtk = 2
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
                    }else{
                        //2x1 pra defesa
                        residuoDef = 1
                        residuoAtk = 2
                    }
                }else{
                    if menorDadoAtk > menorDadoDef{
                        //2x1 pra defesa
                        residuoDef = 1
                        residuoAtk = 2
                    }else{
                        //3x0 pra defesa
                        residuoAtk = 3
                    }
                }
                
            }
            
        }
        return true
    }
    
}
