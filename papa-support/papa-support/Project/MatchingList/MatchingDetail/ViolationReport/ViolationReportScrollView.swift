
import UIKit

class ViolationReportScrollView: UIScrollView {
    
    // vars
    let const: Double = 5
    var iconImageView: UIImageView!
    var label_3: UILabel!
    var textField: UITextField!
    var textView: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentSize = CGSize(width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight * 1.3))
        setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        // label_1
        let label_1 = UILabel(frame: CGRect(x: self.const, y: 0, width: DeviceSize.screenWidth - const, height: DeviceSize.screenWidth / 3))
        label_1.text = " ユーザーの皆様に本サービスを快適にお使い頂くため、本サービスの利用規約に反していると思われるユーザーを発見した場合には、できるだけ具体的に以下のフォームにご記入ください。"
        label_1.numberOfLines = 0
        self.addSubview(label_1)
        // label_2
        let label_2 = UILabel(frame: CGRect(x: self.const, y: DeviceSize.screenWidth / 3, width: DeviceSize.screenWidth - const, height: DeviceSize.navigationbarHeight / 2))
        label_2.text = "違反報告するユーザー"
        label_2.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(label_2)
        // imageView
        iconImageView = UIImageView(frame: CGRect(x: self.const, y: DeviceSize.screenWidth / 3 + DeviceSize.navigationbarHeight / 2, width: DeviceSize.screenWidth / 5, height: DeviceSize.screenWidth / 5))
        iconImageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width * 0.5
        iconImageView.layer.borderColor = UIColor.white.cgColor
        iconImageView.layer.borderWidth = 3
        iconImageView.layer.masksToBounds = true
        self.addSubview(iconImageView)
        // label_3
        label_3 = UILabel()
        label_3.frame = CGRect(x: self.const * 2 + DeviceSize.screenWidth / 5, y: DeviceSize.screenWidth / 3 + DeviceSize.navigationbarHeight / 2 + DeviceSize.screenWidth / 5 / 5 * 2, width: DeviceSize.screenWidth - self.const * 2 + DeviceSize.screenWidth / 5, height: DeviceSize.navigationbarHeight / 2)
        self.addSubview(label_3)
        // label_4
        let label_4 = UILabel()
        label_4.frame = CGRect(x: self.const, y: Double(iconImageView.frame.origin.y + iconImageView.bounds.height) + self.const * 5, width: DeviceSize.screenWidth - self.const, height: DeviceSize.navigationbarHeight / 2)
        label_4.text = "違反個所"
        label_4.font = UIFont.systemFont(ofSize: 20)
        label_4.textColor = UIColor.black
        self.addSubview(label_4)
        // textField
        self.textField = UITextField()
        self.textField.frame = CGRect(x: label_4.frame.origin.x, y: CGFloat(self.const) * 3  + label_4.frame.origin.y + label_4.frame.height, width: CGFloat(DeviceSize.screenWidth) - label_4.frame.origin.x * 2, height: CGFloat(DeviceSize.navigationbarHeight / 2 * 1.4))
        self.textField.layer.borderWidth = 0.5
        self.textField.layer.borderColor = UIColor.black.cgColor
        self.addSubview(self.textField)
        // label_5
        let label_5 = UILabel()
        label_5.frame = CGRect(x: self.const, y: Double(self.textField.frame.origin.y + self.textField.frame.height) + self.const * 6, width: DeviceSize.screenWidth - self.const, height: DeviceSize.navigationbarHeight / 2)
        label_5.text = "具体的な理由"
        label_5.font = UIFont.systemFont(ofSize: 20)
        label_5.textColor = UIColor.black
        self.addSubview(label_5)
        // textView
        self.textView = UITextView()
        self.textView.frame = CGRect(x: label_5.frame.origin.x, y: CGFloat(self.const) * 3  + label_5.frame.origin.y + label_5.frame.height, width: CGFloat(DeviceSize.screenWidth) - label_5.frame.origin.x * 2, height: CGFloat(DeviceSize.navigationbarHeight / 2 * 5.2))
        self.textView.layer.borderWidth = 0.5
        self.textView.layer.borderColor = UIColor.black.cgColor
        self.addSubview(self.textView)
        // label_6
        let label_6 = UILabel()
        label_6.frame = CGRect(x: self.const, y: Double(self.textView.frame.origin.y + self.textView.frame.height) + self.const * 6, width: DeviceSize.screenWidth - self.const, height: DeviceSize.navigationbarHeight / 2)
        label_6.text = "ご注意"
        label_6.font = UIFont.systemFont(ofSize: 20)
        label_6.textColor = UIColor.black
        self.addSubview(label_6)
        // label_7
        let label_7 = UILabel()
        label_7.frame = CGRect(x: CGFloat(self.const), y: CGFloat(self.const) * 3  + label_6.frame.origin.y + label_6.frame.height, width: CGFloat(DeviceSize.screenWidth) - CGFloat(self.const * 2), height: CGFloat(DeviceSize.navigationbarHeight * 5))
        label_7.text = "・運営事務局にて内容を確認し、利用契約に違反する、違反する可能性があると思われる場合には、しかるべき処理をとらせていただきます。\n\n・いただいた報告内容に対して、個別にご回答はできませんのでご了承ください。\n\n・お相手に対する虚偽の違反報告や嫌がらせ目的でのご報告はおやめください。そのような行為をされますと、違反報告者本人がペナルティの対象となる可能性もございます。\n\n・違反報告を受けた人には本サービスから注意喚起の通知をお送りすることがあります。ただし「報告いただいたユーザー様の情報」は通知しません。\n\n・アプリ内メッセージ以外でお相手とのやりとりをされている場合、トラブルが発生した際に運営事務局にて対応できない場合がございます。予めご了承くださいませ。"
        label_7.font = UIFont.systemFont(ofSize: 11)
        label_7.textColor = UIColor.gray
        label_7.numberOfLines = 0
        self.addSubview(label_7)
    }
}
