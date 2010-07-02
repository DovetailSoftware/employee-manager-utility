/*****************************************************************************************
'
' Product        :  Employee Manager Schema Modification File
'
' Name           :  emp_schema.sch
'
' Description    :  This partial schema file provides information required
'                   required to update a Clarify schema for Employee Manager.
'
'                   In this partial schema file is:
'
'                   * One new table: workgroup
'                   * Two new tables for the internationalization objects
'                        fc_string
'                        fc_locale
'                   * One new relation to be applied to table_queue
'                   * Two new relations to be applied to table_privclass
'                   * One new relation to be applied to table_employee
'                   * One new relation to be applied to table_site
'                   * One new relation to be applied to table_biz_cal
'                   * One new relation to be applied to table_rc_config
'
'                   Use a text editor to cut+paste these changes into
'                   a current Clarify schema file.
'
' Usage          :  * Use the Clarify Data Dictionary Editor to export a schema file
'                   * Use a text editor to cut+paste these changes into the file
'                   * Use the Data Dictionary Editor to apply the schema file
'
'
' Author          : First Choice Software, Inc.
'                   4412 Spicewood Springs Road
'                   Austin, TX  78759
'                   (512) 418-2905
'
' Platforms       : This version supports Clarify 4.5 and later
'
' Copyright (C) 1999 First Choice Software, Inc.
' All Rights Reserved
'
' This file describes the changes to be made to your Clarify schema. Each of the
' sections describe what you have to do, and include the schema lines that must be
' placed in your schema file.
'
' All fields and relations MUST be placed at the end of their respective sections for
' their data objects.
'
' Any relation that is declared as USER_DEFINED must be located after any other
' relations that are defined by Clarify. Both the relation and the inverse relation
' must have the USER_DEFINED notation, or an error will be reported during the update.
'
*****************************************************************************************/

/*
 * Add (or replace) the following tables to the schema.
 */

OBJECT fc_string 3500
 SUBJECT="System"
 COMMENT="Locale-based strings for First Choice Software Customizations"
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    id  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="String ID"
,
    string  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
     COMMENT="Text  of the string"
,
    locale  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
     COMMENT="Indicates the locale of the string; e.g., EN_US=US English, JA_JP=Japanese in Japan"
,
    application  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

OBJECT fc_locale 3505
 SUBJECT="System"
 COMMENT=" "
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    locale_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    abday  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    day  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    abmon  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    mon  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    d_t_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    d_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    t_fmt  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    am_pm  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    t_fmt_ampm  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    upper  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    lower  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    space  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    cntrl  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    punct  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    digit  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    xdigit CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    blank  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    toupper  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    tolower  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    yesexpr  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255
,
    noexpr  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=255

,
    int_curr_symbol  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    currency_symbol  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    mon_decimal_point  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    mon_thousands_sep  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    mon_grouping  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED COMMENT=""
,
    positive_sign  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    negative_sign  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=10
,
    int_frac_digits  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    frac_digits  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    p_cs_precedes  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    p_sep_by_space  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    n_cs_precedes  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    n_sep_by_space  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    p_sign_posn  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    n_sign_posn  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED

,
    decimal_point  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    thousands_sep  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    grouping  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY USER_DEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
OBJECT_END;

OBJECT workgroup 3516
 SUBJECT="Workflow Mgr"
 COMMENT="Workgroups."
  FIELDS
    objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     MANDATORY PREDEFINED
     GEN_FIELD_ID=3
     COMMENT="Internal record number"
,
    work_group  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
,
    x_site_name_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="site_name is enabled when defining new member of this workgroup"
,
    x_site_objid  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="objid of workgroup site (if used)"
,
    x_site_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="site name for new member of this workgroup"
,
    x_act_supervisor_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="acting supervisor checkbox is enabled when defining new member of this workgroup"
,
    x_act_supervisor  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="acting supervisor status for new member of this workgroup"
,
    x_online_priv_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="online privelege definition is enabled when defining new member of this workgroup"
,
    x_online_priv  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="online privelege class for new member of this workgroup"
,
    x_offline_priv_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="offline privelege definition is enabled when defining new member of this workgroup"
,
    x_offline_priv  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="offline privelege class for new member of this workgroup"
,
    x_fax_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="fax phone is enabled when defining new member of this workgroup"
,
    x_fax  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=20
     COMMENT="fax number for new member of this workgroup"
,
    x_mail_stop_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="mailstop is enabled when defining new member for this group"
,
    x_mail_stop  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=30
     COMMENT="mail stop for new member of this workgroup"
,
    x_labor_rate_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="labor rate is enabled for new member of this workgroup"
,
    x_labor_rate  CMN_DATA_TYPE="float" DB_DATA_TYPE=3
     OPTIONAL USER_DEFINED
     COMMENT="labor rate for new member of this workgroup"
,
    x_source_ctl_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="source control selection is enabled when defining new member of this workgroup"
,
    x_source_control  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="source control system for new member of this workgroup"
,
    x_field_eng_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="field engineer checkbox is enabled when definining new member in this workgroup"
,
    x_field_eng  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="field engineer checkbox status for new member of the workgroup"
,
    x_allow_proxy_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="allow proxy checkbox is enabled when defining new member of this workgroup"
,
    x_allow_proxy  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="allow proxy checkbox status for new member of this workgroup"
,
    x_notification_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="notification defaults enabled for new member of this workgroup"
,
    x_notify_hours  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for employee notification during or after business hours"
,
    x_notify_high  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for high priority employee notification"
,
    x_notify_med  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for medium priority employee notification"
,
    x_notify_low  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for low priority employee notification"
,
    x_default_printer_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="default printer selection is enabled when defining new member of this workgroup"
,
    x_default_printer  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index of default printer for new workgroup member"
,
    x_biz_cal_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="enable business calendar selection when adding member to this workgroup"
,
    x_biz_cal_title  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="name of business calendar for new member of this workgroup"
,
    x_biz_cal_eff_today  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="business calendar takes effect today for new member of this workgroup"
,
    x_bizcal_start_date  CMN_DATA_TYPE="clk_ty_time" DB_DATA_TYPE=9
     OPTIONAL USER_DEFINED
     COMMENT="business calendar start date when defining new member in this workgroup"
,
    x_bizcal_eff_date_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="defines that a business calendar starting date exists. This may be 'TODAY' (biz_cal_eff_today) or a specific date (bizcal_start_date)"
,
    x_resource_cfg_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="default resource config is enabled for new member in this workgroup"
,
    x_rc_config_name  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="name of resource config for new member of this workgroup"
,
    x_emp_start_date_today  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="set the employee start date to today when adding member to this workgroup"
,
    x_wrkgrp_start_date_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="enable the employee workgroup start date when adding member to this workgroup"
,
    x_wrkgroup_start_today  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="set the employee workgroup start date to today when defining new employee in this workgroup"
,
    x_wrkgroup_start_date  CMN_DATA_TYPE="clk_ty_time" DB_DATA_TYPE=9
     OPTIONAL USER_DEFINED
     COMMENT="workgroup start date when defining new member in this workgroup"
,
    x_supervisor_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="enable the default supervisor when adding member to this workgroup"
,
    x_supervisor_first  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=30
     COMMENT="name of supervisor for new member of this workgroup (firstname)"
,
    x_supervisor_last  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=30
     COMMENT="supervisor last name for new members for this workgroup"
,
    x_password_en  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED
     COMMENT="enable default password for new member of this workgroup"
,
    x_password  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=30
     COMMENT="default password for new member of this workgroup"
,
    x_after_notify_high  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for high priority employee notification"
,
    x_after_notify_med  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for medium priority employee notification"
,
    x_after_notify_low  CMN_DATA_TYPE="char pointer" DB_DATA_TYPE=7
     OPTIONAL USER_DEFINED
     ARRAY_SIZE=80
     COMMENT="list element index for low priority employee notification"
,
    dev  CMN_DATA_TYPE="long integer" DB_DATA_TYPE=0
     OPTIONAL USER_DEFINED ALLOW_NULL
     GEN_FIELD_ID=151
     DEFAULT="1"
     COMMENT="Row version number for mobile distribution purposes"
  FIELDS_END
  RELATIONS
    workgroup2site MTO site
     USER_DEFINED
     INV_REL=site2workgroup     COMMENT="Related site (if used - workgroup may not be site related)"
,
    wgroup_online2privclass MTO privclass
     USER_DEFINED
     INV_REL=privclass2wgroup_online     COMMENT="Related online privelege class"
,
    wgroup_offline2privclass MTO privclass
     USER_DEFINED
     INV_REL=privclass2wgroup_offline     COMMENT="Related offline privelege class"
,
    wgroup_super2empl MTO employee
     USER_DEFINED
     INV_REL=empl2wgroup_super     COMMENT="Related supervisor"
,
    workgroup2biz_cal MTO biz_cal
     USER_DEFINED
     INV_REL=biz_cal2workgroup     COMMENT="Related business calendar if used"
,
    workgroup2rc_config MTO rc_config
     USER_DEFINED
     INV_REL=rc_config2workgroup     COMMENT="Related resource config"
,
    workgroup2queue MTM queue
     USER_DEFINED
     INV_REL=queue2workgroup     COMMENT="Related queue(s)"

  RELATIONS_END
OBJECT_END;

/*
 * Add the following relations as the last relations in OBJECT queue
 */
,
    queue2workgroup MTM workgroup
     USER_DEFINED
     INV_REL=workgroup2queue     COMMENT="Related workgroup(s)"

/*
 * Add the following relations as the last relations in OBJECT privclass
 */
,
    privclass2wgroup_offline OTM workgroup
     USER_DEFINED
     INV_REL=wgroup_offline2privclass     COMMENT="offline privelege class for related workgroup"
,
    privclass2wgroup_online OTM workgroup
     USER_DEFINED
     INV_REL=wgroup_online2privclass     COMMENT="online privelege class for related workgroup"

/*
 * Add the following relations as the last relations in OBJECT employee
 */
,
    empl2wgroup_super OTM workgroup
     USER_DEFINED
     INV_REL=wgroup_super2empl     COMMENT="supervisor of Related workgroup"

/*
 * Add the following relations as the last relations in OBJECT site
 */
,
    site2workgroup OTM workgroup
     USER_DEFINED
     INV_REL=workgroup2site     COMMENT="Related workgroup (if used - workgroup may not be site related)"

/*
 * Add the following relations as the last relations in OBJECT biz_cal
 */
,
    biz_cal2workgroup OTM workgroup
     USER_DEFINED
     INV_REL=workgroup2biz_cal     COMMENT="Related workgroup if used"

/*
 * Add the following relations as the last relations in OBJECT rc_config
 */
,
    rc_config2workgroup OTM workgroup
     USER_DEFINED
     INV_REL=workgroup2rc_config     COMMENT="Related workgroup(s)"
 