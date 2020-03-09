/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : zyb

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 09/03/2020 11:05:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_list
-- ----------------------------
DROP TABLE IF EXISTS `data_list`;
CREATE TABLE `data_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `brief` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ios_download` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `android_download` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_imgs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情图以逗号分隔',
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类(1:棋牌, 2：游戏, 3小说, 4：视频, 5：直播, 6: 其他)',
  `download_total` int(11) NULL DEFAULT 0 COMMENT '下载总数',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '评分',
  `device` int(100) NULL DEFAULT NULL COMMENT '设备类型（1: ios, 2: all 3: andriod ）',
  `hot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_list
-- ----------------------------
INSERT INTO `data_list` VALUES (18, '一起优诺九游版', '2020-02-28 19:54:15', '一起优诺九游版是一款玩法丰富的扑克牌手游，游戏操作简单流畅，玩法丰富多样，UNO牌共分三类牌：普通牌(数字牌)、功能牌、黑牌(万能牌)总牌数为108张。非常好玩，感兴趣的朋友快来下载体验吧！', 'ucpUm7uXyvmOVEf9wJTyx4dN.jpg', '', 'https://t.shoujidown.cn/android/235823_4', '', 'WzkGNuNAehN29ycTSAvLQ5QO.jpg,sFYsrmnCqrLA4DuhHWx6dTFY.jpg', '1', 3, '4.1', 3, NULL);
INSERT INTO `data_list` VALUES (19, '欢乐斗地主2020新春版', '2020-02-29 10:18:23', '欢乐斗地主2020新春版是一款经典斗地主游戏。支持癞子玩法和挑战赛玩法的斗地主游戏，还有任务，抢地主，明牌，加倍等玩法，刺激好玩的玩法提升游戏乐趣!这一次，您将更真实的坐在牌桌上和网友一起欢乐斗地主，真实场景化的游戏界面，让您感受家一般的温馨。', 'pohUY03ocsUwwpjct8JPp6G0.jpg', '', 'https://t.shoujidown.cn/android/10105_4', '', 'FBFjKsHsMA_At0TT-vsVS2qm.jpg,Dj2VDA1w7WTtEOCam6rfTT6h.jpg', '1', 159, '1.4', 3, NULL);
INSERT INTO `data_list` VALUES (20, '鑫途大赢家刷金币版', '2020-02-29 10:22:00', '鑫途大赢家是一款多种游戏模式在线体验的棋牌手游，多变的游戏模式以及独特的画面让你耳目一新。快来与各地的小伙伴们开启棋牌之旅吧！', 'gye21s5oz5N6cDu-A5RQKQJM.jpg', '', 'https://t.shoujidown.cn/android/45608_4', '', 'e2_F4TohgSrHBj3KQh1l5Q-3.jpg,SXJJxVOfHRPgbyGrPxRlBBWS.jpg', '1', 19, '4.8', 3, NULL);
INSERT INTO `data_list` VALUES (21, '欢喜斗地主单机版', '2020-02-29 10:24:49', '欢喜斗地主是一款十分有意思的单机斗地主游戏，这款游戏同时支持联网模式和单机模式，单机可以不用连网，消耗流量，联网可以开启更多玩法，喜欢的话可千万不要错过哦，赶紧下载游戏体验吧~', '249Hzh1juG89tx1Wwia_cx-8.jpg', '', 'https://t.shoujidown.cn/android/135476_4', '', '3BtMAVM0Kzf04lfC4YyptBdH.jpg,xXz0X8PiHzIoWQESpbX7p8Tk.jpg', '1', 92, '3.7', 3, NULL);
INSERT INTO `data_list` VALUES (22, '欢喜斗地主免费版', '2020-02-29 10:26:58', '欢喜斗地主是一款趣味性十足的免费斗地主游戏，这款游戏同时支持联网模式和单机模式，单机可以不用连网，消耗流量，联网可以开启更多玩法，喜欢的话可千万不要错过哦，赶紧下载游戏体验吧~', 'z-qqyB05cwkXQTcZ0EpQ0_kG.jpg', '', 'https://t.shoujidown.cn/android/135476_4', '', 'Z0zcVHXYQ76XoVulaN0BcCYp.jpg,d2KZCb7UlsD8yBV3nvAZ8ZYU.jpg', '1', 519, '2.3', 3, NULL);
INSERT INTO `data_list` VALUES (23, '欢喜斗地主送红包版', '2020-02-29 10:28:14', '欢喜斗地主是一款趣味性十足的斗地主题材的游戏，这款游戏同时支持联网模式和单机模式，单机可以不用连网，消耗流量，联网可以开启更多玩法，喜欢的话可千万不要错过哦，赶紧下载游戏体验吧~', 'gI2rO3lxP0vkzts8vUCBrSz9.jpg', '', 'https://t.shoujidown.cn/android/135476_4', '', '0c8Qp1bW8CmMJT6ZuMQUXEV3.jpg,2Yt_kERuYO2GNggK1k7zMSUH.jpg', '1', 259, '4.1', 3, NULL);
INSERT INTO `data_list` VALUES (24, '欢喜斗地主新春版', '2020-02-29 10:29:26', '欢喜斗地主是一款十分有意思的斗地主游戏，这款游戏同时支持联网模式和单机模式，单机可以不用连网，消耗流量，联网可以开启更多玩法，喜欢的话可千万不要错过哦，赶紧下载游戏体验吧~', 'XYCTCWPaCtZ4jDCOKCORSxP9.jpg', '', 'https://t.shoujidown.cn/android/135476_4', '', 'wP6mJHZOdzJFGsuNQjj3gi1w.jpg,p0Omp4cSD9gYwR2wpwh4gMav.jpg', '1', 19, '4.3', 3, NULL);
INSERT INTO `data_list` VALUES (25, '鑫途大赢家老版本', '2020-02-29 10:31:16', '鑫途大赢家是一款大家都在玩的棋牌手游，多变的游戏模式以及独特的画面让你耳目一新。快来与各地的小伙伴们开启棋牌之旅吧！', 'JSHAsgefuZFzzF2H7jS4qpiw.jpg', '', 'https://t.shoujidown.cn/android/45608_4', '', 'L_I9_5D5VP_UhrxHUkmzrrnV.jpg,L7yS6jHffyKb6sPau4KVTJAE.jpg', '1', 15, '3.2', 3, NULL);
INSERT INTO `data_list` VALUES (26, '哥哥中国象棋', '2020-02-29 10:40:36', '哥哥中国象棋是一款非常好玩的象棋游戏，适合多种人群玩，操作简单，不仅有海量关卡等你挑战，还可以下载海量古谱，可以学习更多的象棋方法以及布局，快来下载体验吧！', '8VJe8FtGWS8PERKrknEJxZFI.jpg', '', 'https://t.shoujidown.cn/android/349350_4', '', 'xGwj4TxPnc7PEiKgTtyNTX3b.jpeg,Pu_3Xx9fX9S10rBhyRJhtoPU.jpeg', '1', 59, '1.0', 3, '0');
INSERT INTO `data_list` VALUES (27, '多乐升级腾讯版', '2020-02-29 10:43:14', '《多乐升级腾讯版》是一款由腾讯代理的非常好玩的棋牌游戏，画面精致、玩法经典！游戏中，玩家可以选择单机模式也可以选择联网模式，所谓是单机不散桌联网乐趣多，就看你喜欢的是什么了吧！这是一款让小伙伴们随时随地可以双升的游戏哦！感兴趣的小伙伴们可以下载体验下哦！', 'cQPve_dY9dWj4eWS8k4HqL7i.jpg', '', 'https://t.shoujidown.cn/android/65315_4', '', 'vCIz7pzdjV76aTat1lXDkkCR.jpg,0NtS3hRGCgFgcJdw4y11Pxj5.jpg', '1', 489, '1.9', 3, NULL);
INSERT INTO `data_list` VALUES (28, '聊客', '2020-02-29 10:46:12', '《聊客》是一款最新的年轻人在线直播交友聊天软件。总多主播在线聊天，表演才艺，丰富的直播内容，带给你最新，最好玩的视频内容，马上下载聊客，现在就和美丽女主播在线互动吧！', 'Sr-KT33U2kQ0PsImVI0lUTu0.png', '', 'https://t.shoujidown.cn/android/84542_4', '', 'hTGQUnrYFG-CgbXW8iL9I8Uz.jpg,l-hh2k2brHfxNoi3HSsmLsBG.png', '5', 79, '1.5', 3, NULL);
INSERT INTO `data_list` VALUES (29, '快聊一对一视频聊天', '2020-02-29 10:48:59', '快聊一对一视频聊天app是一款即时聊天交友应用软件，在这里，大量让你心动的男神女神都与其视频聊天，给你一个真实可靠的诚信交友平台，你可以在这里找到自己的另一半，开启手机定位就能发现更多单身对象，离你最近的单身用户一网打尽！感兴趣的朋友就来下载吧！', 'vNdl3GZTqqaL0pmD2eo3RHKw.jpg', '', 'https://t.shoujidown.cn/android/303288_4', '', 'St-6hr9A5EpDVjnWIf8bmepC.jpg,iQt0dT9K6obfA1LA5CuubNzq.jpg', '5', 509, '3.9', 3, NULL);
INSERT INTO `data_list` VALUES (30, '附近夜聊', '2020-02-29 10:52:05', '附近夜聊是一款线上美女交友约会软件，专为单身人群打造，靠谱的恋爱交友平台，汇集了庞大的高颜值人群，拥有多种娱乐交友方式，可以认识身边的邻居，也可以邂逅同一个城市里的单身异性，可以通过视频、语音、送礼物来快速建立社交关系，附近见面更便捷，感兴趣的用户赶快来下载吧。', 'qodqcCpTDb4Z5lzGvFRVLsj6.jpg', '', 'https://t.shoujidown.cn/android/301794_4', '', 'PaRypMi-tJQmYoRNzk1HVkQg.jpg,USwk4XMkoVpbauadLb5-pNdL.jpg', '5', 39, '2.8', 3, NULL);
INSERT INTO `data_list` VALUES (31, '娇聊', '2020-02-29 10:54:15', '娇聊是一款随时能交友的福利社交app，在这里用户可以随时邂逅自己的女神，进行畅聊了解彼此，该软件照片等信息绝对的实名认证，不怕遇到照骗啦，喜欢交友的朋友就赶紧下载体验一番吧！', 'iYd5p8ivO1X7DS52jkIXFAqf.png', '', 'https://t.shoujidown.cn/android/209907_4', '', 'ZjvAMIfPcHEEi6-E15o10Bzu.png,5n2-QlJ3Ew4mW50H8aDxEsA6.png', '5', 19, '0.5', 3, NULL);
INSERT INTO `data_list` VALUES (32, '面具视频聊天交友', '2020-02-29 10:56:22', '面具视频聊天交友是一款通过视频交友的手机软件，这里汇集了众多或萝莉、或御姐、或校花、或白领的主播妹子，在这儿你可以与心仪的女神尽情的聊天交友，结识更多朋友!赶快下载APP去撩你喜欢的女神吧!', '3u2dyWe2RdCyH6Zob8NznIh7.png', '', 'https://t.shoujidown.cn/android/248256_4', '', 'noK12mKqRH3IroXMLkjOncxL.jpg,HC6hiHWSOFlkfO3GYMKjPRaL.jpg', '5', 943, '3.1', 3, NULL);
INSERT INTO `data_list` VALUES (33, '心动热聊', '2020-02-29 10:58:07', '心动热聊是一款火爆的视频聊天社交软件.采取当下流行的社交模式，真人一对一视频，亲密一对一，心动面对面，单身男女脱单必备神器，感兴趣的朋友们赶紧来快吧手游下载体验吧！', 'GcSFmtCrNY3Cgo_4SkI9H30D.jpg', '', 'https://t.shoujidown.cn/android/296864_4', '', 'BPDjKhyBdGp65uLbUjQo5s3E.jpg,8ep7u2EfK97mXdL3yff-HDxZ.jpg', '5', 49, '4.3', 3, NULL);
INSERT INTO `data_list` VALUES (34, '花间聊天', '2020-02-29 10:59:40', '《花间聊天》app是一款非常好玩的视频直播交友软件，附近的萌妹子、御姐，同城小姐姐，撒娇卖萌，唱歌跳舞，聊天交友，漫漫长夜，告别单身，喜欢她就和她聊一聊！赶紧来快吧手游下载体验吧！', 'JWi7Qa8kQDyzvn9GWAAJxneR.png', '', 'https://t.shoujidown.cn/android/288334_4', '', 'DbQZbnU-q95rgC7DaMXprAq_.jpg,NjSKT49nppGT1dBoX8AKeAEO.jpg', '5', 18, '4.6', 3, NULL);
INSERT INTO `data_list` VALUES (35, '欢聊', '2020-02-29 11:01:03', '欢聊是一款专为单身男女设计的私密聊天约会软件，一键快速寻找附近单身异性，软件简单易用，汇集海量帅哥美女用户在线交友，智能定位快速发现周边心仪约会对象，让您享受每一段真实的交流!听你诉说心事，陪你谈天说地是您快速脱单必备神器。', '3pyeE6dXDIvZuTGAQntFQ8Da.jpg', '', 'https://t.shoujidown.cn/android/302676_4', '', 'TbyI5TcGfVwHohP6HOwXvT75.jpg,Ebxq3_Duopi3AfkQciKSck1_.jpg', '5', 17, '4.7', 3, '1');
INSERT INTO `data_list` VALUES (36, '甜友聊天交友', '2020-02-29 11:03:26', '《甜友聊天交友》是一款全新的社交类聊天软件。App打造趣味社交新方式，让用户通过软件，可以和心目中的ta，展开一场甜蜜的聊天交友恋爱之旅。用户可以通过有温度的“真心话”“趣味话题”“视频聊天”“美女近距离直播”等功能，打破陌生人聊天交友时的沟通屏障，快速拉近双方心里距离。感兴趣的快来下载吧！', 'aKyRoTZyyzrMR-_MMsRgkbP5.jpg', '', 'https://imtt.dd.qq.com/16891/017AF85975609F964B24B1E563110AC7.apk?fsname=com.tian.you_1.1_59.apk&csr=1bbd', '', '4Tcu4UwzVsOvqXO7095mUy_I.jpg,HnKvBRBzAIJ_XW7SSooXL-z3.jpg', '5', 16, '3.6', 3, NULL);
INSERT INTO `data_list` VALUES (37, '陪我闲聊美女交友', '2020-02-29 11:05:29', '《陪我闲聊美女交友》是一款手机社交交友类软件，优质单身男女青年汇聚，提供用户安全靠谱的交友平台！', 'JuC7eSEFG0NLNanhinNP_bIJ.png', '', 'https://t.shoujidown.cn/android/190822_4', '', 'vhTxyNuUdemkcmY_USSnnSUR.jpg,xm9zEx0MKSU6Ct6-zrJ7IEJ_.jpg', '5', 25, '4.9', 3, NULL);
INSERT INTO `data_list` VALUES (38, '热辣小说', '2020-02-29 11:10:20', '热辣小说是一款包含海量全网小说软件，海量精品小说在线观看，更有热门小说第一时间更新，方便用户追文，简洁设计啊，随时随地看小说，喜欢这款软件的用户不要错过下载。', '1SJvlEyhn50aKhEIIjrZUfcy.jpg', 'https://t.shoujidown.cn/ios/157765_4 (ios))', '', '', '26zLEbS0nQFdqeiKtMBaFnf_.jpg,EBOLXlYVA3vtR_oCOaMtoIHE.jpg', '3', 10, '1.7', 1, NULL);
INSERT INTO `data_list` VALUES (39, '快看小说', '2020-02-29 11:13:55', '《快看小说》是一款在线小说阅读的软件。极速更新最新小说作品，海量原创文学，免费看。排版界面美观大方，文字清晰护眼，不必担心损坏眼睛。快来下载寻找你最喜爱的作品吧！', '0iFQMN4_ohuYcaC-GoJGeU19.jpg', 'https://t.shoujidown.cn/ios/123920_4 (ios)', 'https://t.shoujidown.cn/android/72761_4', '', 'QcflM8et4iD3jLDMmgfoo4co.jpg,4Wj19R1U4cOrVvSkC0-uDl5K.jpg', '3', 989, '4.5', 2, NULL);
INSERT INTO `data_list` VALUES (40, '小说神器', '2020-02-29 11:17:39', '《小说神器》包含百万小说资源。阅读界面人性化，简单大方。除了各种最新小说资源，经典名著还有大量原创文学作品。阅读方式多样，支持听书模式，护眼阅读模式，是一款你值得拥有的小说阅读器。', 'EK3ykWSjoZKqd3byG40gmqhz.jpg', 'https://t.shoujidown.cn/ios/123035_4 (ios)', 'https://t.shoujidown.cn/android/80013_4', '', 'cK-h0iovpT4cQor1tnsH6YBq.jpg,wJcJvtZ5wzXEaYCXFzq6Gnx8.jpg', '3', 59, '4.9', 2, NULL);
INSERT INTO `data_list` VALUES (41, '晋江小说阅读', '2020-02-29 11:20:21', '《晋江小说阅读ios版》是一款资源相当丰富的小说阅读软件，这是专门为小说迷们打造的。把你喜欢看的，都同步到收藏夹，无论何时都能看。喜欢的小伙伴快来下载吧。', 'mvxPkZdy1NUKsY9xHiC1cPY_.jpg', 'https://itunes.apple.com/cn/app/id966807283 (ios)', 'https://t.shoujidown.cn/android/45467_4', '', 'ausCIgIuyU-BQ_k1-UyKM6oG.jpg,BgMhhvkwg8RFvv2zx9SVkGKj.jpg', '3', 99, '2.1', 2, NULL);
INSERT INTO `data_list` VALUES (42, '米读小说', '2020-02-29 11:27:51', '米读小说是一款高品质的小说阅读软件，在这里多种类型小说让你看的眼花缭乱，是不是觉得很不可思议呢？如果你喜欢，那就快来下载体验吧！', 'Cb7St9HKsfugv2cFN5RKfxB4.png', 'https://t.shoujidown.cn/ios/135925_4 (ios)', 'https://t.shoujidown.cn/android/116588_4', '', 'ydQGdHH9GTtNXyK2Dwf4EUnJ.jpg,VnuxVCg6Yid23tJpW9UAKmN0.jpg', '3', 89, '1.5', 2, '');
INSERT INTO `data_list` VALUES (43, '番茄小说', '2020-02-29 11:30:28', '番茄小说是一款深受大家喜欢的小说阅读软件，各种类型应有尽有，让你瞬间挑花眼睛。如果你喜欢，那就快来下载吧！', 'K_5-d60qFIsqVCdi7yfLt3Zz.png', 'https://t.shoujidown.cn/ios/180342_4 (ios)', 'https://t.shoujidown.cn/android/148525_4', '', '5G-SI5WqSJr_FM6GNcW0GZjx.jpg,Ij_X6e_G2w0mPC34FpPLTO1G.jpg', '3', 189, '3.8', 2, NULL);
INSERT INTO `data_list` VALUES (44, '飞读小说', '2020-02-29 11:32:35', '飞读小说是一款拥有海量精品小说软件，汇聚多种精彩小说分类，应有尽有，一键搜索功能，方便快捷，超多精品全本小说，尽情畅读，喜欢这款小说软件的用户不要错过下载。', 'Aym8y5vGPIJsRZjKFHbDgjSZ.jpg', 'https://t.shoujidown.cn/ios/248398_4 (ios)', 'https://t.shoujidown.cn/android/174699_4', '', 'zr0q5sd8bqQLpiOmxpeDsIiI.jpg,UZ0F2maKYqQ7ZHsPEZtQ4SRc.jpg', '3', 819, '3.1', 2, NULL);
INSERT INTO `data_list` VALUES (45, '必看小说', '2020-02-29 11:35:25', '必看小说是一款优质的小说阅读软件，汇聚了海量精品小说内容，应有尽有，超多正版小说资源，在线观看，方便快捷，还有多种小说类型，应有尽有，喜欢这款小说软件的用户不要错过下载。', 'DTbnjFZ2KGYbboZY3oj3DpbX.jpg', 'https://t.shoujidown.cn/ios/169085_4', 'https://t.shoujidown.cn/android/135088_4', '', 'gbss1Ty3RAwVEW2j7pjRsnJM.jpg,crLyy4NsMqgVTkTs-t-LfRdi.jpg', '3', 9, '1.0', 2, NULL);
INSERT INTO `data_list` VALUES (46, '连尚读书', '2020-02-29 11:37:40', '连尚读书是一款优质的小说阅读软件，汇聚了海量热门免费的网络小说内容，应有尽有，还有超多分类，一键搜索，方便快捷，更有智能推荐功能，做最懂你的小说阅读软件，喜欢这款软件的用户不要错过下载。', 'J_EGPK8HGGWmNK885CI5TrpU.png', 'https://t.shoujidown.cn/ios/135976_4 (ios)', 'https://t.shoujidown.cn/android/117018_4', '', 'rxHkLb1qmbxZA1TNanG4KpNl.jpg,WMjvsihOlQM9uYInthnFzOfS.jpg', '3', 80, '2.6', 2, NULL);
INSERT INTO `data_list` VALUES (47, '小安读书', '2020-02-29 11:42:23', '小安读书是一款优质的线上小说阅读软件，汇聚了海量免费小说内容，应有尽有，还有超多正版原作小说，有声书，应有尽有，给你最好的阅读体验，喜欢这款软件的用户不要错过下载。', 'QbQHKfwrn-AscwhSunZ2jasR.jpg', 'https://t.shoujidown.cn/ios/135882_4 (ios)', 'https://t.shoujidown.cn/android/97373_4', '', 'JDmXPnC-KVVRQHsQ9NPPtpVN.png,0r77TQGO1Ba5lY0RpT1KOWnG.png', '3', 88, '0.3', 2, NULL);
INSERT INTO `data_list` VALUES (48, '常读小说', '2020-02-29 11:44:30', '常读小说是一款海量全本小说追书神器，精致的界面风格，以及精选海的量正版小说供你随时阅读，并且支持个性化阅读，使你轻松告别书荒，让你随时都能看书。感兴趣的用户快来下载体验吧！', 'EzvJjzkl9asQDB_T3w4AA5NT.jpg', 'https://t.shoujidown.cn/ios/287865_4 (ios)', 'https://t.shoujidown.cn/android/302915_4', '', 'lmjqOhiTK2s_QYzknVVhiEu5.jpg,Au3IWzuRXhOunZPo1CetqL-7.jpg', '3', 97, '4.8', 2, NULL);
INSERT INTO `data_list` VALUES (49, '书迷小说', '2020-02-29 13:09:16', '书迷小说是一款专门为广大用户提供小说阅读的手机软件，超多经典的小说为你提供各类精致的阅读内容，每天更新推荐，界面流畅，可以灵活设置阅读样式，为你展现舒畅的阅读体验！', 'NPpAf-BixaVVDL2McwgYUXpL.png', 'https://t.shoujidown.cn/ios/303688_4 (ios)', '', '', '1uY1q9J95XlAiZ8QgLMVjGJR.png,jmW9PF_TkfVsFYu9zMlFiCg5.png', '3', 96, '4.5', 1, '1');
INSERT INTO `data_list` VALUES (50, '疯读小说', '2020-02-29 13:13:06', '疯读小说是一款资源很多的阅读小说软件，海量正版全本小说，畅读不停歇，有空就看看书吧，反正也不花钱。非常舒服的阅读界面，丰富简单的软件功能，感兴趣的朋友快来下载吧！', 'zZblHl1OFxo0jVIYrTA4iavj.jpg', 'https://t.shoujidown.cn/ios/346797_4 (ios)', 'https://t.shoujidown.cn/android/339670_4', '', 'J5Jrq2w2EbuH7rwjnvex4_Y-.jpg,Wt15tNIu6b9py27DlWQBuN8G.jpg', '3', 25, '1.0', 2, NULL);
INSERT INTO `data_list` VALUES (51, '小美斗地主', '2020-02-29 13:16:52', '小美斗地主是一款简单易上手的斗地主手游，游戏界面精美细腻，清晰流畅不卡顿，每种玩法都会有更多的玩法规则融入，带给你不一样的玩法体验，感兴趣的朋友快来下载吧！', '2NxfxmQShMNd-pcou80Zkl9u.jpg', 'https://t.shoujidown.cn/ios/369742_4 (ios)', 'https://t.shoujidown.cn/android/396197_4', '', 'Lphpr5ylhpaRECgsgo2WVmok.jpg,PRWbFsi-kXQAYS0vWb1R0CNo.jpg', '1', 14, '4.7', 2, NULL);
INSERT INTO `data_list` VALUES (52, '孝感卡五星', '2020-02-29 13:20:22', '《孝感卡五星》是一款非常棒的棋牌手游平台。各种有趣，传统，刺激的棋牌游戏应有尽有，马上下载游戏，一起打麻将吧', 'U4ZeMIrbnzbBZvRCEoZF6NP9.jpg', 'https://t.shoujidown.cn/ios/191060_4 (ios)', 'https://t.shoujidown.cn/android/34202_4', '', 'NNzxyqfWwWxTr1d9gOjCfl3_.jpg,CT-WHMkKElazYR3O0A0gPsYG.jpg', '1', 17, '1.4', 2, NULL);
INSERT INTO `data_list` VALUES (53, '同城游对调', '2020-02-29 13:22:50', '《同城游对调》是一款好玩的休闲类棋牌手游。游戏是内蒙最好玩的棋牌游戏，采用内蒙的特色玩法，内蒙配音，更具有本土风味。游戏有着非常强的对抗性、变数，对玩家的技巧也是很有要求的哦！感兴趣的玩家快来下载吧！', '5ToOHojA_4fE2ArSGWEohNif.jpg', 'https://t.shoujidown.cn/ios/190790_4 (ios)', 'https://t.shoujidown.cn/android/67789_4', '', 'KpRIOzqbpsYW58WfWgLuv8wM.jpg,MOVG5fDWxnTSK13SXy6pr_v-.jpg', '1', 58, '2.9', 2, NULL);
INSERT INTO `data_list` VALUES (54, '博雅斗地主', '2020-02-29 13:26:14', '《博雅斗地主》是一款超经典的斗地主类棋牌游戏。游戏画面精美，玩法模式丰富，支持三人、四人、癞子、明牌、比赛、单机、残局等多种玩法，玩家可以随时随地，和身边好友“斗”起来！感兴趣的快来下载吧！', 'hb0AUFcX6flJtIxqufewluIq.png', 'https://t.shoujidown.cn/ios/144572_4 (ios)', 'https://t.shoujidown.cn/android/99489_4', '', '_DiZObFqe8PgCPPFR4_gLCdI.jpg,Ci9SmXwcR3hvWq6dL166Uhn7.jpg', '1', 258, '2.2', 2, NULL);
INSERT INTO `data_list` VALUES (55, '哈尔滨麻将', '2020-02-29 13:33:33', '《哈尔滨麻将》是一款棋牌类游戏，APP有着地道的哈尔滨麻将玩法，还有多种游戏模式可以体验。快来下载试试吧！', 'CKG4DqBgfwtYrkx2Kb0NKmZ3.jpg', 'https://t.shoujidown.cn/ios/190531_4 (ios)', 'https://t.shoujidown.cn/android/34185_4', '', 'HKr_0qA34v9NhJkKnu-xFd8s.jpg,__-8vSshK974ABHO3Oz2PnyL.jpg', '1', 14, '4.7', 2, NULL);
INSERT INTO `data_list` VALUES (56, '地道贵州麻将', '2020-02-29 13:38:33', '《地道贵州麻将》是一个贵阳本地棋牌竞技平台，APP有着地道的贵阳麻将玩法，随时随地想玩就玩，专业团队打造，游戏更流畅、稳定。快来下载试试吧！', 'v_ijXg3fyPc4S_oRW50iA3k6.jpg', 'https://t.shoujidown.cn/ios/190495_4 (ios)', 'https://t.shoujidown.cn/android/73137_4', '', 'cO2IpSpXTSd8-ZVWl1Xtrasb.jpg,Rwlw7YwAWqoOAYWDpSUe5Pt0.jpg', '1', 17, '2.6', 2, NULL);
INSERT INTO `data_list` VALUES (57, '天天干瞪眼', '2020-02-29 13:41:35', '《天天干瞪眼》是一款全新的棋牌类游戏，APP与其他棋牌游戏不同，这款游戏在我出牌时其他人不能出牌，直到有人出完所有的牌。快来下载体验吧！', 'N-cIsOSLcBbOXU8-yhJzPI1r.png', 'https://t.shoujidown.cn/ios/137876_4 (ios)', 'https://t.shoujidown.cn/android/50152_4', '', 'edHI-5umQIPeo1KtbgwWMdGD.png,zwPNcEaUO1qX5DXkgMI0Dg5g.png', '1', 58, '1.8', 2, NULL);
INSERT INTO `data_list` VALUES (58, '腾讯欢乐五子棋', '2020-02-29 13:43:15', '《腾讯欢乐五子棋》是一款好玩的五子棋类游戏。游戏由腾讯打造，采用闯关玩法模式，让玩家可以随时随地进行挑战，还可以在线与好友PK约战哦！快来下载游戏，看谁才是真正的棋王吧！', 'GA--8ISFAZF3k9CQaboI37_Q.jpg', 'https://t.shoujidown.cn/ios/143047_4 (ios)', 'https://t.shoujidown.cn/android/248222_4', '', 'Z_wIUQ80fry7hDFKnez9XIH7.jpg,QwIP0rgMu_mjc75PqKxNvMli.jpg', '1', 658, '2.8', 2, NULL);
INSERT INTO `data_list` VALUES (59, '来掼蛋', '2020-02-29 13:45:17', '《来掼蛋》是一款正宗江苏安徽本地棋牌游戏，APP游戏画面精美，上手简单玩法丰富,能让用户足不出户就可以和身边好友一起享受掼蛋乐趣。快来下载试试吧！', 'pkVyakoKOEuI0VonSOAUyE3x.jpg', 'https://t.shoujidown.cn/ios/190332_4 (ios)', 'https://t.shoujidown.cn/android/86951_4', '', 'feuPsFi5z4q2V4czRfy4suOc.jpg,bVvN47M3DUICM06iU1PAWdtd.jpg', '1', 858, '3.7', 2, NULL);
INSERT INTO `data_list` VALUES (60, '地主来了', '2020-02-29 13:47:47', '《地主来了》是一款轻松休闲的斗地主游戏，APP是一款完全免费的游戏，随时随地都能游玩，不会再因为缺少游戏币而无法继续。快来下载体验吧！', 'CZWyArp2DqIIltP0WtVolvzI.jpg', 'https://t.shoujidown.cn/ios/190306_4 (ios)', 'https://t.shoujidown.cn/android/82049_4', '', 'tsDmyEPDpcq4zQd3IO8C_nHP.jpg,PfABGNiMTPhzzrW0TFfHSLHe.jpg', '1', 31, '1.2', 2, NULL);
INSERT INTO `data_list` VALUES (61, '明星上海麻将', '2020-02-29 13:50:41', '《明星上海麻将》是一款好玩的棋牌类手游。游戏能让玩家体会到上海特色的麻将玩法，丰富的玩法，任玩家来挑。游戏真人配音，真人在线实时PK，让游戏更加生动更好玩！喜欢的玩家快来下载吧！', 'K-qaqSOFtfE-PrIPdwcivwha.png', 'https://t.shoujidown.cn/ios/151702_4 (ios)', 'https://t.shoujidown.cn/android/151715_4', '', 'cRSaQiDtTK4J4ZTCbBs0sWsf.jpg,HT_vI5N5crcXS1UhgByVVmn5.jpg', '1', 15, '4.9', 2, NULL);
INSERT INTO `data_list` VALUES (62, '后宫', '2020-02-29 13:53:37', '后宫ios版是一款全天候不停息的直播软件，海量小哥哥小姐姐等你来撩。还等什么，快来加入互动吧！', 'VLMJWZ3Ard41uPx7OQ7ZaOFw.png', 'https://t.shoujidown.cn/ios/149801_4 (ios)', 'https://t.shoujidown.cn/android/116724_4', '', 'dlg4ag4aiWrli4-1hKydzo2i.jpg,9XUI-GDd9193ogo6yC63dVBj.jpg', '5', 39, '1.4', 2, NULL);
INSERT INTO `data_list` VALUES (63, '人人', '2020-02-29 13:56:16', '人人是一款当下最火爆的校园美女直播平台软件，同城交友约会聊天，明星艺人在线直播，7*24全天候为您表演，超清直播画面，还在等什么，快来下载体验吧！', 'FFzunwQA-7bSq8B2OXalunEu.jpg', 'https://t.shoujidown.cn/ios/343943_4 (ios)', 'https://t.shoujidown.cn/android/12772_4', '', 'F7tpKZVjlOXIdcv1lhQo4bqM.jpg,8kouPiF99rB5u6LSy2ynUv3F.jpg', '5', 28, '0.6', 2, NULL);
INSERT INTO `data_list` VALUES (64, '懂棋帝', '2020-02-29 13:58:22', '懂骑帝是一款专门学棋的软件，全国顶尖水平的人做你的老师，对开发儿童智力非常有帮助，培养国粹储备人才，发扬中国传统文化！赶紧行动起来吧！', 'M6d4CboWYh95531OghyJBMvt.jpeg', 'https://t.shoujidown.cn/ios/251413_4 (ios)', 'https://t.shoujidown.cn/android/236507_4', '', 'd4--W1VFOjB1uhAQiWFc61Xl.png,05E_mPoKdlbOhwv8XQNMSBi-.png', '5', 58, '0.9', 2, NULL);
INSERT INTO `data_list` VALUES (65, '羞羞涩播', '2020-02-29 14:00:27', '羞羞涩播是一款深受年轻人们喜欢的直播软件，在这里你可以根据自己的喜好，选择对应的视频，相信你一定会爱上这里，毕竟，这里的妹子、帅哥可是很多的哦！', 'cf2gvb-0Z6nhvPhnuiTfVCea.png', 'https://t.shoujidown.cn/ios/146055_4 (ios)', 'https://t.shoujidown.cn/android/57529_4', '', '0cq23ywipBxgsQDG-OMEulHN.jpg,RCnmMaF6N0z2Ooebn0phlqW8.jpg', '5', 58, '4.0', 2, '1');
INSERT INTO `data_list` VALUES (66, '小葫芦星球', '2020-02-29 14:02:36', '小葫芦星球是一款深受年轻人喜欢的直播软件，在这里，你可以挑选自己喜欢的直播视频进行观看，还能与自己心仪的主播在线互动，是不是心动了呢？如果你喜欢的话，就快来下载体验吧！', 'TeVTpIQt4sl865LPhSh16JzW.png', 'https://t.shoujidown.cn/ios/177404_4 (ios)', 'https://t.shoujidown.cn/android/114764_4', '', '506n_Klbx4D7tdHYjIDxrxyc.jpg,0006CeBLKYUhAvbI4Qiot6Jx.jpg', '5', 258, '4.2', 2, NULL);
INSERT INTO `data_list` VALUES (68, '野山椒', '2020-02-29 14:05:35', '野山椒是一款功能齐全的直播软件，在这里，每个人都能实现自己的主播梦，秀出最美的自己。同时也可以选择自己喜欢的视频进行观赏，还有可能获得直播好礼呢，你还等什么？快快行动吧！', '1pKTSLbCVLGXjDbOBuoXPBlk.jpg', 'https://t.shoujidown.cn/ios/181048_4 （ios）', 'https://t.shoujidown.cn/android/135579_4', '', 'Mu_uekrCqQJuoO0BLIkbxa9Y.jpg,AlG3dGg9J1XYRgBkRnVOCDfU.jpg', '5', 20, '3.9', 2, NULL);
INSERT INTO `data_list` VALUES (69, '撩撩主播', '2020-02-29 14:07:25', '撩撩主播是一款社交类型的直播软件，在这里你可以观看海量才将的直播视频，也可以跟着高颜值主播玩转生活，欣赏生活中的美好，是不是很有意思呢？喜欢的话，就快来下载体验吧。', 'gVoNSzS-eaW6Dpy5qiRMuIfx.jpg', 'https://t.shoujidown.cn/ios/123338_4 (ios)', 'https://t.shoujidown.cn/android/68514_4', '', 'trfRUUyfVK8vrjgpED2YILz4.jpg,LDxOjjiV0cf03Sy4CjYItFsc.jpg', '5', 60, '3.4', 2, NULL);
INSERT INTO `data_list` VALUES (70, '斗鱼极速版', '2020-02-29 14:09:05', '斗鱼极速版是一款游戏直播软件，在这里海量游戏视频任你观看，还有超级大声带你开黑上分，精彩多多，惊喜不断，你准备好了吗？', 'pmUB9Q3fQVOJ_Q9gb-8aRW1g.png', 'https://t.shoujidown.cn/ios/177940_4 (ios)', 'https://t.shoujidown.cn/android/324979_4', '', 'RkLC0TDd7soY2uo0iC7tN26I.jpg,5oxr8FfovPVvANrPTDkB9T9q.jpg', '5', 44, '2.2', 2, NULL);
INSERT INTO `data_list` VALUES (71, '奇秀', '2020-02-29 14:11:25', '奇秀是一款年轻人都喜欢的直播软件，在这里你可以看见海量优质直播视频，还有高颜值的小哥哥小姐姐诶。，更重要的是你也能参与全民直播活动，如果你喜欢，就快来下载体验吧。', 'tcsFpSg6QgXZqFTvdI--2e1R.jpg', 'https://t.shoujidown.cn/ios/173829_4 (ios)', 'https://t.shoujidown.cn/android/293753_4', '', 'j3BswVTQFUyAfEPKFeIjAFlE.jpg,Y6FeO73j8t6giSoDB3wuai3_.jpg', '5', 55, '3.5', 2, NULL);
INSERT INTO `data_list` VALUES (72, '约你', '2020-02-29 14:13:42', '约你是一款直播社交软件，在这里你不仅可以欣赏到海量直播视频，还能够与主播们亲密互动或者与心意相通的朋友进行在线交友。是不是很有意思呢？喜欢的话就快来加入吧！', 'N_CruY5DjAY1rmZvgq4oFpwT.jpg', 'https://t.shoujidown.cn/ios/163711_4 (ios)', 'https://t.shoujidown.cn/android/60968_4', '', 'cslqifocGtXMdrcW2eUALNcf.jpg,a522KJmptqUKgXVtrnAar4yB.jpg', '5', 90, '0.8', 2, '1');
INSERT INTO `data_list` VALUES (73, '视否', '2020-02-29 14:15:54', '视否是一款非常有趣的直播社交软件，分屏直播，还能连麦互撩，还有多种才艺展示，包含多种多样的话题动态，全方面展示自己，喜欢这款直播社交软件的用户不要错过下载。', 'z_lIvRYAFkhI_URgKSxq3N4q.jpg', 'https://t.shoujidown.cn/ios/158459_4 (ios)', 'https://t.shoujidown.cn/android/128362_4', '', 'pGDLSTpjqhoaVz5mSlIYYTyk.jpg,jBh36yZg_1vMyPYsVJyaPQuW.jpg', '5', 314, '0.7', 2, NULL);
INSERT INTO `data_list` VALUES (74, '神灵果盘版', '2020-02-29 14:23:52', '神灵果盘版是一款十分热血的魔幻RPG手游，精致的游戏画面，细腻的游戏画风，超清的游戏画质，流畅的游戏操作，还有丰富的游戏玩法，喜欢的朋友快来下载体验吧！', 'yeNI8eABY6J5t68OzM9EHSux.jpg', 'https://t.shoujidown.cn/ios/119210_4 (ios)', 'https://t.shoujidown.cn/ios/119210_4', '', 'D_h_TAf6VAe2rfLPND3J6Q2a.jpg,YuVIPNVU_4-cveQVoRR7prXz.jpg', '2', 989, '3.5', 2, NULL);
INSERT INTO `data_list` VALUES (75, '魔龙之怒果盘版', '2020-02-29 14:25:59', '魔龙之怒果盘版是一款好玩的魔幻题材MMORPG手游，游戏采用Unity3D引擎技术开发，各色场景细腻逼真，突破传统2D零代入感的障碍，给玩家展现一个美轮美奂的3D魔幻世界。', 'H5C-JHpJKFHKrGQ_gftC9Gle.jpg', 'https://t.shoujidown.cn/ios/400064_4 (ios)', 'https://t.shoujidown.cn/android/399458_4', '', 'HQIlsHzYoWU0jogr17AdNzMh.jpg,ttIK_hGjDhqHqV33M8ZE94iR.jpg', '2', 99, '4.1', 2, NULL);
INSERT INTO `data_list` VALUES (76, '凤凰无双果盘版', '2020-02-29 14:28:36', '凤凰无双果盘版是一款画面精美的宫廷题材角色扮演手游，根据同名电视剧改编而来，真实的还原了剧中场景，华丽的游戏时装，丰富的游戏玩法，喜欢的朋友快来下载吧！', '-D9jUVyi4ATv6LcBm9rVK7b8.jpg', 'https://t.shoujidown.cn/ios/400069_4 (ios)', 'https://t.shoujidown.cn/android/101529_4', '', 'Izc5MjnbxJ6TD0IxUSqCum3r.jpg,Y3cvDhXpVHuv_a_vreNM5bfq.jpg', '2', 89, '4.8', 2, NULL);
INSERT INTO `data_list` VALUES (77, '翻转吧瓶子', '2020-02-29 14:30:44', '翻转吧瓶子是一款非常有趣的休闲跳跃手游，游戏操作十分简单，仅仅需要点击屏幕，就可以让你的小瓶瓶“飞”起来！看看你能跳多远。感兴趣的朋友快来下载体验吧！', '1iBWQl-9lmxjeyd4uBSvb4wJ.jpg', 'https://t.shoujidown.cn/ios/400061_4 (ios)', 'https://t.shoujidown.cn/android/370234_4', '', 'ZfcZWdlGrznAy57RXE2f866V.jpg,FLqzxDR1G_BAQ62TcNx_LsKl.jpg', '2', 189, '3.5', 2, '');
INSERT INTO `data_list` VALUES (78, '幻灵战歌185BT版', '2020-02-29 14:39:26', '幻灵战歌185BT版是一款有着非常多美少女的策略卡牌手游，二次元日系的游戏画风，精美细腻的游戏画面，超清流畅的游戏画质，还有丰富的游戏玩法，喜欢的朋友千万不要错过，快来下载体验吧！', 'JsuTMzZz4F884JqKwapvo_Wg.jpg', 'https://t.shoujidown.cn/ios/400057_4 (ios)', 'https://t.shoujidown.cn/android/400056_4', '', '1clDAOstBnVcmkFCQAZBtA-j.jpg,SeSJBCgUmC0IXd6q7X_nAy0U.jpg', '2', 819, '4.7', 2, NULL);
INSERT INTO `data_list` VALUES (79, '真龙传奇BT', '2020-02-29 14:43:59', '真龙传奇是一款十分有意思的传奇RPG游戏，这款游戏延续了传奇系列游戏的经典三大职业战、法、道，这三种职业各有优劣，你可以根据自己的能力进行选择哦~', '03o78r55Jnltkqc4P4yuNR2H.jpg', 'https://t.shoujidown.cn/ios/397324_4 (ios)', 'https://t.shoujidown.cn/android/213233_4', '', 'UBBKzAwvajHAx26pQUzbn85N.jpg,pa3qpClfPzkQibhQ_QYdHnDP.jpg', '2', 9, '2.8', 2, NULL);
INSERT INTO `data_list` VALUES (80, '九洲志', '2020-02-29 14:46:33', '《九洲志》是一款Unity3D引擎制作，3D视觉效果的，具有神魔色彩的角色扮演仙侠手游，游戏画风、场景、造型精美绝伦，展现出一个想象力十足的神秘世界；战斗玩法多样性强，霸气凌厉。为玩家展现最正宗的武术江湖，开启新的神仙修养时代世界', '7RM0vGG8aIJ9gdLuMZh9dJ0H.jpg', 'https://t.shoujidown.cn/ios/397280_4 (ios)', 'https://t.shoujidown.cn/android/151426_4', '', 'N7GD6LdeY5vlggw9FdnmoyIR.jpg,nHJV84PsQX2OTbQhGvcd4Mfg.jpg', '2', 80, '2.1', 2, NULL);
INSERT INTO `data_list` VALUES (81, '巨龙之戒', '2020-02-29 14:49:13', '巨龙之戒是一款3D卡通画风的卡牌手游，玩家需要帮助精灵解除诅咒，帮助矮人消灭巨龙夺回家园，让世界再一次迎来和平的曙光。壮阔的天地任您闯荡，您的足迹终将将遍布这里的每一个角落。', 'mNYvau0O-0rggb5Fj3IcgL4f.jpg', 'https://t.shoujidown.cn/ios/396734_4 (ios)', 'https://t.shoujidown.cn/android/261417_4', '', 'bJzlEpIXeZaQK2mW1S3HWdZg.jpg,pk6DLPiJqBhheuLI2lZLUVmu.jpg', '2', 88, '1.1', 2, NULL);
INSERT INTO `data_list` VALUES (82, '迷失岛3宇宙的尘埃', '2020-02-29 15:02:40', '迷失岛3宇宙的尘埃是一款迷失岛系列作品第三部作品，游戏有着极简的画面，超清的游戏画质，流畅的游戏操作，丰富的游戏玩法，有一定的难度，感兴趣的朋友快来下载体验吧！', 'R4YueVTxgEjRTx0hte5k0m-R.jpg', 'https://t.shoujidown.cn/ios/396735_4 (ios)', 'https://t.shoujidown.cn/ios/396735_4', '', 'L3hbgMLCsABN8w6FxuE8SoTh.jpg,tpmXMvMNDfylCQBuMdEGqiGJ.jpg', '2', 97, '1.9', 2, NULL);
INSERT INTO `data_list` VALUES (83, '荒岛求生2', '2020-02-29 15:07:40', '荒岛求生2是一个文字冒险游戏，也是一个免费休闲游戏，在游戏中玩家需要通过无尽的冒险，成为荒野终结者，我的世界我做主。对这款游戏感兴趣的朋友快来下载体验吧！', 'NMAbbDBXqa-4z3pVcEQgQAHM.jpg', 'https://t.shoujidown.cn/ios/395674_4 (ios)', 'https://t.shoujidown.cn/android/358902_4', '', 'BcOtni8QqUueprIGs3U-LC6z.jpg,o6FqfNppHPJfZjsXB1sJZZ6x.jpg', '2', 96, '3.9', 2, NULL);
INSERT INTO `data_list` VALUES (84, '病毒收割姬', '2020-02-29 15:10:14', '病毒收割姬是一款3D二次元物理画风的动作游戏。精致的3D画面和细致的物理效果，超爽的打击感和炫酷的动作特效，丰富有趣的玩法模式找回纯粹的街机爽快。', 'MtnL5nR6lB66tujTjWQxFBez.jpg', 'https://t.shoujidown.cn/ios/395252_4 (ios)', 'https://t.shoujidown.cn/android/395220_4', '', 'YFtyuFPdQAiBB9JdVhC-AdkQ.jpg,k-CDXIFYyDSMJafon5Q1kxX-.jpg', '2', 25, '2.0', 2, NULL);
INSERT INTO `data_list` VALUES (85, '美剧鸟', '2020-02-29 15:13:36', '美剧鸟是一款宅家必备追剧软件，超多美剧可以在线观看，也可离线下载。汇聚了众多时下热门的美剧资源，每日更新新的剧集，喜欢看美剧的朋友快来下载体验吧！', 'yl9RbJBllqdqB73uAGghO5BM.jpg', 'https://t.shoujidown.cn/ios/396733_4 (ios)', 'https://t.shoujidown.cn/android/267111_4', '', 'Yg2Qgo3fMip-7HQnzFyat1zt.jpg,-mL-CWUwi60flCnzxSANnmjb.jpg', '4', 14, '3.0', 2, '0');
INSERT INTO `data_list` VALUES (86, 'PP体育', '2020-02-29 15:16:58', 'PP体育是中国较早开始通过互联网直播体育赛事的平台。依托苏宁集团强大优势，PP体育目前拥有中国之队、中超、亚冠、中甲、英超、德甲、意甲、法甲、欧冠、欧联、WWE、UFC等重量级体育版权，形成以足球产业为核心的体育内容矩阵，致力于打造服务于全体球迷的互联网体育平台。', 'gQRLW0n4PQBnRDjLWHURtpx-.jpg', 'https://t.shoujidown.cn/ios/142094_4 (ios)', 'https://t.shoujidown.cn/android/100224_4', '', 'vxCiA8wTh7mfqnTQ1LgptRkq.jpg,UFjcEtRntv84QoqpApkCy0ym.jpg', '4', 17, '0.2', 2, NULL);
INSERT INTO `data_list` VALUES (87, '91短视频', '2020-02-29 15:20:03', '91短视频是一款好玩的短视频播放软件，以视频内容为核心，筛选出品质与创意并存的好作品。好看的短视频一键点赞，一键评论。感兴趣的朋友快来下载体验吧！', 'ATFC-z-NgyMjmyz1wI3OtkPM.jpg', 'https://t.shoujidown.cn/ios/341471_4 (ios)', 'https://t.shoujidown.cn/android/361979_4', '', 'PjEWah1m06FSD0faj6BoCq1W.jpg,7GP3TIfn9O_TEzYs5V1RaGG_.jpg', '4', 58, '0.7', 2, NULL);
INSERT INTO `data_list` VALUES (88, '对手短视频', '2020-02-29 15:22:12', '对手短视频是一款非常有趣的短视频才艺PK类软件，APP内才艺丰富，包含歌曲、舞蹈、音乐、搞笑、脱口秀、魔术、厨王等近十四个频道，每一个视频都经过人工严格审核，保证精彩。', 'Tqq11DLqpiuiO4JNhyUlwFL2.jpg', 'https://t.shoujidown.cn/ios/340433_4 (ios)', 'https://t.shoujidown.cn/android/352075_4', '', 'wAdBTZzb60zVy76haUq1_xpS.jpg,LS26_nnAov8QZG2O5OV6PCEx.jpg', '4', 258, '4.1', 2, NULL);
INSERT INTO `data_list` VALUES (89, '电影天堂', '2020-02-29 15:24:34', '电影天堂电影天堂是一款大片热剧免费看，高清电影电视剧在线播放神器，电影天堂能直接免费观看全网热播大片。电影天堂聚合了15万部电影...当之无愧的看片神器。', '8WsM0Ok1gqxUET28hY_HQmiB.png', 'https://t.shoujidown.cn/ios/141580_4 (ios)', 'https://t.shoujidown.cn/android/44414_4', '', 'sXNr5VkWzHqquh72kb9ezRCd.jpg,sOXl7yqYiISpwTHcYSmkqipi.jpg', '4', 159, '4.9', 2, NULL);
INSERT INTO `data_list` VALUES (90, '万能视频播放器', '2020-02-29 15:26:58', '万能视频播放器是一款全能的视频播放器软件，强大的软件功能特色，在观看视频教程，考研课程等时，使用倍速播放提高学习效率。功能丰富，感兴趣的朋友快来下载体验吧！', 'ObJ-UxR6MJqIb99asdX8wytP.png', 'https://t.shoujidown.cn/ios/167662_4 (ios)', 'https://t.shoujidown.cn/android/53298_4', '', 'qcteEr7mwZs4j5L9AsAX3GxE.png,2onZC6T4522jh0aF2NfUUBBU.png', '4', 265, '0.8', 2, NULL);
INSERT INTO `data_list` VALUES (91, '麻花播放器', '2020-02-29 15:29:43', '麻花播放器是一款丰富资源的视频播放器软件，界面简洁大方，操作流畅简单，画质超清，细致优化播放效果，让您在有限的资源和屏幕上，享受更流畅、更优质的播放体验。快来下载吧！', '4YhnUkjImhEL0b-ytKaGRlP8.jpg', 'https://t.shoujidown.cn/ios/190491_4 (ios)', 'https://t.shoujidown.cn/android/247880_4', '', 'csC3erHAoI0jl3DYbVFOzYOs.jpg,UbOE65IJjqecl9dsIJLmV1sU.jpg', '4', 35, '1.8', 2, NULL);
INSERT INTO `data_list` VALUES (92, '全能播放器', '2020-02-29 15:31:45', '全能播放器是一款非常好的视频播放软件，这是一个名副其实的全能播放器，几乎可以播放你能找到的所有格式的视频。全能播放器始终免费。感兴趣的朋友快来下载体验吧！', 'NBGWMdVOxoF8rB2jTcjt9QWQ.jpg', 'https://t.shoujidown.cn/ios/273856_4 (ios)', 'https://t.shoujidown.cn/android/195142_4', '', 'adf_lP48sESt_26rybHjTQzl.jpg,8mbC5VyjgqjXHkjRHDO8aecH.jpg', '4', 897, '0.2', 2, NULL);
INSERT INTO `data_list` VALUES (93, '芭蕉小视频', '2020-02-29 15:34:11', '芭蕉小视频是一款深受大家喜欢的短视频软件，你可以根据自己的喜好选择精彩视频进行观看，同时你也能发表动态，秀出最美的自己，你喜欢吗？', '3kkusSc-zZMwLNS6rpJEUR4S.jpg', 'https://t.shoujidown.cn/ios/151960_4 (ios)', 'https://t.shoujidown.cn/android/121167_4', '', 'lH1hxtBD8D5kCj0P2apINvE6.jpg,HQcafAg1LDoacJyCkGhhiFzK.jpg', '4', 93, '0.2', 2, NULL);
INSERT INTO `data_list` VALUES (94, '那好吧', '2020-02-29 15:37:09', '《那好吧ios版》是一款视频资源相当精彩的播放软件，高清的画质起着画龙点睛的作用。遇到自己喜欢的资源赶快下载下来观看吧。喜欢的小伙伴一定别错过哦。', 'swTiD_t5s-dJENsP8upYXtJo.jpg', 'https://t.shoujidown.cn/ios/48827_4 (ios)', 'https://t.shoujidown.cn/android/29012_4', '', 'E2YDBZzU_ByJUrgdekiEopuu.jpg,m8sCwmya-9pB2Q7d2DOXm-3I.jpg', '4', 23, '3.7', 2, NULL);
INSERT INTO `data_list` VALUES (95, '大千视界', '2020-02-29 15:41:38', '大千视界是一款优质的线上影音视频播放软件，汇集了海量精彩影音作品，应有尽有，更有超清画质，极速播放，方便快捷，更有智能推送功能，给你最好的观影体验，喜欢这款软件的用户不要错过下载。', '0W8d4EeKUmTfOees90Pvbkjs.jpg', 'https://t.shoujidown.cn/ios/256182_4 (ios)', 'https://t.shoujidown.cn/android/157212_4', '', 'gVyU93JNDzoOdgpA_SqVO-87.jpg,5AloYN9hYqu7IYT4qtRP9nQc.jpg', '4', 84, '4.5', 2, NULL);
INSERT INTO `data_list` VALUES (99, '凤凰棋牌', '2020-03-06 11:57:11', '凤凰棋牌是一款好玩的棋牌游戏。游戏由腾讯打造，采用闯关玩法模式，让玩家可以随时随地进行挑战，还可以在线与好友PK约战哦！快来下载游戏，看谁才是真正的棋王吧！', 'IQCSc7PqJimM5FWG-NtVXlZH.png', 'https://ios.app88.xin/app/detail/Gpgw17nSv', 'https://ios.app88.xin/app/detail/Gpgw17nSv', NULL, '8PaqO8ZKOhhALkP3mTnOzDCk.png,hxBNlGu--59jXvKCwSWEq7r-.png', '1', 23, '0.3', 2, '1');
INSERT INTO `data_list` VALUES (100, '欢乐棋牌', '2020-03-06 12:13:09', '欢乐棋牌--2020年最火爆，最赚钱的棋牌游戏，欢乐棋牌整合了IOS和安卓版多款经典游戏，超高的游戏体验，清晰的游戏界面，真实体验尽享真人对战；全民代理，无限裂变，每邀请一个好', 'zSXf_gnNBSlOdGXGdSBY4ru7.png', 'https://d.openpai.cn/static/m/6.mobileprovision', 'https://www.cjqm88.cn/download/5e56a600cd21b.html', NULL, 'HjfVRskexGs3jy8sqRGYIybb.png,hWz7nkY9qwLK839KjEHs_fHm.png', '1', 1264, '4.0', 2, NULL);
INSERT INTO `data_list` VALUES (101, '抖阴视频', '2020-03-06 12:25:00', '抖阴app老司机们一看名字就应该能懂这是一款什么样的软件，也是最近刚推荐出来的深夜美女福利资源视频软件，在这里的每一个深夜，这里的美女视频一定能够满足大家寂寞的需求，各种类型美', 'z8eqoWTevXffOeUByJk11D_M.png', 'itms-services://?action=download-manifest&amp;url=https://apk-hk2.oss-cn-hongkong.aliyuncs.com/dy/ios/manifest.plist', 'https://apk-hk2.oss-cn-hongkong.aliyuncs.com/dy/douyin2.1.0.apk', NULL, '8aMBKT_wU21npNqQP8VCpDDk.jpg,AkzpA7Xmzjpnpgf_OFQCDPhD.jpg', '5', 2106, '3.5', 2, NULL);
INSERT INTO `data_list` VALUES (102, '逗奶直播', '2020-03-06 12:32:32', '逗奶直播app相信各位老司机们都应该懂的线上美女直播啦，很多人之前也是用的这款软件来进行在线看美女直播视频的，现在今天为大家带来最新的更新版本啦，大家如果有想在线看美女直播视频', 'lXvMDxLEUaybCbfR0T4YNDE3.png', '', 'http://hxz1.downname.com/dounaizhibo.apk', NULL, 'pRt8u321-DLS56-IhsBYqIVa.png,x1UqRPpKNfuJus05anEAynuc.png', '2', 1623, '1.0', 3, NULL);
INSERT INTO `data_list` VALUES (103, '性感女秘书', '2020-03-06 14:13:02', '性感女秘书是一款真人模拟的恋爱养成类游戏，在游戏中玩家扮演一位高级总裁，但是因为你的女秘书对你居然不感冒，让你有了深深的挫败感，所以你决定主动出击，游戏中剧情开放，玩家可以任意', '8aEhQXNP8opo_jWaRvkORGqb.jpg', '', 'http://appfile1.gongjiao.com/appfile1/20190620/120_dbe9aee21a7f37d423fdd347b0862259.apk', NULL, 'lIdJcBS5HAKBcMzXIo83QiYh.jpg,RMPc6EGRRdCjfK-5x-YwXv4d.jpg', '4', 1109, '4.0', 3, NULL);
INSERT INTO `data_list` VALUES (105, '魂器学院', '2020-03-06 15:42:56', '《魂器学院》是专为广大喜爱养成游戏玩家推出的一款美少女养成手游，游戏中玩家可以不断收集可爱的魂器娘，建立庞大的后宫开启全新的冒险之旅~而且这款手游的最大亮点在于养肝护肾不氪金，', 'QDIXMVqztmV-XFE2upIgmrDE.jpg', '', 'https://t.shoujidown.cn/android/61676_4', NULL, 'pjGW2dQjlIrulgNuj3jVhZPW.png,tB3kULHkKzR4B8uAbIi8RsRJ.png', '4', 0, '1.6', 3, '1');
INSERT INTO `data_list` VALUES (106, '成人修仙', '2020-03-06 15:58:13', '成人修仙手游，一开始我只是以为是普通的仙侠游戏，直到有一天一个小姐姐给了我一个遨游邀请，我...回不去了~每天就和小姐姐们进行双修~强烈推荐单身狗！！这游戏', 'FdVp0aOlIYbse6AaSGZSgl8Q.png', '', 'http://down.bvjkfbd.cn/hlaz2/hlaz2_10051529.apk', NULL, 'sPH780V-_i7l5C6PI58nN0ON.png,0O_QFgWaZtFAk-xvTUz_STJJ.png', '4', 1036, '1.1', 3, NULL);
INSERT INTO `data_list` VALUES (107, '芒果视频', '2020-03-06 16:09:15', '芒果视频，一款成人播放APP软件。内容经常丰富，日常更新，海量资源。激情永不静止', 'J10TdN5g9X21IbZrZwJaWpGy.png', '', 'https://yunres.mesecreative.net/app9000/lushen.apk', NULL, 'uwqjFizFuNg-t6Rd38gwcZ5P.jpg,YBkBeGpXKY8wRyrFqGZQhHpA.jpg', '5', 1308, '1.0', 3, NULL);

SET FOREIGN_KEY_CHECKS = 1;
