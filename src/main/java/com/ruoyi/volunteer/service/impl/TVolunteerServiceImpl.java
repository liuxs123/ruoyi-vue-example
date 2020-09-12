package com.ruoyi.volunteer.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.volunteer.mapper.TVolunteerMapper;
import com.ruoyi.volunteer.domain.TVolunteer;
import com.ruoyi.volunteer.service.ITVolunteerService;

/**
 * 志愿者信息Service业务层处理
 *
 * @author me
 * @date 2020-09-12
 */
@Service
public class TVolunteerServiceImpl extends ServiceImpl<TVolunteerMapper, TVolunteer> implements ITVolunteerService {
    @Autowired
    private TVolunteerMapper tVolunteerMapper;

}
