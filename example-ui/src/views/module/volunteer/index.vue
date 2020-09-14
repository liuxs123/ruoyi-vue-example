<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电话" prop="tel">
        <el-input
          v-model="queryParams.tel"
          placeholder="请输入电话"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="身份证" prop="idCard">
        <el-input
          v-model="queryParams.idCard"
          placeholder="请输入身份证"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="志愿者类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择志愿者类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="志愿者编号" prop="no">
        <el-input
          v-model="queryParams.no"
          placeholder="请输入志愿者编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="志愿者头像" prop="headPic">
        <el-input
          v-model="queryParams.headPic"
          placeholder="请输入志愿者头像"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="登录凭证" prop="token">
        <el-input
          v-model="queryParams.token"
          placeholder="请输入登录凭证"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="更新时间" prop="refreshTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.refreshTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择更新时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          v-model="queryParams.password"
          placeholder="请输入密码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['module:volunteer:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['module:volunteer:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['module:volunteer:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['module:volunteer:export']"
        >导出</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="volunteerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="密码" align="center" prop="id" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="电话" align="center" prop="tel" />
      <el-table-column label="身份证" align="center" prop="idCard" />
      <el-table-column label="志愿者类型" align="center" prop="type" />
      <el-table-column label="志愿者编号" align="center" prop="no" />
      <el-table-column label="志愿者头像" align="center" prop="headPic" />
      <el-table-column label="登录凭证" align="center" prop="token" />
      <el-table-column label="更新时间" align="center" prop="refreshTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.refreshTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="密码" align="center" prop="password" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['module:volunteer:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['module:volunteer:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改志愿者信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="电话" prop="tel">
          <el-input v-model="form.tel" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="身份证" prop="idCard">
          <el-input v-model="form.idCard" placeholder="请输入身份证" />
        </el-form-item>
        <el-form-item label="志愿者类型">
          <el-select v-model="form.type" placeholder="请选择志愿者类型">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="志愿者编号" prop="no">
          <el-input v-model="form.no" placeholder="请输入志愿者编号" />
        </el-form-item>
        <el-form-item label="志愿者头像" prop="headPic">
          <el-input v-model="form.headPic" placeholder="请输入志愿者头像" />
        </el-form-item>
        <el-form-item label="登录凭证" prop="token">
          <el-input v-model="form.token" placeholder="请输入登录凭证" />
        </el-form-item>
        <el-form-item label="更新时间" prop="refreshTime">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.refreshTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择更新时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="form.password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="密码" prop="delFlag">
          <el-input v-model="form.delFlag" placeholder="请输入密码" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listVolunteer, getVolunteer, delVolunteer, addVolunteer, updateVolunteer, exportVolunteer } from "@/api/module/volunteer";

export default {
  name: "Volunteer",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 总条数
      total: 0,
      // 志愿者信息表格数据
      volunteerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: undefined,
        tel: undefined,
        idCard: undefined,
        type: undefined,
        no: undefined,
        headPic: undefined,
        token: undefined,
        refreshTime: undefined,
        password: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        createTime: [
          { required: true, message: "密码不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "密码不能为空", trigger: "blur" }
        ],
        createBy: [
          { required: true, message: "密码不能为空", trigger: "blur" }
        ],
        updateBy: [
          { required: true, message: "密码不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "姓名不能为空", trigger: "blur" }
        ],
        tel: [
          { required: true, message: "电话不能为空", trigger: "blur" }
        ],
        idCard: [
          { required: true, message: "身份证不能为空", trigger: "blur" }
        ],
        no: [
          { required: true, message: "志愿者编号不能为空", trigger: "blur" }
        ],
        password: [
          { required: true, message: "密码不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询志愿者信息列表 */
    getList() {
      this.loading = true;
      listVolunteer(this.queryParams).then(response => {
        this.volunteerList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        createTime: undefined,
        updateTime: undefined,
        createBy: undefined,
        updateBy: undefined,
        name: undefined,
        tel: undefined,
        idCard: undefined,
        type: undefined,
        no: undefined,
        headPic: undefined,
        token: undefined,
        refreshTime: undefined,
        remark: undefined,
        password: undefined,
        delFlag: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加志愿者信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getVolunteer(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改志愿者信息";
      });
    },
      /** 提交按钮 */
      submitForm: function() {
          this.$refs["form"].validate(valid => {
              if (valid) {
                  if (this.form.id != undefined) {
                      updateVolunteer(this.form).then(response => {
                          if (response.code === 200) {
                              this.msgSuccess("修改成功");
                              this.open = false;
                              this.getList();
                          }
                      });
                  } else {
                      addVolunteer(this.form).then(response => {
                          if (response.code === 200) {
                              this.msgSuccess("新增成功");
                              this.open = false;
                              this.getList();
                          }
                      });
                  }
              }
          });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除志愿者信息编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delVolunteer(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有志愿者信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportVolunteer(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>