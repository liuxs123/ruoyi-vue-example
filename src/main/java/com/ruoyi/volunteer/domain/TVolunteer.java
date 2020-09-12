package com.ruoyi.volunteer.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;

/**
 * 志愿者信息对象 t_volunteer
 *
 * @author me
 * @date 2020-09-12
 */
@ToString
@Data
@TableName("t_volunteer")
public class TVolunteer extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 姓名 */
    @Excel(name = "姓名")
    private String name;


    /** 电话 */
    @Excel(name = "电话")
    private String tel;


    /** 身份证 */
    @Excel(name = "身份证")
    private String idCard;


    /** 志愿者类型 */
    @Excel(name = "志愿者类型")
    private String type;


    /** 志愿者编号 */
    @Excel(name = "志愿者编号")
    private String no;


    /** 志愿者头像 */
    @Excel(name = "志愿者头像")
    private String headPic;


    /** 登录凭证 */
    @Excel(name = "登录凭证")
    private String token;


    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date refreshTime;


    /** 密码 */
    @Excel(name = "密码")
    private String password;


}
