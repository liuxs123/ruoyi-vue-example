-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('志愿者信息', '3', '1', 'volunteer', 'module/volunteer/index', 1, 'C', '0', '0', 'module:volunteer:list', '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '志愿者信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, path, component, is_frame, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('志愿者信息查询', @parentId, '1',  '#', '', 1,  'F', '0',  '0', 'module:volunteer:query',        '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, path, component, is_frame, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('志愿者信息新增', @parentId, '2',  '#', '', 1,  'F', '0',  '0', 'module:volunteer:add',          '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, path, component, is_frame, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('志愿者信息修改', @parentId, '3',  '#', '', 1,  'F', '0',  '0', 'module:volunteer:edit',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, path, component, is_frame, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('志愿者信息删除', @parentId, '4',  '#', '', 1,  'F', '0',  '0', 'module:volunteer:remove',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, path, component, is_frame, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('志愿者信息导出', @parentId, '5',  '#', '', 1,  'F', '0',  '0', 'module:volunteer:export',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');