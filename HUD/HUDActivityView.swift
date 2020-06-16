//Created  on 2019/5/14 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 * Loading 活动容器
 */


import UIKit

class HUDActivityView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeDefault()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        makeDefault()
    }
    convenience init() {
        self.init(frame: CGRect.zero)
        
    }
    
    lazy var gifView: UIImageView = {
        return UIImageView().cd.build
    }()
    lazy var label: UILabel = {
        return UILabel().cd.text(NSTextAlignment.center).build
    }()
    lazy var activityView:UIActivityIndicatorView  = {
        let v = UIActivityIndicatorView().cd
            .build
        v.style = .whiteLarge
        v.startAnimating()
        return v
    }()
    lazy var view: UIView = {
        return UIView().cd.build
    }()
    
    lazy var view_proress: HUDProgressView = {
        return HUDProgressView().cd.build
    }()

    var title:String = ""
    var detail:String = ""
    var model:HUD.Model = HUD.modelDefault
}
//MARK:--- Activity ----------
extension HUDActivityView {
    func makeDefault() {
        self.cd.axis(.vertical)
    }
    func show(_ style:HUD.Style = .loading(nil), model:HUD.Model) {
        self.model = model
        switch style {
        case .loading(let l):
            loading(l)
        case .info:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tinfo(iconFontSize).text)
                .text(IconFont.tinfo(iconFontSize).font)
        case .succeed:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tcheck(iconFontSize).text)
                .text(IconFont.tcheck(iconFontSize).font)
        case .warning:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.twarn(iconFontSize).text)
                .text(IconFont.twarn(iconFontSize).font)
        case .error:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tclose(iconFontSize).text)
                .text(IconFont.tclose(iconFontSize).font)
        case .text:
            break
        case .progress(let pro):
            switch pro {
            case .default(let model, let handler):
                view_proress.translatesAutoresizingMaskIntoConstraints = false
                view_proress.heightAnchor.constraint(equalToConstant: 60).isActive = true
                view_proress.widthAnchor.constraint(equalToConstant: 60).isActive = true
                self.cd.addArranged(subview: view_proress)
                view_proress.model = model
                view_proress.handler = handler
            case .view(let v):
                self.cd.addArranged(subview: v)
            }
        case .custom(_):
            break
        }
    }
    
    var iconFontSize:CGFloat {
        return model._axis == .vertical ? 40 : model._fontTitle.pointSize*1.6
    }
    
    func loading(_ style:HUD.Style.Loading?)  {
        let style = style ?? .activity
        switch style {
        case .activity:
            self.cd.addArranged(subview: activityView)
            activityView.style = model._axis == .horizontal ? .white : .whiteLarge
            activityView.color = model._colorActivity
        case .images(let imags, let time, let count):
            self.cd.addArranged(subview: gifView)
            gifView.image = imags.last
            guard imags.count > 0 else{return}
            gifView.animationImages = imags
            gifView.animationDuration = time
            gifView.animationRepeatCount = count
            gifView.startAnimating()
        case .ring:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tloading(iconFontSize).text)
                .text(IconFont.tloading(iconFontSize).font)
            makeRotationAnimotion(label)
        case .diamond:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tload_diamond(iconFontSize).text)
                .text(IconFont.tload_diamond(iconFontSize).font)
            makeRotationAnimotion(label)
        case .brush:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tload_brush(iconFontSize).text)
                .text(IconFont.tload_brush(iconFontSize).font)
            makeRotationAnimotion(label)
        case .roundEyes:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.tload_eyes(iconFontSize).text)
                .text(IconFont.tload_eyes(iconFontSize).font)
            makeRotationAnimotion(label)
        case .arrow:
            self.cd.addArranged(subview: label)
            label.cd
                .text(model._colorActivity)
                .text(IconFont.trefresh(iconFontSize).text)
                .text(IconFont.trefresh(iconFontSize).font)
            makeRotationAnimotion(label)
        case .view(let vv):
            self.cd.addArranged(subview: vv)
        
        }
    }
}


extension HUDActivityView {
    func makeRotationAnimotion(_ view:UIView) {
        let animote = CABasicAnimation(keyPath: "transform.rotation.z")
        animote.duration = 1.5
        animote.isRemovedOnCompletion = false
        animote.fillMode = .forwards
        animote.fromValue = 0
        animote.toValue = CGFloat.pi*2
        animote.repeatCount = HUGE
        view.layer.add(animote, forKey: animote.keyPath)
    }
}

