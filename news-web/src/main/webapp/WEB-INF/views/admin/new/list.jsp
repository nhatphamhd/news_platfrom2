<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.example.utils.SecurityUtils" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/admin/new/list"/>
<
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách tất cả bai viet</title>
</head>
<body>
<div class="main-content">
    <form:form commandName="model" action="${formUrl}" id="listForm" method="GET">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">danh sach bai viet</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${messageResponse!=null}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>

                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                           requestURI="${formUrl}" uid="row"
                                           partialList="true" size="${model.totalItems}" id="tableList"
                                           pagesize="${model.maxPageItems}" export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
<%--                                <display:column title="<fieldset class='form-group'>--%>
<%--												        <input type='checkbox' id='checkAll' class='check-box-element'>--%>
<%--												        </fieldset>" class="center select-cell"--%>
<%--                                                headerClass="center select-cell">--%>
<%--                                    <fieldset>--%>
<%--                                        <input type="checkbox" name="checkList" value="${tableList.id}"--%>
<%--                                               id="checkbox_${tableList.id}" class="check-box-element"/>--%>
<%--                                    </fieldset>--%>
<%--                                </display:column>--%>
                                <display:column headerClass="text-left" property="code" title="Mã bai viet"/>
                                <display:column headerClass="text-left" property="title" title="tieu de"/>
                                <display:column headerClass="text-left" property="content" title="noi dung"/>

                            </display:table>
<%--                                <table class="table table-bordered">--%>
<%--                                    <thead>--%>
<%--                                    <tr>--%>
<%--                                        <th>code0</th>--%>
<%--                                        <th>title</th>--%>
<%--                                        <th>content</th>--%>
<%--                                        <th></th>--%>
<%--                                    </tr>--%>
<%--                                    </thead>--%>

<%--                                    <tbody>--%>
<%--                                    <c:forEach var="user" items="${model.listResult}">--%>
<%--                                        <tr>--%>
<%--                                            <td>${user.code}</td>--%>
<%--                                            <td>${user.title}</td>--%>
<%--                                            <td>${user.content}</td>--%>
<%--                                            <td>--%>
<%--                                                    &lt;%&ndash;                                    <button>Edit</button>&ndash;%&gt;--%>
<%--                                                    &lt;%&ndash;                                    <button>Delete</button>&ndash;%&gt;--%>
<%--                                            </td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</form:form>
<%--<input type="hidden" value="<%=SecurityUtils.getPrincipal().getId()%>" id="userId">--%>
<script type="text/javascript">

    var arrayUsers = [];
    var buildingIdGlobal = "";
    $(document).ready(function () {
        $('#tableList #btnAssignBuilding').click(function (e) {
            e.preventDefault();
            openModelAssignBuilding();
            loadUserAssignBuilding($(this).attr('buildingId'), '');
        });
    });
    $('#btnSearchUserPopup').keyup(function (e) {
        console.log(arrayUsers);
        var username = $('#btnSearchUserPopup').val();
        var buildingIdHidden = '<input type="hidden" name="buildingId" value=' + buildingIdGlobal + ' id="buildingId"></input>';
        $('#fieldHidden').html(buildingIdHidden);
        var row = '';
        for (var i = 0; i < arrayUsers.length; i++) {
            if (arrayUsers[i].username.indexOf(username) > -1) {
                row += '<tr>';
                // chú ý checked
                row += '<td class="text-center"><input type="checkbox" name="checkList" onchange = "changeRadio(' + arrayUsers[i].userId + ')" value="' + arrayUsers[i].userId + '"  id="checkbox_' + arrayUsers[i].userId + '" class="check-box-element" ' + arrayUsers[i].checked + '/></td>';
                row += '<td class="text-center">' + arrayUsers[i].username + '</td>';
                row += '</tr>';

            }
        }
        $('#userAssignTable tbody').html(row);
    });

    $(".btnCreateContract").click(function (event) {
        event.preventDefault();
        var idBuilding = $(this).attr("data-attr");
        var urlUnitPrice = $(this).attr("create-unit-price");
        var urlContract = $(this).attr("create-contract");
        var data = {}
        data["id"] = idBuilding;
        $.ajax({
            url: '${existsBuildingInUnitprice}',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                if (res) {
                    window.location.href = urlContract;
                } else {
                    var r = confirm("Phòng Này Chưa Có Hóa Đơn . Bạn Phải Tạo Mới !");
                    if (r == true) {
                        window.location.href = urlUnitPrice;
                    }
                }
            },
            error: function (res) {
            }
        });

    });

    $('#btnAssignBuildingForUser').click(function (e) {
        console.log(arrayUsers);
        var users = [];
        for (var i = 0; i < arrayUsers.length; i++) {
            if (arrayUsers[i].checked == "checked") {
                users.push(arrayUsers[i].userId);
            }
        }
        console.log(users);
        console.log(buildingIdGlobal);
//         e.preventDefault();
//         var buildingId = $('#fieldHidden').find('#buildingId').val();
//         var users = $('#userAssignTable').find('tbody input[type=checkbox]:checked').map(function () {
//             return $(this).val();
//         }).get();

        updateBuilding(users, buildingIdGlobal);
    });


    $('#btnSearch').click(function () {
        $('#listForm').submit();
    });


    $('.btnPriority').click(function (event) {
        event.preventDefault();
        buildingId = $(this).attr("buildingId");
        action = $(this).attr("action");
        updatePrioritize(action, buildingId);
    });


    function updateBuilding(data, id) {
        $.ajax({
            url: '${API}/' + id + '/users',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value='/admin/new/list?message=update_success'/>";
            },
            error: function (res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/new/list?message=error_system'/>";
            }
        });
    }

    function updatePrioritize(action, id) {
        $.ajax({
            url: '${API}/' + id + '/priority?action=' + action,
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(),
            success: function (res) {
                window.location.href = "<c:url value='/admin/new/list?message=update_success'/>";
            },
            error: function (res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/new/list?message=error_system'/>";
            }
        });
    }

    function deleteBuilding(data) {
        $.ajax({
            url: '${API}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                window.location.href = "<c:url value='/admin/new/list?message=delete_success'/>";
            },
            error: function (res) {
                console.log(res);
                window.location.href = "<c:url value='/admin/new/list?message=error_system'/>";
            }
        });
    }

    function warningBeforeDelete() {
        showAlertBeforeDelete(function () {
            event.preventDefault();
            var dataArray = $(' tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
            deleteBuilding(dataArray);
        });
    }

    function openModelAssignBuilding() {
        $('#assignBuildingModal').modal();
    }

    function User(userId, username, checked) {
        this.userId = userId;
        this.username = username;
        this.checked = checked;
    }


    function changeRadio(id) {
        for (var i = 0; i < arrayUsers.length; i++) {
            if (arrayUsers[i].userId == id) {
                if (arrayUsers[i].checked == "") {
                    arrayUsers[i].checked = "checked";
                } else {
                    arrayUsers[i].checked = "";
                }
                break;
            }
        }
    }

    //function User()
    function loadUserAssignBuilding(buildingId, username) {
        buildingIdGlobal = buildingId;
        $('#btnSearchUserPopup').val("");
        var buildingIdHidden = '<input type="hidden" name="buildingId" value=' + buildingId + ' id="buildingId"></input>';
        $('#fieldHidden').html(buildingIdHidden);
        $.ajax({
            url: '${loadUser}?role=USER&buildingid=' + buildingId,
            type: 'GET',
            success: function (res) {
                var row = '';
                arrayUsers = [];
                $.each(res, function (index, user) {
                    var users = new User(user.id, user.fullName, user.checked);
                    arrayUsers.push(users);

                    row += '<tr>';
                    // chú ý checked
                    row += '<td class="text-center"><input type="checkbox" name="checkList" onchange = "changeRadio(' + user.id + ')"  value="' + user.id + '" id="checkbox_' + user.id + '"   class="check-box-element" ' + user.checked + '/></td>';
                    row += '<td class="text-center">' + user.fullName + '</td>';
                    row += '</tr>';
                });
                $('#userAssignTable tbody').html(row);
                console.log(arrayUsers)

            },
            error: function (res) {
                console.log(res);
            }
        });
    }
</script>
</body>
</html>
