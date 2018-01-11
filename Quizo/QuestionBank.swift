//
//  QuestionBank.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class QuestionBank: NSObject {
    
    static var bank=["Science":["Easy":[Question(question:"CNG stands for?", options:["Converted Natural Gas","Conduced Natural Gas","Conducted Natural Gas","Compressed Natural Gas"], answer:"Compressed Natural Gas"),
                                        Question(question:"The lifespan of White Blood Cells is __________ day(s).", options:["1","2","3","4"], answer:"1"),
                                        Question(question:"When white light is passed through a prism, it splits into __________ colours.", options:["5","6","7","8"], answer:"6"),
                                        Question(question:"1 nanometer = ?", options:["10-3 meter","10-6 meter","10-9 meter","10-12 meter"], answer:"10-9 meter"),
                                        Question(question:"Instrument used for measuring very high temperature is", options:["Pyroscope","Pyrometer","Seismograph","Xylometer"], answer:"Pyrometer"),
                                        Question(question:"Sound waves are _________ waves.", options:["Transverse","Electromagnetic","Longitudinal","none of these"], answer:"Longitudinal")],
                                
                                "Hard":[Question(question:"The fluid part of blood is known as", options:["plasma","platelets","blood cells","hormones"], answer:"plasma"),
                                        Question(question:"X-rays were discovered by", options:["Rontgen","Thomson","Rutherford","Bacquerel"], answer:"Rontgen"),
                                        Question(question:"The speed of light is", options:["280,000 km/s","300,000 km/s","320,000 km/s","none of these"], answer:"300,000 km/s"),
                                        Question(question:"1 nanometer = ?", options:["10-3 meter","10-6 meter","10-9 meter","10-12 meter"], answer:"10-9 meter"),
                                        Question(question:"Instrument used for measuring very high temperature is", options:["Pyroscope","Pyrometer","Seismograph","Xylometer"], answer:"Pyrometer")]],
                     
                     
                     "Knowledge":["Easy":[Question(question:"The deepest point in the world is", options:["Dead Sea","South Pole","Mariana Trench","Sinai Peninsula"], answer:"Mariana Trench"),
                                        Question(question:"The Mariana Trench is in the __________ Ocean.", options:["Atlantic","Arctic","Antarctic","Pacific"], answer:"Pacific"),
                                        Question(question:"The depth of the Mariana Trench is __________ meters.", options:["10,011","10,411","10,611","10,911"], answer:"10,911"),
                                        Question(question:"Panama (a country) connects the two continents", options:["Asia and Europe","Asia and Africa","South America and North America","Asia and Australia"], answer:"South America and North America"),
                                        Question(question:"Turkey connects the two continents", options:["Asia and Europe","Asia and Africa","South America and North America","Asia and Australia"], answer:"Asia and Europe")],
                                
                                "Hard":[Question(question:"Egypt connects the two continents", options:["Asia and Europe","Asia and Africa","South America and North America","Asia and Australia"], answer:"Asia and Africa"),
                                        Question(question:"The Panama Canal in Panama is a man-made 77 km waterway that connects", options:["Atlantic Ocean and Pacific Ocean","Atlantic Ocean and Arctic","Arctic Ocean and Antarctic Ocean","Pacific Ocean and Arctic Ocean"], answer:"Atlantic Ocean and Pacific Ocean"),
                                        Question(question:"The Engadin Valley is located in", options:["Switzerland","Portugal","Turkey","Egypt"], answer:"Switzerland"),
                                        Question(question:"The Pico Island is located in", options:["Switzerland","Portugal","Turkey","Egypt"], answer:"Portugal"),
                                        Question(question:" Sultan Ahmed Mosque in Istanbul is popularly known as the", options:["Green Mosque","Blue Mosque","Red Mosque","Yellow Mosque"], answer:"Blue Mosque")]]]
    
}
