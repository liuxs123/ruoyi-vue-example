package com.ruoyi.volunteer.controller;

import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.volunteer.domain.TVolunteer;
import com.ruoyi.volunteer.service.ITVolunteerService;
import com.ruoyi.volunteer.mapper.TVolunteerMapper;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 志愿者信息Controller
 *
 * @author me
 * @date 2020-09-12
 */
@RestController
@RequestMapping("/module/volunteer")
public class TVolunteerController extends BaseController {
    @Autowired
    private ITVolunteerService tVolunteerService;

    @Autowired
    private TVolunteerMapper tVolunteerMapper;

/**
 * 查询志愿者信息列表
 */
@PreAuthorize("@ss.hasPermi('module:volunteer:list')")
@GetMapping("/list")
        public TableDataInfo list(TVolunteer tVolunteer) {
        startPage();
        List<TVolunteer> list = tVolunteerService.list(Wrappers.query(tVolunteer));
        return getDataTable(list);
    }
    
    /**
     * 导出志愿者信息列表
     */
    @PreAuthorize("@ss.hasPermi('module:volunteer:export')")
    @Log(title = "志愿者信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TVolunteer tVolunteer) {
        List<TVolunteer> list = tVolunteerService.list(Wrappers.query(tVolunteer));
        ExcelUtil<TVolunteer> util = new ExcelUtil<TVolunteer>(TVolunteer.class);
        return util.exportExcel(list, "volunteer");
    }

    /**
     * 获取志愿者信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('module:volunteer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(tVolunteerService.getById(id));
    }

    /**
     * 新增志愿者信息
     */
    @PreAuthorize("@ss.hasPermi('module:volunteer:add')")
    @Log(title = "志愿者信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TVolunteer tVolunteer)
    {
        return toAjax(tVolunteerMapper.insert(tVolunteer));
    }

    /**
     * 修改志愿者信息
     */
    @PreAuthorize("@ss.hasPermi('module:volunteer:edit')")
    @Log(title = "志愿者信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TVolunteer tVolunteer)
    {
        return toAjax(tVolunteerMapper.updateById(tVolunteer));
    }

    /**
     * 删除志愿者信息
     */
    @PreAuthorize("@ss.hasPermi('module:volunteer:remove')")
    @Log(title = "志愿者信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(tVolunteerMapper.deleteBatchIds(Arrays.asList(ids)));
    }
}
