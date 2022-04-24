//
//  List View.swift
//  VK1.1
//
//  Created by Роман Турьянов on 19.04.2022.
//

import UIKit

enum Alf: Int {
     case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, Aa, Bb, Cc, Dd, Ee
    
     static let allAlf: [Alf] = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, Aa, Bb, Cc, Dd, Ee]
    
     var title: String {
         switch self {
         case .A: return "А"
         case .B: return "Б"
         case .C: return "В"
         case .D: return "Г"
         case .E: return "Д"
         case .F: return "Е"
         case .G: return "Ё"
         case .H: return "Ж"
         case .I: return "З"
         case .J: return "И"
         case .K: return "Й"
         case .L: return "К"
         case .M: return "Л"
         case .N: return "М"
         case .O: return "Н"
         case .P: return "О"
         case .Q: return "П"
         case .R: return "Р"
         case .S: return "С"
         case .T: return "Т"
         case .U: return "У"
         case .V: return "Ф"
         case .W: return "Х"
         case .X: return "Ц"
         case .Y: return "Ч"
         case .Z: return "Ш"
         case .Aa: return "Щ"
         case .Bb: return "Ы"
         case .Cc: return "Э"
         case .Dd: return "Ю"
         case .Ee: return "Я"
         
         }
     }
}
@IBDesignable class AlfPicker: UIControl {
    
  var selectedAlf: Alf? = nil {
      didSet {
         self.updateSelectedAlf()
         self.sendActions(for: .valueChanged)
      }
}
    
private var buttons: [UIButton] = []
private var stackView: UIStackView!
    
override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
}
required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupView()
}
private func setupView() {
    for alf in Alf.allAlf {
        let button = UIButton(type: .system)
        button.setTitle(alf.title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.cyan, for: .selected)
        button.addTarget(self, action: #selector(selectedAlf(_:)), for: .touchUpInside)
        self.buttons.append(button)
}
stackView = UIStackView(arrangedSubviews: self.buttons)
    self.addSubview(stackView)
    
    stackView.spacing = 2
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fillEqually
}
private func updateSelectedAlf() {
    
for (index, button) in self.buttons.enumerated() {
    guard let alf = Alf(rawValue: index) else { continue }
    button.isSelected = alf == self.selectedAlf
   }
}
@objc private func selectedAlf(_ sender: UIButton) {
    guard let index = self.buttons.firstIndex(of: sender) else { return }
    guard let alf = Alf(rawValue: index) else { return }
    self.selectedAlf = alf
}
override func layoutSubviews() {
    super.layoutSubviews()
    stackView.frame = bounds
  }
}
