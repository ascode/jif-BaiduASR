//
//  BDVRViewController.swift
//  BDVRClientSample
//
//  Created by 金飞 on 15/12/28.
//  Copyright © 2015年 Baidu. All rights reserved.
//

import UIKit
//#import "BDVRViewController.h"
//#import "BDVoiceRecognitionClient.h"
//#import "BDVRSettingViewController.h"
//#import "BDVRSConfig.h"
//#import "BDVRCustomRecognitonViewController.h"
//#import "BDVRUIPromptTextCustom.h"
//#import "BDVRLogger.h"


class BDVRViewController:  UIViewController {
    
    let API_KEY = "PBpXItwoGQCVZWQTcVjvCCxo" // 请修改为您在百度开发者平台申请的API_KEY
    let SECRET_KEY = "20f03971917de709674bd260d10ede37" // 请修改您在百度开发者平台申请的SECRET_KEY

    @IBOutlet var test: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.test.text = "jifnei"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnVRPressed(sender: AnyObject) {
        
        // 设置开发者信息
        BDVoiceRecognitionClient.sharedInstance().setApiKey(API_KEY, withSecretKey: SECRET_KEY)
        // 设置语音识别模式，默认是输入模式
        BDVoiceRecognitionClient.sharedInstance().setPropertyList([BDVRSConfig.sharedInstance().recognitionProperty])
        // 设置城市ID，当识别属性包含EVoiceRecognitionPropertyMap时有效
        BDVoiceRecognitionClient.sharedInstance().setCityID(1)
        // 设置是否需要语义理解，只在搜索模式有效
        BDVoiceRecognitionClient.sharedInstance().setConfig("nlu", withFlag: BDVRSConfig.sharedInstance().isNeedNLU)
        
        // 开启联系人识别
        BDVoiceRecognitionClient.sharedInstance().setConfig("enable_contacts", withFlag: true)
        // 设置识别语言
        BDVoiceRecognitionClient.sharedInstance().setLanguage(BDVRSConfig.sharedInstance().recognitionLanguage)
        // 是否打开语音音量监听功能，可选
        if(BDVRSConfig.sharedInstance().voiceLevelMeter){
            let res : Bool = BDVoiceRecognitionClient.sharedInstance().listenCurrentDBLevelMeter()
            if (res == false){// 如果监听失败，则恢复开关值
                BDVRSConfig.sharedInstance().voiceLevelMeter = false
            }
        }else{
            BDVoiceRecognitionClient.sharedInstance().cancelListenCurrentDBLevelMeter()
        }
        // 设置播放开始说话提示音开关，可选
                // 设置播放开始说话提示音开关，可选
//                [[BDVoiceRecognitionClient sharedInstance] setPlayTone:EVoiceRecognitionPlayTonesRecStart isPlay:[BDVRSConfig sharedInstance].playStartMusicSwitch];
        BDVoiceRecognitionClient.sharedInstance().setPlayTone(1, isPlay: BDVRSConfig.sharedInstance().playStartMusicSwitch)
        // 设置播放结束说话提示音开关，可选
        //        [[BDVoiceRecognitionClient sharedInstance] setPlayTone:EVoiceRecognitionPlayTonesRecEnd isPlay:[BDVRSConfig sharedInstance].playEndMusicSwitch];
        BDVoiceRecognitionClient.sharedInstance().setPlayTone(2, isPlay: BDVRSConfig.sharedInstance().playEndMusicSwitch)
        
        // 创建语音识别界面，在其viewdidload方法中启动语音识别
        var tmpAudioViewController : BDVRCustomRecognitonViewController = BDVRCustomRecognitonViewController.init(nibName: nil, bundle: nil)
        
        
        
//        tmpAudioViewController.clientSampleViewController = self
//        self.audioViewController = tmpAudioViewController
//        
//        UIApplication.sharedApplication().keyWindow.addSubview(_audioViewController.view)
        
        
        
        
        
        
        
        
        
        
//        [self clean];
//
//        
//        // 创建语音识别界面，在其viewdidload方法中启动语音识别
//        BDVRCustomRecognitonViewController *tmpAudioViewController = [[BDVRCustomRecognitonViewController alloc] initWithNibName:nil bundle:nil];
//        tmpAudioViewController.clientSampleViewController = self;
//        self.audioViewController = tmpAudioViewController;
//        //[tmpAudioViewController release];
//        
//        [[UIApplication sharedApplication].keyWindow addSubview:_audioViewController.view];
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
