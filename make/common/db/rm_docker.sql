set character set utf8;

ALTER DATABASE `rm_docker` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use rm_docker;

-- ----------------------------
-- Table structure for mm_alarm_rule
-- ----------------------------
set character set utf8;
DROP TABLE IF EXISTS `mm_alarm_rule`;
CREATE TABLE `mm_alarm_rule` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `kpi` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'KPI',
  `expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表达式',
  `statistic` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '统计方式  平均值 AVG  最大值 MAX   最小值 MIN',
  `threshold` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '阈值',
  `start_time` date DEFAULT NULL COMMENT '生效开始时间',
  `end_time` date DEFAULT NULL COMMENT '失效结束时间',
  `strategy_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '策略ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='告警规则表';

-- ----------------------------
-- Table structure for mm_alarm_strategy
-- ----------------------------
DROP TABLE IF EXISTS `mm_alarm_strategy`;
CREATE TABLE `mm_alarm_strategy` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型，主机和应用',
  `period` int(11) DEFAULT NULL COMMENT '周期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警级别,1:严重告警;2:重要告警;3:一般告警',
  `start_time` datetime DEFAULT NULL COMMENT '策略生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '策略结束时间',
  `alarm_form` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报警形式，短信，邮件',
  `alarm_interval` int(11) DEFAULT NULL COMMENT '报警间隔,距上次告警间隔多长时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='告警策略表';

-- ----------------------------
-- Table structure for mm_alarm_strategy_resource
-- ----------------------------
DROP TABLE IF EXISTS `mm_alarm_strategy_resource`;
CREATE TABLE `mm_alarm_strategy_resource` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `strategy_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '策略ID',
  `resource_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源类型',
  `resource_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='告警策略和资源关系表';

-- ----------------------------
-- Table structure for omm_scaling
-- ----------------------------
DROP TABLE IF EXISTS `omm_scaling`;
CREATE TABLE `omm_scaling` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '伸缩组名称',
  `strategies` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '伸缩组策略',
  `resources` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '伸缩组资源',
  `creation_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `namespace` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '命名空间',
  `scaling_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '伸缩类型：自动 AUTO_SCALING ，定时 TIMING_SCALING',
  `max_replicas` int(11) DEFAULT NULL COMMENT '最大实例个数',
  `min_replicas` int(11) DEFAULT NULL COMMENT '最小实例个数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='自动伸缩与定时伸缩';

-- ----------------------------
-- Table structure for omm_scaling_event
-- ----------------------------
DROP TABLE IF EXISTS `omm_scaling_event`;
CREATE TABLE `omm_scaling_event` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID，主键',
  `group_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组ID',
  `resource_actions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '调度动作 增长 increase 缩减  reduction',
  `resource_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '事件状态  执行中 adjusting  成功 success   失败 failure',
  `resource_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '事件名称',
  `resource_status_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '事件原因',
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '调度事件类型 docker',
  `start_time` datetime DEFAULT NULL COMMENT '事件开始时间',
  `finish_time` datetime DEFAULT NULL COMMENT '事件完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='调度事件表，记录调度的事件';

-- ----------------------------
-- Table structure for rm_application
-- ----------------------------
DROP TABLE IF EXISTS `rm_application`;
CREATE TABLE `rm_application` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务系统名称',
  `alias` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简称,别名',
  `user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人编号',
  `integrator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '集成商',
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门',
  `parent_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父业务系统编号，默认：0-无父业务系统',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务系统';

-- ----------------------------
-- Table structure for rm_application_resource
-- ----------------------------
DROP TABLE IF EXISTS `rm_application_resource`;
CREATE TABLE `rm_application_resource` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `application_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务系统编号',
  `resource_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源编号',
  `resource_type_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源类型编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务系统与资源关系';

-- ----------------------------
-- Table structure for rm_docker_alarm
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_alarm`;
CREATE TABLE `rm_docker_alarm` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警源',
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '级别',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `count` int(255) DEFAULT NULL COMMENT '告警次数',
  `content` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警内容',
  `start_time` datetime DEFAULT NULL COMMENT '告警产生时间',
  `latest_time` datetime DEFAULT NULL COMMENT '最近产生时间',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源的namespace',
  `strategy_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobiles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警接收人手机号，多人用，隔开',
  `emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警接收人手机号，多人用，隔开',
  `mobile_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '短信告警状态，0未发送，1发送中，2发送成功，3发送失败，9发送异常(多次发送失败)',
  `email_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮件状态，0未发送，1发送中，2发送成功，3发送失败，9发送异常(多次发送失败)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='告警信息表';

-- ----------------------------
-- Table structure for rm_docker_auto_deploy
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_auto_deploy`;
CREATE TABLE `rm_docker_auto_deploy` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID编号',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `master_vip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '高可用IP',
  `network` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网络模式 calico flannel',
  `cidr` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器网段',
  `etcd_server` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '计算节点calico连接的ETCD地址',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部署类型 cluster slave',
  `slaves` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '计算节点信息',
  `masters` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '管理节点信息',
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部署状态 \r\n            部署中：deploying\r\n            部署成功 success\r\n            部署失败 failed\r\n            ',
  `log` mediumtext COLLATE utf8_unicode_ci COMMENT '部署日志',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='自动部署配置表';

-- ----------------------------
-- Table structure for rm_docker_auto_deploy_event
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_auto_deploy_event`;
CREATE TABLE `rm_docker_auto_deploy_event` (
  `id` varchar(32) NOT NULL COMMENT 'ID，主键',
  `source_build_config_id` varchar(64) DEFAULT NULL COMMENT '集成项目id',
  `deploy_name` varchar(32) DEFAULT NULL COMMENT '应用名称',
  `resource_status` varchar(255) DEFAULT NULL COMMENT '事件状态',
  `resource_name` varchar(255) DEFAULT NULL COMMENT '事件名称',
  `resource_status_reason` varchar(255) DEFAULT NULL COMMENT '事件原因',
  `start_time` datetime DEFAULT NULL COMMENT '事件开始时间',
  `finish_time` datetime DEFAULT NULL COMMENT '事件完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动部署事件表，记录自动部署的事件';

-- ----------------------------
-- Table structure for rm_docker_ceph_images
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_ceph_images`;
CREATE TABLE `rm_docker_ceph_images` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ceph image的名称',
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'USED 已使用，UNUSED 未使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ceph 的pool 里面的image';

-- ----------------------------
-- Table structure for rm_docker_ci
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_ci`;
CREATE TABLE `rm_docker_ci` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `project_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目类型（ant，maven，c ， c++等）',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建状态，构建中，构建完成',
  `code_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'SVN，git代码源',
  `last_build_time` datetime DEFAULT NULL COMMENT '上次构建时间',
  `ci_time` datetime DEFAULT NULL COMMENT '持续时间',
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='持续集成列表';

-- ----------------------------
-- Table structure for rm_docker_cluster
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_cluster`;
CREATE TABLE `rm_docker_cluster` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '路径地址',
  `insert_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_docker_coll
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_coll`;
CREATE TABLE `rm_docker_coll` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `kpi` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'KPI，目前只有APP',
  `kpi_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'KPI名称',
  `kpi_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '采集值',
  `cluster_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '集群Id',
  `coll_time` datetime DEFAULT NULL COMMENT '采集时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='统计信息表';

-- ----------------------------
-- Table structure for rm_docker_compose
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_compose`;
CREATE TABLE `rm_docker_compose` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型，目前只有pod',
  `description_file` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户id',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='container编排';

-- ----------------------------
-- Table structure for rm_docker_config_map
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_config_map`;
CREATE TABLE `rm_docker_config_map` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='configmap对应k8s中的configmap';

-- ----------------------------
-- Table structure for rm_docker_container
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_container`;
CREATE TABLE `rm_docker_container` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器名称',
  `command` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '执行的command',
  `args` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建容器时的参数',
  `workingDir` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'workingDir',
  `ports` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器的端口',
  `env` varchar(1280) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器的需要的环境变量,env',
  `cpu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器的CPU',
  `memory` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器的内存',
  `imagePullPolicy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建容器时的获取镜像的策略',
  `docker_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建容器获取的ID',
  `liveness_probe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'livenessProbe',
  `insert_time` datetime DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='container';

-- ----------------------------
-- Table structure for rm_docker_container_port
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_container_port`;
CREATE TABLE `rm_docker_container_port` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID',
  `container_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UUID，主键',
  `port_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='容器和端口关系';

-- ----------------------------
-- Table structure for rm_docker_container_relation
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_container_relation`;
CREATE TABLE `rm_docker_container_relation` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `pod_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'POD的ID',
  `container_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Container 与Pod的关系表';

-- ----------------------------
-- Table structure for rm_docker_container_volume
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_container_volume`;
CREATE TABLE `rm_docker_container_volume` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `container_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volumemount_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='容器和卷关系表';

-- ----------------------------
-- Table structure for rm_docker_daemonset
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_daemonset`;
CREATE TABLE `rm_docker_daemonset` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generation` int(11) DEFAULT NULL,
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_number_scheduled` int(11) DEFAULT NULL,
  `number_misscheduled` int(11) DEFAULT NULL,
  `desired_number_scheduled` int(11) DEFAULT NULL,
  `number_ready` int(11) DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='daemonset,对应kubernetes中的daemonset';

-- ----------------------------
-- Table structure for rm_docker_deployment
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_deployment`;
CREATE TABLE `rm_docker_deployment` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generation` int(11) DEFAULT NULL,
  `replicas` int(11) DEFAULT NULL,
  `updated_replicas` int(11) DEFAULT NULL,
  `available_replicas` int(11) DEFAULT NULL,
  `unavailable_replicas` int(11) DEFAULT NULL,
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_unavailable` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_surge` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='deployment,对应kubernetes中的deployment';

-- ----------------------------
-- Table structure for rm_docker_endpoints
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_endpoints`;
CREATE TABLE `rm_docker_endpoints` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建创时间',
  `subsets` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JSON格式的终端信息，包括IP和Port',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_docker_event
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_event`;
CREATE TABLE `rm_docker_event` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键，UUID',
  `uuid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'kubernetes中存在的UID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '事件名称',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'kubernetes中的namespace',
  `involved_object_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '影响的对象类型',
  `involved_object_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '影响的对象名称',
  `involved_object_uid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '影响的对象ID',
  `reason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产生的原因',
  `message` mediumtext COLLATE utf8_unicode_ci COMMENT '产生的信息',
  `source_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产生的组件，如kube-proxy',
  `first_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第一次产生时间',
  `last_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最新的产生时间',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='kubernetes事件';

-- ----------------------------
-- Table structure for rm_docker_images
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_images`;
CREATE TABLE `rm_docker_images` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键UUID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像名称',
  `version` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像版本',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像类型 private 私有 public公有',
  `locked` tinyint(1) DEFAULT NULL COMMENT '锁定镜像,0-false-未锁定，1-true-锁定',
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `creater` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制作者',
  `registry_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='镜像(images)';

-- ----------------------------
-- Table structure for rm_docker_image_acl
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_image_acl`;
CREATE TABLE `rm_docker_image_acl` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `acl` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'all' COMMENT 'push,pull,all',
  `login_account` varchar(64) DEFAULT NULL,
  `login_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rm_docker_image_replication_policy
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_image_replication_policy`;
CREATE TABLE `rm_docker_image_replication_policy` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `policy_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_describe` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repository_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_enable` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '1启用 0停用',
  `creator` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_docker_ingress
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_ingress`;
CREATE TABLE `rm_docker_ingress` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generation` int(11) DEFAULT NULL,
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingress_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ingress,对应kubernetes中的ingress';

-- ----------------------------
-- Table structure for rm_docker_ldap
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_ldap`;
CREATE TABLE `rm_docker_ldap` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ldap_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_dn` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_create_user` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_givenname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_lastname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_docker_loadbalancer
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_loadbalancer`;
CREATE TABLE `rm_docker_loadbalancer` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `ingress_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对外提供的IP地址',
  `service_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'service ID ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='负载HAproxy';

-- ----------------------------
-- Table structure for rm_docker_namespace
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_namespace`;
CREATE TABLE `rm_docker_namespace` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID,主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Namespace名称',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Namespace状态:Active',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `creation_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'kubernetes中获取的创建时间',
  `insert_time` datetime DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Namespace表，一般一个用户对应一个Namespace';

-- ----------------------------
-- Table structure for rm_docker_namespace_user
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_namespace_user`;
CREATE TABLE `rm_docker_namespace_user` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `namespace_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'namespace ID',
  `user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Namespace和用户的关系表';

-- ----------------------------
-- Table structure for rm_docker_networkpolicy
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_networkpolicy`;
CREATE TABLE `rm_docker_networkpolicy` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `pod_selector` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签选择器，用于选择对应的POD容器',
  `namespace` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '命名空间',
  `insert_time` date DEFAULT NULL,
  `creation_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_pod_selector` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '不能访问的应用标签',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='网络策略表';

-- ----------------------------
-- Table structure for rm_docker_node
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_node`;
CREATE TABLE `rm_docker_node` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '节点名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `cpu` int(11) DEFAULT NULL COMMENT 'CPU，个',
  `memory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Memory (KB)',
  `pods` int(11) DEFAULT NULL COMMENT 'POD的个数',
  `legacy_hostIP` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主机IP',
  `InternalIP` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内部IP',
  `kernelVersion` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'kernel版本',
  `osImage` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作系统名称',
  `containerRuntimeVersion` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'docker版本',
  `kubeletVersion` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'kubelet版本',
  `kubeProxyVersion` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'kubeProxy版本',
  `creationTimestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态,Ready,NotReady',
  `lastHeartbeatTime` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上一次心跳时间',
  `insert_time` datetime DEFAULT NULL COMMENT '入库时间',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='节点表，可以是主机也可以是虚拟机';

-- ----------------------------
-- Table structure for rm_docker_nodegroup
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_nodegroup`;
CREATE TABLE `rm_docker_nodegroup` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主机组名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标识，labels，可以将labels赋值给node',
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='主机组';

-- ----------------------------
-- Table structure for rm_docker_pod
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_pod`;
CREATE TABLE `rm_docker_pod` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'POD名称',
  `generateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'RC的名字+"-"',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `annotations` varchar(10240) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注释',
  `restart_policy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '重启策略，一般设定为Always',
  `pod_IP` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'POD的IP',
  `creation_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `start_time` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态,Pending,Ready,Running',
  `node_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'node表ID',
  `insert_time` datetime DEFAULT NULL COMMENT '入库时间',
  `liveness_probe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容器健康检查项，JSON形式存储',
  `created` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建类型，通过rc,daemonset等创建',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者的uid,一般为replicaset的uid',
  `owner_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应owner_uid的名字',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kubernetes中对应的POD';

-- ----------------------------
-- Table structure for rm_docker_pod_service
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_pod_service`;
CREATE TABLE `rm_docker_pod_service` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `service_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'service id',
  `pod_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'pod ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Pod和服务之间的关系表';

-- ----------------------------
-- Table structure for rm_docker_pod_volume
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_pod_volume`;
CREATE TABLE `rm_docker_pod_volume` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `volume_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'VOlume表ID',
  `pod_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'POD表的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='POD和Volume关系表';

-- ----------------------------
-- Table structure for rm_docker_port
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_port`;
CREATE TABLE `rm_docker_port` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '端口名称',
  `protocol` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '协议类型，TCP,UDP',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `target_port` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '映射的端口',
  `node_port` int(11) DEFAULT NULL COMMENT '映射到节点的端口，可以为空',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '端口占用类型，如Service，Container',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_docker_pv
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_pv`;
CREATE TABLE `rm_docker_pv` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `capacity` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容量',
  `access_modes` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'access_modes：ReadWriteOnce，ReadOnlyMany，ReadWriteMany',
  `reclaim_policy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Retain，Recycle ，Delete ',
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Available ，Bound ，Released ，Failed ',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型：RBD ，NFS',
  `spec` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存储类型的配置，json格式',
  `claim_ref_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='persistentvolume';

-- ----------------------------
-- Table structure for rm_docker_pvc
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_pvc`;
CREATE TABLE `rm_docker_pvc` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '容量',
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storage_class_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_modes` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'access_modes：ReadWriteOnce，ReadOnlyMany，ReadWriteMany',
  `requests` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Retain，Recycle ，Delete ',
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Available ，Bound ，Released ，Failed ',
  `namespace` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PersistentVolumeClaim';

-- ----------------------------
-- Table structure for rm_docker_rc
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_rc`;
CREATE TABLE `rm_docker_rc` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `replicas` int(11) DEFAULT NULL COMMENT '副本个数',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kubernetes中的RC';

-- ----------------------------
-- Table structure for rm_docker_relation_user_cluster
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_relation_user_cluster`;
CREATE TABLE `rm_docker_relation_user_cluster` (
  `user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_docker_replicaset
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_replicaset`;
CREATE TABLE `rm_docker_replicaset` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '选择器',
  `replicas` int(11) DEFAULT NULL COMMENT '副本数',
  `generation` int(11) DEFAULT NULL,
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者的UID,一般为deployment的uid',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='replicaset,对应kubernetes中的replicaset';

-- ----------------------------
-- Table structure for rm_docker_repository
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_repository`;
CREATE TABLE `rm_docker_repository` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像库地址',
  `insert_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='rm_docker_repository';

-- ----------------------------
-- Table structure for rm_docker_resource_quota
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_resource_quota`;
CREATE TABLE `rm_docker_resource_quota` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `hard` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '总配额',
  `used` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '已使用配额',
  `resource_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源类型',
  `creation_timestamp` datetime DEFAULT NULL COMMENT '创建时间',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资源配额';

-- ----------------------------
-- Table structure for rm_docker_secret
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_secret`;
CREATE TABLE `rm_docker_secret` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='configmap对应k8s中的secret';

-- ----------------------------
-- Table structure for rm_docker_service
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_service`;
CREATE TABLE `rm_docker_service` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID,主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'selector,选择器',
  `cluster_IP` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分配的IP',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ClusterIP,NodePort,LoadBalancer,ExternalName',
  `creation_timestamp` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='kubernetes中service';

-- ----------------------------
-- Table structure for rm_docker_service_port
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_service_port`;
CREATE TABLE `rm_docker_service_port` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID',
  `port_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UUID',
  `service_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务和端口关系表';

-- ----------------------------
-- Table structure for rm_docker_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_snapshot`;
CREATE TABLE `rm_docker_snapshot` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `pv_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'pv编号',
  `pv_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属pv名称',
  `utc_create` datetime DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快照描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='快照';

-- ----------------------------
-- Table structure for rm_docker_source_build_config
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_source_build_config`;
CREATE TABLE `rm_docker_source_build_config` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `build_image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建所需镜像名称，包含编译环境',
  `source_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '源码类型：git/svn',
  `source_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '源码地址',
  `git_branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'git分支',
  `src_username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '源码服务器认证用户名',
  `src_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '源码服务器认证密码',
  `build_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建类型maven/ant',
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建后生成的名字',
  `repository_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像仓库地址',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目描述',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建状态',
  `last_success_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '上次成功时间',
  `last_failure_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上次失败时间',
  `build_num` int(11) DEFAULT NULL COMMENT '构建次数',
  `namespace` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_build_infos` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存储[Dockerfile目录和镜像Tag]的列表',
  `is_rely` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否构建依赖(0:是；1：否。所依赖镜像构建完成后立即构建此镜像)',
  `rely_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建依赖类型（stable,unstable,fail）',
  `rely_project` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '依赖项目（镜像间用英文逗号隔开）',
  `poll_s_c_m` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '定时检查源码变更（根据SCM软件的版本号），如果有更新就checkout最新code下来，然后执行构建',
  `project_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目类型',
  `auto_build_infos` varchar(10240) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '自动部署列表信息（包含集群，应用，和匹配规则）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='持续集成配置表';

-- ----------------------------
-- Table structure for rm_docker_statefulset
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_statefulset`;
CREATE TABLE `rm_docker_statefulset` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID，主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `images` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '镜像',
  `labels` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '选择器',
  `replicas` int(11) DEFAULT NULL COMMENT '副本数',
  `generation` int(11) DEFAULT NULL,
  `annotations` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='statefulset,对应kubernetes中的statefulset(petset)';

-- ----------------------------
-- Table structure for rm_docker_thirdpartyresources
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_thirdpartyresources`;
CREATE TABLE `rm_docker_thirdpartyresources` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `versions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本',
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `cluster` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属集群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thirdpartyresources';

-- ----------------------------
-- Table structure for rm_docker_volumemount
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_volumemount`;
CREATE TABLE `rm_docker_volumemount` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `mount_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型,ceph,rbd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='容器volume表';

-- ----------------------------
-- Table structure for rm_docker_volumes
-- ----------------------------
DROP TABLE IF EXISTS `rm_docker_volumes`;
CREATE TABLE `rm_docker_volumes` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型,ceph,rbd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='docker volumes';

-- ----------------------------
-- Table structure for rm_federation_cluster
-- ----------------------------
DROP TABLE IF EXISTS `rm_federation_cluster`;
CREATE TABLE `rm_federation_cluster` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'UUID 主键',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '集群名称',
  `creation_timestamp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `server_address_by_client_cidrs` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器IP地址',
  `conditions` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地域',
  `zones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区块',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rm_local_remote_resource
-- ----------------------------
DROP TABLE IF EXISTS `rm_local_remote_resource`;
CREATE TABLE `rm_local_remote_resource` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `local_resource_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '本地资源编号',
  `remote_resource_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '远程资源编号',
  `remote_access_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '远程资源访问接口信息编号',
  `remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注：可以存储接口相关数据，json格式',
  `resource_type_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源类型编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` varchar(64) NOT NULL COMMENT '操作日志编号',
  `login_id` varchar(64) DEFAULT NULL COMMENT '登录日志编码',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户编码',
  `account` varchar(255) DEFAULT NULL COMMENT '用户账号',
  `func_ch_name` varchar(255) DEFAULT NULL COMMENT '功能模块中文名称',
  `func_en_name` varchar(255) DEFAULT NULL COMMENT '功能英文名称',
  `func_id` varchar(64) DEFAULT NULL COMMENT '功能编号',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作对象',
  `message` varchar(1024) DEFAULT NULL COMMENT '操作信息',
  `result` char(1) NOT NULL COMMENT '操作结果：成功(1)，失败(2),未知(0)',
  `start_time` datetime DEFAULT NULL COMMENT '操作起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '操作结束时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '角色编号',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `operation_type` varchar(10) DEFAULT NULL COMMENT '操作类型：1 只读类型 2 运维操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for sys_role_func
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_func`;
CREATE TABLE `sys_role_func` (
  `id` varchar(64) NOT NULL COMMENT '角色权限编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `func_auth_code` varchar(1024) DEFAULT NULL COMMENT '功能编号',
  `data_auth_code` varchar(1024) DEFAULT NULL COMMENT '资源权限编码',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `func_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '用户编号',
  `account` varchar(255) NOT NULL COMMENT '登录帐号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `employee_id` varchar(64) DEFAULT NULL COMMENT '员工编号',
  `mobile` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱地址',
  `status` char(1) DEFAULT '1' COMMENT '状态:1为正常，2为删除，3为锁定，4为冻结',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父用户编号，默认-0.表示没有父用户',
  `enable` char(1) DEFAULT '1' COMMENT '是否可用,1：是，0：否',
  `type` varchar(64) DEFAULT NULL COMMENT '用户类型：PRE_PAYMENT:预付费用户，POST_PAYMENT：后付费用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
--  sys_user init data
-- ----------------------------
set character set utf8;
INSERT INTO `sys_user` (`id`, `account`, `password`, `name`, `employee_id`, `mobile`, `email`, `status`, `update_time`, `parent_id`, `enable`, `type`) VALUES ('1', 'admin', 'hAGpZendyyNHMbYhLvB93EIURcSrCNJ8GhjnBBuO1cf8uoaxshwabhgLLOD7ADyiSyeXLWeSUY+8so+gf0hTyyYxpjYGw3rJzl83AqTAkrCE1LdrcmeYfbxI7SD4oV/1Y4QqIm97s2D93sfNnJNTWc6Oww995/CYaYk5nacr/bM=', '云服务中心管理员', '2410b4cafe424f79a0e54f5f367d6b69', '18902384092', 'test111@test.com', '1', NOW(), '', '', '');

INSERT INTO `sys_role` (`id`, `name`, `remark`, `update_time`, `operation_type`) VALUES ('9c69ab75b21640c089d0049dc61b98ed', '系统管理员', '系统管理员', NOW(), '2');

INSERT INTO `sys_role` (`id`, `name`, `remark`, `update_time`, `operation_type`) VALUES ('1', '业务管理员', '业务管理员', NOW(), '1');

INSERT INTO `sys_user_role` (`user_id`, `role_id`, `id`) VALUES ('1', '9c69ab75b21640c089d0049dc61b98ed', 'a4dc19e9-b457-41a2-8c1a-55fa3307ff0e');


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关系表';

-- ----------------------------
-- Table structure for tb_kube_conf_cont_dock
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_conf_cont_dock`;
CREATE TABLE `tb_kube_conf_cont_dock` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '节点标识IP地址',
  `UUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'docker的UUID',
  `INSERT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='节点IP和docker的UUID的对应关系';

-- ----------------------------
-- Table structure for tb_kube_perf_cont_cpumem
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_perf_cont_cpumem`;
CREATE TABLE `tb_kube_perf_cont_cpumem` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '节点标识IP地址',
  `CPU_TOTAL` double(20,10) DEFAULT NULL COMMENT 'CPU使用量',
  `CPU_USAGE_PERC` decimal(10,0) DEFAULT NULL COMMENT 'CPU使用率',
  `MEM_USAGE` decimal(20,0) DEFAULT NULL COMMENT '内存使用量',
  `MEM_USAGE_PERC` decimal(10,0) DEFAULT NULL COMMENT '内存使用率',
  `INSERT_TIME` datetime DEFAULT NULL COMMENT '采集时间',
  `MEM_CAPACITY` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='节点上containers的CPU和MEM使用情况';

-- ----------------------------
-- Table structure for tb_kube_perf_cont_filesystem
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_perf_cont_filesystem`;
CREATE TABLE `tb_kube_perf_cont_filesystem` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `FSNAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `CAPACITY` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USAGE_TOTAL` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FS_USAGE_PERC` decimal(3,0) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_kube_perf_cont_network_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_perf_cont_network_interface`;
CREATE TABLE `tb_kube_perf_cont_network_interface` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `IFNAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TXBYTESPERSECOND` decimal(10,0) DEFAULT NULL,
  `RXBYTESPERSECOND` decimal(10,0) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_kube_perf_dock_cpumem
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_perf_dock_cpumem`;
CREATE TABLE `tb_kube_perf_dock_cpumem` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAMESPACE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATIONTIME` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CPUUSAGETOTAL` decimal(20,0) DEFAULT NULL,
  `MEMUSAGE` decimal(20,0) DEFAULT NULL,
  `MEM_USAGE_PERC` decimal(3,0) DEFAULT NULL,
  `CPU_USAGE_PERC` decimal(3,0) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_kube_perf_dock_filesystem
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_perf_dock_filesystem`;
CREATE TABLE `tb_kube_perf_dock_filesystem` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UUID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `FSNAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `CAPACITY` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USAGE_TOTAL` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FS_USAGE_PERC` decimal(3,0) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tb_kube_perf_dock_network_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb_kube_perf_dock_network_interface`;
CREATE TABLE `tb_kube_perf_dock_network_interface` (
  `DEVICE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UUID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `IFNAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TXBYTESPERSECOND` decimal(10,0) DEFAULT NULL,
  `RXBYTESPERSECOND` decimal(10,0) DEFAULT NULL,
  `INSERT_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- View structure for sys_role_user_login_view
-- ----------------------------
DROP VIEW IF EXISTS `sys_role_user_login_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `sys_role_user_login_view` AS select `b`.`id` AS `user_id`,`b`.`account` AS `login_name`,`b`.`name` AS `display_name`,`b`.`password` AS `password`,`b`.`status` AS `status`,`b`.`mobile` AS `mobile`,`b`.`email` AS `email`,`b`.`employee_id` AS `employee_id`,`b`.`parent_id` AS `parent_id`,`b`.`enable` AS `enable`,`a`.`name` AS `role_name`,`a`.`remark` AS `role_remark`,`a`.`operation_type` AS `role_operation_type`,`a`.`update_time` AS `role_update_time`,`c`.`role_id` AS `role_id` from ((`sys_user` `b` left join `sys_user_role` `c` on((`b`.`id` = `c`.`user_id`))) left join `sys_role` `a` on((`a`.`id` = `c`.`role_id`))) order by `b`.`id` desc ;

-- ----------------------------
-- View structure for v_mm_alarm_strategy_rule_info
-- ----------------------------
DROP VIEW IF EXISTS `v_mm_alarm_strategy_rule_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_mm_alarm_strategy_rule_info` AS select `mm_alarm_strategy`.`id` AS `strategy_id`,`mm_alarm_strategy`.`name` AS `strategy_name`,`mm_alarm_strategy`.`period` AS `period`,`mm_alarm_strategy`.`create_time` AS `create_time`,`mm_alarm_strategy`.`user_id` AS `user_id`,`mm_alarm_strategy`.`level` AS `level`,`mm_alarm_strategy_resource`.`resource_type` AS `resource_type`,`mm_alarm_strategy_resource`.`resource_id` AS `resource_id`,`mm_alarm_rule`.`kpi` AS `kpi`,`mm_alarm_rule`.`expression` AS `expression`,`mm_alarm_rule`.`statistic` AS `statistic`,`mm_alarm_rule`.`threshold` AS `threshold`,`mm_alarm_strategy`.`start_time` AS `start_time`,`mm_alarm_strategy`.`end_time` AS `end_time`,`mm_alarm_strategy`.`alarm_form` AS `alarm_form`,`mm_alarm_strategy`.`alarm_interval` AS `alarm_interval` from ((`mm_alarm_strategy` join `mm_alarm_strategy_resource`) join `mm_alarm_rule`) where ((`mm_alarm_strategy`.`id` = `mm_alarm_strategy_resource`.`strategy_id`) and (`mm_alarm_rule`.`strategy_id` = `mm_alarm_strategy`.`id`)) ;

-- ----------------------------
-- View structure for v_rm_docker_app_pod
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_app_pod`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_app_pod` AS select `rm_docker_pod`.`id` AS `pod_id`,`rm_docker_pod`.`name` AS `pod_name`,`rm_docker_pod`.`generateName` AS `generateName`,`rm_docker_pod`.`labels` AS `labels`,`rm_docker_pod`.`annotations` AS `annotations`,`rm_docker_pod`.`restart_policy` AS `restart_policy`,`rm_docker_pod`.`pod_IP` AS `pod_IP`,`rm_docker_pod`.`creation_timestamp` AS `creation_timestamp`,`rm_docker_pod`.`start_time` AS `start_time`,`rm_docker_pod`.`status` AS `status`,`rm_docker_pod`.`node_id` AS `node_id`,`rm_docker_pod`.`insert_time` AS `insert_time`,`rm_application`.`id` AS `application_id`,`rm_application`.`name` AS `application_name`,`rm_application`.`alias` AS `alias`,`rm_application`.`user_id` AS `user_id`,`rm_application`.`integrator` AS `integrator`,`rm_application`.`department` AS `department`,`rm_application`.`parent_id` AS `parent_id`,`rm_application`.`remark` AS `remark` from (`rm_docker_pod` left join (`rm_application_resource` join `rm_application`) on(((`rm_docker_pod`.`id` = `rm_application_resource`.`resource_id`) and (`rm_application_resource`.`application_id` = `rm_application`.`id`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_app_rc
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_app_rc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_app_rc` AS select `rm_docker_rc`.`id` AS `rc_id`,`rm_docker_rc`.`name` AS `rc_name`,`rm_docker_rc`.`labels` AS `rc_labels`,`rm_docker_rc`.`replicas` AS `rc_replicas`,`rm_application`.`id` AS `application_id`,`rm_application`.`name` AS `application_name`,`rm_application`.`alias` AS `alias`,`rm_application`.`user_id` AS `user_id`,`rm_application`.`integrator` AS `integrator`,`rm_application`.`department` AS `department`,`rm_application`.`parent_id` AS `parent_id`,`rm_application`.`remark` AS `remark` from (`rm_application` left join (`rm_application_resource` join `rm_docker_rc`) on(((`rm_docker_rc`.`id` = `rm_application_resource`.`resource_id`) and (`rm_application_resource`.`application_id` = `rm_application`.`id`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_container_pod
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_container_pod`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_container_pod` AS select `rm_docker_container`.`id` AS `container_id`,`rm_docker_container`.`name` AS `container_name`,`rm_docker_container`.`command` AS `container_command`,`rm_docker_container`.`args` AS `container_args`,`rm_docker_container`.`workingDir` AS `container_workingDir`,`rm_docker_container`.`ports` AS `container_ports`,`rm_docker_container`.`env` AS `container_env`,`rm_docker_container`.`cpu` AS `container_cpu`,`rm_docker_container`.`memory` AS `container_memory`,`rm_docker_container`.`imagePullPolicy` AS `container_imagePullPolicy`,`rm_docker_container`.`image_id` AS `container_image_id`,`rm_docker_container`.`insert_time` AS `container_insert_time`,`rm_docker_container`.`liveness_probe` AS `container_liveness_probe`,`rm_docker_pod`.`id` AS `pod_id`,`rm_docker_pod`.`name` AS `pod_name`,`rm_docker_pod`.`generateName` AS `pod_generateName`,`rm_docker_pod`.`labels` AS `pod_labels`,`rm_docker_pod`.`restart_policy` AS `pod_restart_policy`,`rm_docker_pod`.`annotations` AS `pod_annotations`,`rm_docker_pod`.`pod_IP` AS `pod_IP`,`rm_docker_pod`.`creation_timestamp` AS `pod_creation_timestamp`,`rm_docker_pod`.`start_time` AS `pod_start_time`,`rm_docker_pod`.`status` AS `pod_status`,`rm_docker_pod`.`node_id` AS `pod_node_id`,`rm_docker_pod`.`insert_time` AS `pod_insert_time`,`rm_docker_container`.`docker_id` AS `container_docker_id`,`rm_docker_pod`.`namespace` AS `namespace`,`rm_docker_pod`.`cluster` AS `cluster` from ((`rm_docker_container` join `rm_docker_pod`) join `rm_docker_container_relation`) where ((`rm_docker_container`.`id` = `rm_docker_container_relation`.`container_id`) and (`rm_docker_container_relation`.`pod_id` = `rm_docker_pod`.`id`)) ;

-- ----------------------------
-- View structure for v_rm_docker_deploy_pod
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_deploy_pod`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_deploy_pod` AS select `rm_docker_deployment`.`id` AS `deploy_id`,`rm_docker_deployment`.`name` AS `deploy_name`,`rm_docker_deployment`.`labels` AS `deploy_labels`,`rm_docker_deployment`.`generation` AS `deploy_generation`,`rm_docker_deployment`.`replicas` AS `deploy_replicas`,`rm_docker_deployment`.`updated_replicas` AS `deploy_updated_replicas`,`rm_docker_deployment`.`available_replicas` AS `deploy_available_replicas`,`rm_docker_deployment`.`unavailable_replicas` AS `deploy_unavailable_replicas`,`rm_docker_deployment`.`selector` AS `deploy_selector`,`rm_docker_deployment`.`annotations` AS `deploy_annotations`,`rm_docker_deployment`.`max_unavailable` AS `deploy_max_unavailable`,`rm_docker_deployment`.`max_surge` AS `deploy_max_surge`,`rm_docker_deployment`.`creation_timestamp` AS `deploy_creation_timestamp`,`rm_docker_deployment`.`namespace` AS `deploy_namespace`,`rm_docker_pod`.`name` AS `pod_name`,`rm_docker_pod`.`generateName` AS `pod_generateName`,`rm_docker_pod`.`labels` AS `pod_labels`,`rm_docker_pod`.`annotations` AS `pod_annotations`,`rm_docker_pod`.`restart_policy` AS `pod_restart_policy`,`rm_docker_pod`.`pod_IP` AS `pod_IP`,`rm_docker_pod`.`creation_timestamp` AS `pod_create_timestamp`,`rm_docker_pod`.`start_time` AS `pod_start_time`,`rm_docker_pod`.`status` AS `pod_status`,`rm_docker_pod`.`insert_time` AS `pod_insert_time`,`rm_docker_pod`.`liveness_probe` AS `pod_liveness_probe`,`rm_docker_pod`.`created` AS `pod_created`,`rm_docker_pod`.`owner_name` AS `replicaset_name`,`rm_docker_pod`.`owner_uid` AS `replicaset_uid`,`rm_docker_pod`.`id` AS `pod_id`,`rm_docker_deployment`.`cluster` AS `cluster` from (((`rm_docker_deployment` join `rm_local_remote_resource` on(((`rm_docker_deployment`.`id` = `rm_local_remote_resource`.`local_resource_id`) and (`rm_docker_deployment`.`cluster` = `rm_local_remote_resource`.`remote_access_id`)))) join `rm_docker_replicaset` on(((`rm_local_remote_resource`.`remote_resource_id` = `rm_docker_replicaset`.`owner_uid`) and (`rm_docker_replicaset`.`cluster` = `rm_local_remote_resource`.`remote_access_id`)))) join `rm_docker_pod` on(((`rm_docker_replicaset`.`name` = `rm_docker_pod`.`owner_name`) and (`rm_docker_pod`.`cluster` = `rm_local_remote_resource`.`remote_access_id`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_image_policy_repository
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_image_policy_repository`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_image_policy_repository` AS (select `a`.`id` AS `id`,`a`.`policy_name` AS `policy_name`,`a`.`policy_describe` AS `policy_describe`,`a`.`repository_id` AS `repository_id`,`a`.`policy_enable` AS `policy_enable`,`a`.`creator` AS `policy_creator`,`a`.`insert_time` AS `policy_insert_time`,`b`.`name` AS `repository_name`,`b`.`url` AS `repository_url` from (`rm_docker_image_replication_policy` `a` left join `rm_docker_repository` `b` on((`a`.`repository_id` = `b`.`id`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_pod
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_pod`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_pod` AS select `rm_docker_pod`.`id` AS `pod_id`,`rm_docker_pod`.`name` AS `name`,`rm_docker_pod`.`labels` AS `labels`,`rm_docker_pod`.`annotations` AS `annotations`,`rm_docker_pod`.`pod_IP` AS `pod_IP`,`rm_docker_pod`.`restart_policy` AS `restart_policy`,`rm_docker_pod`.`creation_timestamp` AS `creation_timestamp`,`rm_docker_pod`.`start_time` AS `start_time`,`rm_docker_pod`.`status` AS `status`,`rm_docker_pod`.`node_id` AS `node_id`,`rm_docker_pod`.`insert_time` AS `insert_time`,`rm_docker_pod`.`namespace` AS `namespace`,`rm_docker_node`.`name` AS `node_name`,`rm_docker_node`.`InternalIP` AS `InternalIP`,`rm_docker_pod`.`cluster` AS `cluster` from (`rm_docker_pod` join `rm_docker_node` on(((`rm_docker_pod`.`node_id` = `rm_docker_node`.`id`) and (`rm_docker_pod`.`cluster` = `rm_docker_node`.`cluster`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_pod_node
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_pod_node`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_pod_node` AS select `rm_docker_pod`.`id` AS `id`,`rm_docker_pod`.`name` AS `name`,`rm_docker_pod`.`labels` AS `labels`,`rm_docker_pod`.`annotations` AS `annotations`,`rm_docker_pod`.`restart_policy` AS `restart_policy`,`rm_docker_pod`.`pod_IP` AS `pod_IP`,`rm_docker_pod`.`creation_timestamp` AS `creation_timestamp`,`rm_docker_pod`.`start_time` AS `start_time`,`rm_docker_pod`.`status` AS `status`,`rm_docker_pod`.`insert_time` AS `insert_time`,`rm_docker_pod`.`node_id` AS `node_id`,`rm_docker_node`.`name` AS `node_name`,`rm_docker_node`.`labels` AS `node_labels`,`rm_docker_node`.`cpu` AS `cpu`,`rm_docker_node`.`memory` AS `memory`,`rm_docker_node`.`pods` AS `pods`,`rm_docker_node`.`legacy_hostIP` AS `legacy_hostIP`,`rm_docker_node`.`InternalIP` AS `InternalIP`,`rm_docker_node`.`kernelVersion` AS `kernelVersion`,`rm_docker_node`.`osImage` AS `osImage`,`rm_docker_node`.`containerRuntimeVersion` AS `containerRuntimeVersion`,`rm_docker_node`.`kubeletVersion` AS `kubeletVersion`,`rm_docker_node`.`kubeProxyVersion` AS `kubeProxyVersion`,`rm_docker_node`.`creationTimestamp` AS `creationTimestamp`,`rm_docker_node`.`status` AS `node_status`,`rm_docker_node`.`lastHeartbeatTime` AS `lastHeartbeatTime` from (`rm_docker_node` join `rm_docker_pod`) where (`rm_docker_pod`.`node_id` = `rm_docker_node`.`id`) ;

-- ----------------------------
-- View structure for v_rm_docker_pod_service
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_pod_service`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_pod_service` AS select `rm_docker_service`.`id` AS `service_id`,`rm_docker_service`.`name` AS `service_name`,`rm_docker_service`.`labels` AS `service_labels`,`rm_docker_service`.`cluster_IP` AS `service_cluster_IP`,`rm_docker_service`.`creation_timestamp` AS `service_creation_timestamp`,`rm_docker_pod`.`id` AS `pod_id`,`rm_docker_pod`.`name` AS `pod_name`,`rm_docker_pod`.`generateName` AS `generateName`,`rm_docker_pod`.`labels` AS `pod_labels`,`rm_docker_pod`.`annotations` AS `annotations`,`rm_docker_pod`.`restart_policy` AS `restart_policy`,`rm_docker_pod`.`pod_IP` AS `pod_IP`,`rm_docker_pod`.`creation_timestamp` AS `creation_timestamp`,`rm_docker_pod`.`start_time` AS `start_time`,`rm_docker_pod`.`status` AS `status`,`rm_docker_pod`.`node_id` AS `node_id`,`rm_docker_pod`.`insert_time` AS `insert_time` from (`rm_docker_pod` left join (`rm_docker_service` join `rm_docker_pod_service`) on(((`rm_docker_service`.`id` = `rm_docker_pod_service`.`service_id`) and (`rm_docker_pod_service`.`pod_id` = `rm_docker_pod`.`id`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_relation_user_cluster
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_relation_user_cluster`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_relation_user_cluster` AS (select `a`.`user_id` AS `user_id`,`a`.`cluster_id` AS `cluster_id`,`b`.`name` AS `NAME`,`b`.`url` AS `URL` from (`rm_docker_relation_user_cluster` `a` left join `rm_docker_cluster` `b` on((`a`.`cluster_id` = `b`.`id`)))) ;

-- ----------------------------
-- View structure for v_rm_docker_service_port
-- ----------------------------
DROP VIEW IF EXISTS `v_rm_docker_service_port`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ssduser`@`%` SQL SECURITY DEFINER VIEW `v_rm_docker_service_port` AS select `rm_docker_port`.`id` AS `port_id`,`rm_docker_port`.`name` AS `port_name`,`rm_docker_port`.`protocol` AS `protocol`,`rm_docker_port`.`port` AS `port`,`rm_docker_port`.`target_port` AS `target_port`,`rm_docker_port`.`node_port` AS `node_port`,`rm_docker_port`.`type` AS `type`,`rm_docker_service`.`id` AS `id`,`rm_docker_service`.`name` AS `service_name`,`rm_docker_service`.`cluster_IP` AS `cluster_IP`,`rm_docker_service`.`creation_timestamp` AS `creation_timestamp`,`rm_docker_service`.`namespace` AS `namespace`,`rm_docker_service`.`labels` AS `labels`,`rm_docker_service`.`cluster` AS `cluster` from ((`rm_docker_port` join `rm_docker_service`) join `rm_docker_service_port` on(((`rm_docker_service`.`id` = `rm_docker_service_port`.`service_id`) and (`rm_docker_port`.`id` = `rm_docker_service_port`.`port_id`)))) where ((`rm_docker_port`.`id` = `rm_docker_service_port`.`port_id`) and (`rm_docker_service`.`id` = `rm_docker_service_port`.`service_id`)) ;

-- ----------------------------
-- Procedure structure for DEL_RM_DOCKER_COLL
-- ----------------------------

CREATE DEFINER=`ssduser`@`%` PROCEDURE `DEL_RM_DOCKER_COLL`() COMMENT '定时删除 rm_docker_coll 表数据' BEGIN DELETE FROM rm_docker_coll WHERE coll_time < DATE_SUB(NOW(), INTERVAL 1 DAY); END;


-- ----------------------------
-- Procedure structure for DEL_TB_KUBE_PERF
-- ----------------------------
CREATE DEFINER=`ssduser`@`%` PROCEDURE `DEL_TB_KUBE_PERF`() BEGIN DELETE FROM TB_KUBE_CONF_CONT_DOCK WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); DELETE FROM TB_KUBE_PERF_CONT_CPUMEM WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); DELETE FROM TB_KUBE_PERF_CONT_FILESYSTEM WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); DELETE FROM TB_KUBE_PERF_CONT_NETWORK_INTERFACE WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); DELETE FROM TB_KUBE_PERF_DOCK_CPUMEM WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); DELETE FROM TB_KUBE_PERF_DOCK_FILESYSTEM WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); DELETE FROM TB_KUBE_PERF_DOCK_NETWORK_INTERFACE WHERE INSERT_TIME < DATE_SUB(NOW(), INTERVAL 1 DAY); END;


-- ----------------------------
-- Event structure for job_del_rm_docker_coll
-- ----------------------------

CREATE DEFINER=`ssduser`@`%` EVENT `job_del_rm_docker_coll` ON SCHEDULE EVERY 6 HOUR STARTS '2016-06-06 15:00:49' ON COMPLETION NOT PRESERVE ENABLE DO CALL DEL_RM_DOCKER_COLL();

-- ----------------------------
-- Event structure for job_del_tb_kube_perf
-- ----------------------------
CREATE DEFINER=`ssduser`@`%` EVENT `job_del_tb_kube_perf` ON SCHEDULE EVERY 8 HOUR STARTS '2016-06-06 15:00:49' ON COMPLETION PRESERVE ENABLE DO CALL DEL_TB_KUBE_PERF();

