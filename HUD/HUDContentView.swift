//Created  on 2019/5/14 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 * 内容容器
 */




import UIKit

class HUDContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    init() {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor.cd_hex("0", dark: "f").cd_alpha(0.8)
    }
    
    lazy var view_text: HUDTextView = {
        return HUDTextView().cd.build
    }()
    
    lazy var view_icon: HUDActivityView = {
        return HUDActivityView().cd.build
    }()
    
    var title:String = ""
    var detail:String = ""
    var model:HUD.Model = HUD.modelDefault
}

extension HUDContentView {
    
    func show(_ style:HUD.Style, title:String, detail:String, model:HUD.Model) {
        
        self.title = title
        self.detail = detail
        self.model = model
        
        switch style {
        case .text:
            makeText()
            makeTextLayout(true)
        case .loading, .info, .succeed, .warning, .error, .progress:
            self.cd.add(view_icon)
            view_icon.show(style, model:model)
            if !title.isEmpty || !detail.isEmpty {
                makeText()
                makeTextLayout(false)
                makeIconLayout(false)
            }else{
                makeIconLayout(true)
            }
        case .custom(_):
            break
        }
        
        if model._isBlurEffect {
            self.cd.blurEffect(model._colorBg) { (v) in
                v.cd.corner(model._radius, clips: true)
            }
        }
        if model._isShadow {
            self.cd
                .background(model._colorBg.cd_alpha(1))
                .corner(model._radius, clips: false)
                .shadow(color: model._shadow.0,
                        opacity: model._shadow.1,
                        offset: model._shadow.2,
                        radius: model._shadow.3)
        }
    }
    
    func makeText() {
        self.cd.add(view_text)
        view_text.show(title: title, detail: detail, model: model)
    }
}
