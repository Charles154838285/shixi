//以下为修改jQuery Validation插件兼容Bootstrap的方法，没有直接写在插件中是为了便于插件升级
$.validator.setDefaults({
    highlight: function (element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function (element) {
        element.closest('.form-group').removeClass('has-error').addClass('has-success');
    },
    errorElement: "span",
    errorPlacement: function (error, element) {
        if (element.is(":radio") || element.is(":checkbox")) {
            error.appendTo(element.parent().parent().parent());
        } else {
            error.appendTo(element.parent());
        }
    },
    errorClass: "help-block m-b-none",
    validClass: "help-block m-b-none"
});
$(function () {
    var icon = "<i class='fa fa-times-circle'></i> ";

    //设置登录界面的规则
    $("#loginForm").validate({
        rules:{
            account:{
                required: true,
                minlength: 3
            },
            password: {
                required: true,
                minlength: 5,
                maxlength: 16
            }
        },
        messages:{
            account: {
                required: icon + "请输入您的用户名",
                minlength: icon + "用户名必须3个字符以上"
            },
            password: {
                required: icon + "请输入您的密码",
                minlength: icon + "密码必须5位以上",
                maxlength: icon + "密码最大长度为16位"
            }
        },
        submitHandler:function(form){

            form.submit();
        }
    });

});