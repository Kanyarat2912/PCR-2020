-- --------------------------------------------------------
-- Host:                         10.73.148.20
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5278
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pcrdb
CREATE DATABASE IF NOT EXISTS `pcrdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pcrdb`;

-- Dumping structure for table pcrdb.login_log
CREATE TABLE IF NOT EXISTS `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_ID` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.log_send_mail
CREATE TABLE IF NOT EXISTS `log_send_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_ID` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pcr_form` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_acknowledge_person
CREATE TABLE IF NOT EXISTS `pcr_acknowledge_person` (
  `ack_id` int(11) NOT NULL AUTO_INCREMENT,
  `ack_emp_id` varchar(255) DEFAULT NULL COMMENT 'รหัสพนักงาน',
  `ack_fm_id` varchar(255) DEFAULT NULL COMMENT 'PCR Form',
  `ack_phase` int(11) DEFAULT NULL COMMENT '1=Plan,2=Result',
  PRIMARY KEY (`ack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_annual_plan
CREATE TABLE IF NOT EXISTS `pcr_annual_plan` (
  `anp_anp_number` varchar(50) NOT NULL,
  `anp_part_name` varchar(255) DEFAULT NULL,
  `anp_title` varchar(100) DEFAULT NULL,
  `anp_cus_sub` varchar(255) DEFAULT NULL,
  `anp_line` varchar(255) DEFAULT NULL,
  `anp_output` varchar(255) DEFAULT NULL,
  `anp_process_name` varchar(255) DEFAULT NULL,
  `anp_add_item` int(11) DEFAULT NULL,
  `anp_plan_review` int(11) DEFAULT NULL,
  `anp_create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `anp_update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `anp_ct_id` int(11) DEFAULT NULL,
  `anp_aps_id` int(11) DEFAULT NULL,
  `anp_cp_id` int(11) DEFAULT NULL,
  `anp_sec_id` int(11) DEFAULT NULL,
  `anp_pro_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1 = ยังไม่ได้ใช้, 0 = ใช้แล้ว',
  `anp_rk_id` int(11) DEFAULT NULL,
  `anp_is_delete` int(11) DEFAULT '1' COMMENT '0=Delete,1=Not delete',
  `anp_issue` varchar(255) DEFAULT NULL,
  `anp_concern` varchar(255) DEFAULT NULL,
  `anp_company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`anp_anp_number`),
  KEY `anp_aps_id` (`anp_aps_id`),
  KEY `FK_pcr_annual_plan_pcr_change_type` (`anp_ct_id`),
  KEY `FK_pcr_annual_plan_pcr_change_point` (`anp_cp_id`),
  KEY `FK_pcr_annual_plan_pcr_section_anp` (`anp_sec_id`),
  KEY `FK_pcr_annual_plan_pcr_product` (`anp_pro_id`),
  KEY `FK_pcr_annual_plan_pcr_rank` (`anp_rk_id`),
  CONSTRAINT `FK_pcr_annual_plan_pcr_change_point` FOREIGN KEY (`anp_cp_id`) REFERENCES `pcr_change_point` (`cp_id`),
  CONSTRAINT `FK_pcr_annual_plan_pcr_change_type` FOREIGN KEY (`anp_ct_id`) REFERENCES `pcr_change_type` (`ct_id`),
  CONSTRAINT `FK_pcr_annual_plan_pcr_product` FOREIGN KEY (`anp_pro_id`) REFERENCES `pcr_product` (`pro_id`),
  CONSTRAINT `FK_pcr_annual_plan_pcr_rank` FOREIGN KEY (`anp_rk_id`) REFERENCES `pcr_rank` (`rk_id`),
  CONSTRAINT `FK_pcr_annual_plan_pcr_section_anp` FOREIGN KEY (`anp_sec_id`) REFERENCES `pcr_section_anp` (`sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_anp_status
CREATE TABLE IF NOT EXISTS `pcr_anp_status` (
  `aps_id` int(11) NOT NULL,
  `aps_name` varchar(255) NOT NULL,
  PRIMARY KEY (`aps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_approve_role
CREATE TABLE IF NOT EXISTS `pcr_approve_role` (
  `apr_id` int(11) NOT NULL AUTO_INCREMENT,
  `apr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`apr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_attach_doc
CREATE TABLE IF NOT EXISTS `pcr_attach_doc` (
  `att_id` varchar(50) NOT NULL,
  `att_pfmea` varchar(50) DEFAULT NULL,
  `att_qa_network` varchar(50) DEFAULT NULL,
  `att_control_plan` varchar(50) DEFAULT NULL,
  `att_wi` varchar(2) DEFAULT NULL,
  `att_machine_spec` varchar(2) DEFAULT NULL,
  `att_daily_check` varchar(2) DEFAULT NULL,
  `att_other` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_auto_gen
CREATE TABLE IF NOT EXISTS `pcr_auto_gen` (
  `num` int(20) NOT NULL,
  `seq` int(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_bkd_approver
CREATE TABLE IF NOT EXISTS `pcr_bkd_approver` (
  `bka_id` int(11) NOT NULL AUTO_INCREMENT,
  `bka_emp_code` varchar(255) NOT NULL,
  `bka_name` varchar(255) DEFAULT NULL,
  `bka_pos` varchar(255) DEFAULT NULL,
  `bka_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`bka_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_bkd_form
CREATE TABLE IF NOT EXISTS `pcr_bkd_form` (
  `bkd_id` varchar(50) NOT NULL,
  `bkd_request_type` int(1) DEFAULT NULL,
  `Emp_ID` varchar(255) DEFAULT NULL,
  `bkd_comment` varchar(255) DEFAULT NULL,
  `bkd_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bkd_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bkd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_cancel_log
CREATE TABLE IF NOT EXISTS `pcr_cancel_log` (
  `pcr_id` varchar(50) NOT NULL,
  `Emp_ID` varchar(50) NOT NULL,
  `Datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pcr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_change_point
CREATE TABLE IF NOT EXISTS `pcr_change_point` (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_change_type
CREATE TABLE IF NOT EXISTS `pcr_change_type` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ct_name` varchar(255) NOT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_concern
CREATE TABLE IF NOT EXISTS `pcr_concern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_ID` varchar(50) DEFAULT NULL,
  `pcr_form` varchar(255) DEFAULT NULL,
  `fh` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1-PCR` (`pcr_form`),
  CONSTRAINT `FK1-PCR` FOREIGN KEY (`pcr_form`) REFERENCES `pcr_form` (`fm_pcr_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_concern_group
CREATE TABLE IF NOT EXISTS `pcr_concern_group` (
  `ccr_cct_id` int(11) NOT NULL AUTO_INCREMENT,
  `ccr_emp_code` varchar(255) NOT NULL,
  `ccr_product` int(11) DEFAULT NULL,
  PRIMARY KEY (`ccr_cct_id`),
  KEY `FK1_CC` (`ccr_product`),
  CONSTRAINT `FK1_CC` FOREIGN KEY (`ccr_product`) REFERENCES `pcr_product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_concern_type
CREATE TABLE IF NOT EXISTS `pcr_concern_type` (
  `cct_id` int(11) NOT NULL AUTO_INCREMENT,
  `cct_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_email
CREATE TABLE IF NOT EXISTS `pcr_email` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `dec` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1 = เปิด, 0 = ปิด',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_file_type
CREATE TABLE IF NOT EXISTS `pcr_file_type` (
  `ft_id` int(11) NOT NULL,
  `ft_name` varchar(255) NOT NULL,
  PRIMARY KEY (`ft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_file_upload
CREATE TABLE IF NOT EXISTS `pcr_file_upload` (
  `fup_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `fup_name` varchar(255) DEFAULT NULL,
  `fup_upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fup_upload_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fup_ft_id` int(11) DEFAULT NULL,
  `fup_fm_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fup_file_id`),
  KEY `fup_ft_id` (`fup_ft_id`),
  KEY `fup_fm_id` (`fup_fm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_flow_approve
CREATE TABLE IF NOT EXISTS `pcr_flow_approve` (
  `ap_id` int(11) NOT NULL AUTO_INCREMENT,
  `ap_emp_code` varchar(50) DEFAULT NULL,
  `ap_tsmp` timestamp NULL DEFAULT NULL,
  `ap_step` int(11) DEFAULT NULL,
  `ap_sap_id` int(11) DEFAULT '0',
  `ap_apr_id` int(11) DEFAULT NULL,
  `ap_ph_id` int(11) DEFAULT NULL,
  `ap_fm_id` varchar(50) DEFAULT NULL,
  `ap_comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ap_id`),
  KEY `ap_apr_id` (`ap_apr_id`),
  KEY `ap_ph_id` (`ap_ph_id`),
  KEY `ap_fm_id` (`ap_fm_id`),
  KEY `ap_sap_id` (`ap_sap_id`),
  CONSTRAINT `ap_apr_id` FOREIGN KEY (`ap_apr_id`) REFERENCES `pcr_approve_role` (`apr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ap_ph_id` FOREIGN KEY (`ap_ph_id`) REFERENCES `pcr_phase` (`ph_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ap_sap_id` FOREIGN KEY (`ap_sap_id`) REFERENCES `pcr_status_approve` (`sap_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1054 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_form
CREATE TABLE IF NOT EXISTS `pcr_form` (
  `fm_id` int(11) NOT NULL AUTO_INCREMENT,
  `fm_pcr_number` varchar(255) NOT NULL,
  `fm_pcr_leadtime` varchar(255) DEFAULT NULL,
  `fm_part_number` varchar(255) DEFAULT NULL,
  `fm_state_app` int(11) NOT NULL DEFAULT '1',
  `fm_phase` int(11) NOT NULL DEFAULT '1',
  `fm_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fm_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fm_anp_id` varchar(50) DEFAULT NULL,
  `fm_usr_emp_code` varchar(255) DEFAULT NULL,
  `fm_quality` int(11) DEFAULT NULL,
  `fm_safety` int(11) DEFAULT NULL,
  `fm_delivery` int(11) DEFAULT NULL,
  `fm_flowout` int(11) DEFAULT NULL,
  `fm_ack_person` int(11) DEFAULT NULL,
  `is_delete` int(1) DEFAULT '1',
  `checkk` int(1) DEFAULT '0' COMMENT '0 = ปกติ, 1=Result, 3 = R, 4 = C',
  PRIMARY KEY (`fm_pcr_number`),
  KEY `fm_anp_id` (`fm_anp_id`),
  KEY `fm_usr_emp_code` (`fm_usr_emp_code`),
  KEY `fm_ack_person` (`fm_ack_person`),
  KEY `fm_id` (`fm_id`),
  CONSTRAINT `fm_ack_person` FOREIGN KEY (`fm_ack_person`) REFERENCES `pcr_acknowledge_person` (`ack_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_form_priority
CREATE TABLE IF NOT EXISTS `pcr_form_priority` (
  `fp_fm_id` varchar(50) DEFAULT NULL,
  `fp_pri_id` int(11) DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `fp_fm_id` (`fp_fm_id`),
  KEY `fp_pri_id` (`fp_pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_history
CREATE TABLE IF NOT EXISTS `pcr_history` (
  `his_id` int(11) NOT NULL AUTO_INCREMENT,
  `his_emp_code` varchar(255) DEFAULT NULL,
  `his_fname` varchar(255) DEFAULT NULL,
  `his_lname` varchar(255) DEFAULT NULL,
  `his_section_id` int(11) DEFAULT NULL,
  `his_dept_id` int(11) DEFAULT NULL,
  `his_pos_id` int(11) DEFAULT NULL,
  `his_pcr_number` int(11) DEFAULT NULL,
  `his_anp_number` varchar(255) DEFAULT NULL,
  `his_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `his_year` int(11) DEFAULT NULL,
  `his_ap_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`his_id`),
  KEY `his_ap_id` (`his_ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_implement
CREATE TABLE IF NOT EXISTS `pcr_implement` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `im_name` varchar(255) NOT NULL,
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_implement_form
CREATE TABLE IF NOT EXISTS `pcr_implement_form` (
  `mf_id` int(11) NOT NULL AUTO_INCREMENT,
  `mf_date_plan` date NOT NULL,
  `mf_date_result` date DEFAULT NULL,
  `mf_im_id` int(11) DEFAULT NULL,
  `mf_fm_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mf_id`),
  KEY `mf_im_id` (`mf_im_id`),
  KEY `mf_fm_id` (`mf_fm_id`),
  CONSTRAINT `mf_fm_id` FOREIGN KEY (`mf_fm_id`) REFERENCES `pcr_form` (`fm_pcr_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mf_im_id` FOREIGN KEY (`mf_im_id`) REFERENCES `pcr_implement` (`im_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=643 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_meeting_form
CREATE TABLE IF NOT EXISTS `pcr_meeting_form` (
  `mtf_mt_id` int(1) DEFAULT NULL,
  `mtf_qap_id` varchar(50) DEFAULT NULL,
  KEY `mtf_mt_id` (`mtf_mt_id`),
  KEY `mtf_qap_id` (`mtf_qap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_phase
CREATE TABLE IF NOT EXISTS `pcr_phase` (
  `ph_id` int(11) NOT NULL AUTO_INCREMENT,
  `ph_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ph_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_priority
CREATE TABLE IF NOT EXISTS `pcr_priority` (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_product
CREATE TABLE IF NOT EXISTS `pcr_product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(255) NOT NULL,
  `flow` int(1) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_pcr_product_pcr_qac_type_approve` (`flow`),
  CONSTRAINT `FK_pcr_product_pcr_qac_type_approve` FOREIGN KEY (`flow`) REFERENCES `pcr_qac_type_approve` (`cta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_qac_approver
CREATE TABLE IF NOT EXISTS `pcr_qac_approver` (
  `qca_id` int(11) NOT NULL AUTO_INCREMENT,
  `qca_emp_code` varchar(255) NOT NULL,
  `qca_cta_id` int(11) DEFAULT NULL,
  `qca_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`qca_id`),
  KEY `qca_cta_id` (`qca_cta_id`),
  CONSTRAINT `qca_cta_id` FOREIGN KEY (`qca_cta_id`) REFERENCES `pcr_qac_type_approve` (`cta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_qac_type_approve
CREATE TABLE IF NOT EXISTS `pcr_qac_type_approve` (
  `cta_id` int(11) NOT NULL AUTO_INCREMENT,
  `cta_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_qap_approver
CREATE TABLE IF NOT EXISTS `pcr_qap_approver` (
  `qpa_id` int(11) DEFAULT NULL,
  `qpa_emp_code` varchar(255) NOT NULL,
  `qpa_name` varchar(255) DEFAULT NULL,
  `qpa_pos` varchar(255) DEFAULT NULL,
  `qpa_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`qpa_emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_qap_form
CREATE TABLE IF NOT EXISTS `pcr_qap_form` (
  `qap_id` varchar(50) NOT NULL,
  `qap_chairman` varchar(255) NOT NULL,
  `qap_comment` varchar(255) NOT NULL,
  `qap_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qap_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`qap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_qap_meeting
CREATE TABLE IF NOT EXISTS `pcr_qap_meeting` (
  `mt_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_name` varchar(255) NOT NULL,
  PRIMARY KEY (`mt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_rank
CREATE TABLE IF NOT EXISTS `pcr_rank` (
  `rk_id` int(11) NOT NULL AUTO_INCREMENT,
  `rk_name` varchar(255) NOT NULL,
  `rk_pri` int(11) DEFAULT NULL,
  PRIMARY KEY (`rk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_register_approve
CREATE TABLE IF NOT EXISTS `pcr_register_approve` (
  `reg_id_app` int(11) NOT NULL AUTO_INCREMENT,
  `reg_emp_code` varchar(255) DEFAULT NULL,
  `reg_app_em_code` varchar(255) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reg_id_app`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_reject
CREATE TABLE IF NOT EXISTS `pcr_reject` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_ID` varchar(5) DEFAULT NULL,
  `fh` int(1) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pcr_id` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_role
CREATE TABLE IF NOT EXISTS `pcr_role` (
  `rl_id` int(11) NOT NULL AUTO_INCREMENT,
  `rl_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_section_anp
CREATE TABLE IF NOT EXISTS `pcr_section_anp` (
  `sec_id` int(11) NOT NULL AUTO_INCREMENT,
  `sec_name` varchar(255) NOT NULL,
  `sec_comp_type` varchar(255) NOT NULL,
  PRIMARY KEY (`sec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_slideshow
CREATE TABLE IF NOT EXISTS `pcr_slideshow` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_status_approve
CREATE TABLE IF NOT EXISTS `pcr_status_approve` (
  `sap_id` int(11) NOT NULL,
  `sap_name` varchar(255) NOT NULL,
  PRIMARY KEY (`sap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_status_regis
CREATE TABLE IF NOT EXISTS `pcr_status_regis` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_name` varchar(255) NOT NULL,
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table pcrdb.pcr_user
CREATE TABLE IF NOT EXISTS `pcr_user` (
  `usr_emp_code` varchar(255) NOT NULL,
  `usr_password` varchar(255) DEFAULT NULL,
  `usr_start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usr_exp_date` date DEFAULT NULL,
  `usr_sr_id` int(1) DEFAULT '3',
  `usr_rl_id` int(1) DEFAULT '1',
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usr_emp_code`),
  KEY `usr_rl_id` (`usr_rl_id`),
  KEY `usr_sr_id` (`usr_sr_id`),
  CONSTRAINT `usr_rl_id` FOREIGN KEY (`usr_rl_id`) REFERENCES `pcr_role` (`rl_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usr_sr_id` FOREIGN KEY (`usr_sr_id`) REFERENCES `pcr_status_regis` (`sr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
