/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssm63az8
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm63az8` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm63az8`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm63az8/upload/picture1.jpg');
insert  into `config`(`id`,`name`,`value`) values (2,'picture2','http://localhost:8080/ssm63az8/upload/picture2.jpg');
insert  into `config`(`id`,`name`,`value`) values (3,'picture3','http://localhost:8080/ssm63az8/upload/picture3.jpg');
insert  into `config`(`id`,`name`,`value`) values (6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619574144021 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1619574137003,'2021-04-28 09:42:16','发的啥地方是',20,1);
insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1619574144020,'2021-04-28 09:42:23','电饭锅地方',55,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619574209171 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619574184288,'2021-04-28 09:43:03',1619574137003,'发的啥地方是','电饭锅地方电饭锅','[{\"text\":\"A.电饭锅地方给对方\",\"code\":\"A\"},{\"text\":\"B.好发给很反感\",\"code\":\"B\"},{\"text\":\"C.士大夫收到收到\",\"code\":\"C\"},{\"text\":\"D. 好几款环境\",\"code\":\"D\"}]',4,'D','电饭锅的广泛地电工',0,1);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1619574209170,'2021-04-28 09:43:29',1619574144020,'电饭锅地方','个电工地方地方','[{\"text\":\"A.电饭锅地方g\",\"code\":\"A\"},{\"text\":\"B. 富贵华府很反感\",\"code\":\"B\"},{\"text\":\"C.士大夫收到是\",\"code\":\"C\"}]',4,'C','电工地方冻干粉给对方',0,1);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619574235086 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1619574229522,'2021-04-28 09:43:48',1619574047024,NULL,1619574137003,'发的啥地方是',1619574184288,'电饭锅地方电饭锅','[{\"text\":\"A.电饭锅地方给对方\",\"code\":\"A\"},{\"text\":\"B.好发给很反感\",\"code\":\"B\"},{\"text\":\"C.士大夫收到收到\",\"code\":\"C\"},{\"text\":\"D. 好几款环境\",\"code\":\"D\"}]',4,'D','电饭锅的广泛地电工',0,'B');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1619574235085,'2021-04-28 09:43:54',1619574047024,NULL,1619574144020,'电饭锅地方',1619574209170,'个电工地方地方','[{\"text\":\"A.电饭锅地方g\",\"code\":\"A\"},{\"text\":\"B. 富贵华府很反感\",\"code\":\"B\"},{\"text\":\"C.士大夫收到是\",\"code\":\"C\"}]',4,'C','电工地方冻干粉给对方',4,'C');

/*Table structure for table `leixingxinxi` */

DROP TABLE IF EXISTS `leixingxinxi`;

CREATE TABLE `leixingxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixingxinxi` varchar(200) DEFAULT NULL COMMENT '类型信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619574099011 DEFAULT CHARSET=utf8 COMMENT='类型信息';

/*Data for the table `leixingxinxi` */

insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (31,'2021-04-28 09:37:00','类型信息1');
insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (32,'2021-04-28 09:37:00','类型信息2');
insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (33,'2021-04-28 09:37:00','类型信息3');
insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (34,'2021-04-28 09:37:00','类型信息4');
insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (35,'2021-04-28 09:37:00','类型信息5');
insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (36,'2021-04-28 09:37:00','类型信息6');
insert  into `leixingxinxi`(`id`,`addtime`,`leixingxinxi`) values (1619574099010,'2021-04-28 09:41:38','化学');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1619574047024,'11','yonghu','用户','1shvv5sgk520qd4dxi4tx11ej121l1pm','2021-04-28 09:40:49','2021-04-28 10:43:35');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (2,1,'abo','users','管理员','9w87hbif4xdgcnd560at64h6oxuhcwzv','2021-04-28 09:41:15','2021-04-28 10:41:16');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-04-28 09:37:00');

/*Table structure for table `xuexizhishi` */

DROP TABLE IF EXISTS `xuexizhishi`;

CREATE TABLE `xuexizhishi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `neirong` longtext COMMENT '内容',
  `fabiaoshijian` date DEFAULT NULL COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619574117853 DEFAULT CHARSET=utf8 COMMENT='学习知识';

/*Data for the table `xuexizhishi` */

insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (21,'2021-04-28 09:37:00','标题1','类型1','http://localhost:8080/ssm63az8/upload/xuexizhishi_fengmian1.jpg','内容1','2021-04-28');
insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (22,'2021-04-28 09:37:00','标题2','类型2','http://localhost:8080/ssm63az8/upload/xuexizhishi_fengmian2.jpg','内容2','2021-04-28');
insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (23,'2021-04-28 09:37:00','标题3','类型3','http://localhost:8080/ssm63az8/upload/xuexizhishi_fengmian3.jpg','内容3','2021-04-28');
insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (24,'2021-04-28 09:37:00','标题4','类型4','http://localhost:8080/ssm63az8/upload/xuexizhishi_fengmian4.jpg','内容4','2021-04-28');
insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (25,'2021-04-28 09:37:00','标题5','类型5','http://localhost:8080/ssm63az8/upload/xuexizhishi_fengmian5.jpg','内容5','2021-04-28');
insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (26,'2021-04-28 09:37:00','标题6','类型6','http://localhost:8080/ssm63az8/upload/xuexizhishi_fengmian6.jpg','内容6','2021-04-28');
insert  into `xuexizhishi`(`id`,`addtime`,`biaoti`,`leixing`,`fengmian`,`neirong`,`fabiaoshijian`) values (1619574117852,'2021-04-28 09:41:57','个电饭锅的','化学','http://localhost:8080/ssm63az8/upload/1619574106716.jpg','<p>个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方个地方给对方给对方给对方</p><p><br></p><p><img src=\"http://localhost:8080/ssm63az8/upload/1619574114019.jpg\"></p><p><br></p><p><img src=\"http://localhost:8080/ssm63az8/upload/1619574115939.jpg\"></p><p><br></p>','2021-04-28');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `nianling` varchar(200) DEFAULT NULL COMMENT '年龄',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1619574047025 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`shouji`,`zhaopian`) values (12,'2021-04-28 09:37:00','用户2','123456','姓名2','年龄2','13823888882','http://localhost:8080/ssm63az8/upload/yonghu_zhaopian2.jpg');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`shouji`,`zhaopian`) values (13,'2021-04-28 09:37:00','用户3','123456','姓名3','年龄3','13823888883','http://localhost:8080/ssm63az8/upload/yonghu_zhaopian3.jpg');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`shouji`,`zhaopian`) values (14,'2021-04-28 09:37:00','用户4','123456','姓名4','年龄4','13823888884','http://localhost:8080/ssm63az8/upload/yonghu_zhaopian4.jpg');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`shouji`,`zhaopian`) values (15,'2021-04-28 09:37:00','用户5','123456','姓名5','年龄5','13823888885','http://localhost:8080/ssm63az8/upload/yonghu_zhaopian5.jpg');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`shouji`,`zhaopian`) values (16,'2021-04-28 09:37:00','用户6','123456','姓名6','年龄6','13823888886','http://localhost:8080/ssm63az8/upload/yonghu_zhaopian6.jpg');
insert  into `yonghu`(`id`,`addtime`,`zhanghao`,`mima`,`xingming`,`nianling`,`shouji`,`zhaopian`) values (1619574047024,'2021-04-28 09:40:47','11','11','收费的','11','11112221111','http://localhost:8080/ssm63az8/upload/1619574063982.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
