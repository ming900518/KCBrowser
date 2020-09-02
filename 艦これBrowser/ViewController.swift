//
//  ViewController.swift
//  艦これBrowser
//
//  Created by Ming Chang on 5/10/20.
//  Copyright © 2020 Ming Chang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        UIApplication.shared.isIdleTimerDisabled = true
        super.viewDidLoad()
        self.webView.uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Setting.getdefaultLogin() == 0 {
            self.showMessage()
        } else {
            if Setting.getdefaultLogin() == 1 {
                self.webView.load(URLRequest.init(url: URL.init(string: "http://www.dmm.com/netgame/social/-/gadgets/=/app_id=854854/")!))
            } else if Setting.getdefaultLogin() == 2 {
                self.webView.load(URLRequest.init(url: URL.init(string: "http://ooi.moe")!))
            }
        }
    }
    
    
    func showMessage() {
        let url1 = String("http://www.dmm.com/netgame/social/-/gadgets/=/app_id=854854/")
        let url2 = String("http://ooi.moe")
        let startupAlert = UIAlertController(title: "連接方式", message: "請選擇預設連接方式", preferredStyle: .alert)
        startupAlert.addAction(UIAlertAction(title: "DMM", style: .default) { action in
            let request = URLRequest.init(url: URL.init(string: url1)!)
            self.webView.load(request)
            self.webView.load(request)
            Setting.savedefaultLogin(value: 1)
        })
        startupAlert.addAction(UIAlertAction(title: "OOI", style: .default) { action in
            let request = URLRequest.init(url: URL.init(string: url2)!)
            self.webView.load(request)
            Setting.savedefaultLogin(value: 2)
        })
        startupAlert.addAction(UIAlertAction(title: "離開", style: .cancel) { action in
            if self.webView.url == nil {
                exit(0)
            }
        })
        self.present(startupAlert, animated: true)
    }
    
    @IBAction func reloadBtn() {
        let refreshAlert = UIAlertController(title: "確認重新整理", message: nil, preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title: "確定", style: .destructive) { action in
            self.webView.load(URLRequest.init(url: URL.init(string: "about:blank")!))
            if Setting.getdefaultLogin() == 1 {
                self.webView.load(URLRequest.init(url: URL.init(string: "http://www.dmm.com/netgame/social/-/gadgets/=/app_id=854854/")!))
            } else if Setting.getdefaultLogin() == 2 {
                self.webView.load(URLRequest.init(url: URL.init(string: "http://ooi.moe")!))
            }
        })
        refreshAlert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        self.present(refreshAlert, animated: true)
    }
    
    @IBAction func fullscreenBtn() {
        let fullscreenAlert = UIAlertController(title: "全螢幕適配", message: "請等待遊戲載入至GameStart介面，完成時按下適配按鈕", preferredStyle: .alert)
            fullscreenAlert.addAction(UIAlertAction(title: "適配", style: .default) { action in
                OperationQueue.main.addOperation {
                    self.webView.evaluateJavaScript("javascript:(($,_)=>{const html=$.documentElement,gf=$.getElementById('game_frame'),gs=gf.style,gw=gf.offsetWidth,gh=gw*.6;let vp=$.querySelector('meta[name=viewport]'),t=0;vp||(vp=$.createElement('meta'),vp.name='viewport',$.querySelector('head').appendChild(vp));html.style.overflow='hidden';$.body.style.cssText='min-width:0;overflow:hidden;margin:0';$.querySelector('.dmm-ntgnavi').style.display='none';$.querySelector('.area-naviapp').style.display='none';$.getElementById('ntg-recommend').style.display='none';gs.position='fixed';gs.marginRight='auto';gs.marginLeft='auto';gs.top='-16px';gs.right='0';gs.zIndex='100';gs.transformOrigin='50% 16px';if(!_.kancolleFit){const k=()=>{const w=html.clientWidth,h=_.innerHeight;w/h<1/.6?gs.transform='scale('+w/gw+')':gs.transform='scale('+h/gh+')';w<gw?gs.left='-'+(gw-w)/2+'px':gs.left='0'};_.addEventListener('resize',()=>{clearTimeout(t);t=setTimeout(k,10)});_.kancolleFit=k}kancolleFit()})(document,window);")
                }
            })
        
            fullscreenAlert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
            self.present(fullscreenAlert, animated: true)
    }
    @IBAction func settingBtn() {
        let settingAlert = UIAlertController(title: "連接方式", message: "請選擇預設連接方式", preferredStyle: .alert)
        settingAlert.addAction(UIAlertAction(title: "DMM", style: .default) { action in
            Setting.savedefaultLogin(value: 1)
        })
        settingAlert.addAction(UIAlertAction(title: "OOI", style: .default) { action in
            Setting.savedefaultLogin(value: 2)
        })
        settingAlert.addAction(UIAlertAction(title: "關閉", style: .default, handler: nil))
        self.present(settingAlert, animated: true)
    }
}

