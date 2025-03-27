//
//  RunnerViewController.swift
//  Runner

import UIKit
import Flutter

protocol RunnerViewControllerDelegate: AnyObject {
    func runnerViewControllerSendMessage(_ viewController: RunnerViewController, result: String?)
}

class RunnerViewController: UIViewController {
    weak var delegate: RunnerViewControllerDelegate?
    let parameters: String?

    init(parameters: String?) {
        self.parameters = parameters
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private lazy var container: UIView = {
        let container = UIView.init(frame: CGRect(x: 150, y: 150, width: 200, height: 200))
        container.backgroundColor = .yellow

        let label = UILabel.init(frame: CGRect(x: 10, y: 10, width: 180, height: 100))
        label.text = parameters
        label.numberOfLines = 0

        container.addSubview(label)
        
        // 結果を返すボタンを追加
        let sendButton = UIButton(type: .system)
        sendButton.frame = CGRect(x: 10, y: 120, width: 180, height: 40)
        sendButton.setTitle("結果を返す", for: .normal)
        sendButton.backgroundColor = .systemBlue
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.layer.cornerRadius = 8
        sendButton.addTarget(self, action: #selector(sendResult), for: .touchUpInside)
        container.addSubview(sendButton)
        
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(container)
        
        // 戻るボタンの追加
        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 20, y: 40, width: 100, height: 40)
        backButton.setTitle("戻る", for: .normal)
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func sendResult() {
        // デリゲートを通じて結果を返す
        delegate?.runnerViewControllerSendMessage(self, result: "ネイティブ画面からの応答")
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}