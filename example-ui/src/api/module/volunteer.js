import request from '@/utils/request'

// 查询志愿者信息列表
export function listVolunteer(query) {
  return request({
    url: '/module/volunteer/list',
    method: 'get',
    params: query
  })
}

// 查询志愿者信息详细
export function getVolunteer(id) {
  return request({
    url: '/module/volunteer/' + id,
    method: 'get'
  })
}

// 新增志愿者信息
export function addVolunteer(data) {
  return request({
    url: '/module/volunteer',
    method: 'post',
    data: data
  })
}

// 修改志愿者信息
export function updateVolunteer(data) {
  return request({
    url: '/module/volunteer',
    method: 'put',
    data: data
  })
}

// 删除志愿者信息
export function delVolunteer(id) {
  return request({
    url: '/module/volunteer/' + id,
    method: 'delete'
  })
}

// 导出志愿者信息
export function exportVolunteer(query) {
  return request({
    url: '/module/volunteer/export',
    method: 'get',
    params: query
  })
}