//
//  NewlyWord.swift
//  NewlyConinedWord
//
//  Created by JongHoon on 2023/07/25.
//

enum NewlyWord: String {
    case 뉴진스
    case jmt
    case 별다줄
    case 알잘딱깔센
    case 갑분싸
    case 워라벨
    case 일코노미
    case 실매
    
    var mean: String {
        switch self {
        case .뉴진스:          return "뉴진스 뜻은 ,,, ,,,, 입니다."
        case .jmt:           return "마시따"
        case .별다줄:          return "별다줄 뜻은 별거 다 줄인다 입니다."
        case .알잘딱깔센:       return "알잘딱깔센 뜻은 알아서 잘 딱 깔끔하게 입니다."
        case .갑분싸:          return "갑자기 분위기 싸해짐"
        case .워라벨:          return "일과 삶의 균형"
        case .일코노미:        return "1인 가구 확산으로 나타나는 경제 현상"
        case .실매:           return "유튜브에서 실시간 매니저를 뜻합니다."
        }
    }
}
