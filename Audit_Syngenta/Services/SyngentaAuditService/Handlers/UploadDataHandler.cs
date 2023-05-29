﻿using System;
using System.Collections.Generic;
using System.IO;
using SyngentaAuditService.BLL;
using SyngentaAuditService.Core;
using SyngentaAuditService.Entities;
using System.Drawing;
using System.Data;
using System.ComponentModel;
using System.Linq;
using SyngentaAuditService.Models;

namespace SyngentaAuditService.Handlers
{
    public class UploadDataHandler : AuthorizationHandler
    {

        public override HttpResponseMessage AuthorizationRequest()
        {
            int EmployeeId = Employee.EmployeeId;
            String FUNCTION = new FieldRequest("FUNCTION");
            if ("WORK_DATA".Equals(FUNCTION, StringComparison.InvariantCultureIgnoreCase))
            {
                try
                {
                    int? ShopId = new FieldRequest("ShopId");
                    string WorkTime = new FieldRequest("WorkTime");
                    string Comment = new FieldRequest("Comment");
                    int? WorkDate = new FieldRequest("WorkDate");
                    int? ShopFormatId = new FieldRequest("ShopFormatId");
                    int? AuditResult = new FieldRequest("AuditResult");
                    int? ShopType = new FieldRequest("ShopType");

                    string strDataDetail = null;
                    DataTable _tbAttendant = null, _tbPhoto = null, _tbAudio = null, _tbOSA = null, _tbPosm = null, _tbSurveyResult = null, _tbSurveyDetailResult = null;
                    var attendant = Context.Request.Files["Attendant"];
                    strDataDetail = null;
                    if (attendant != null)
                    {
                        using (StreamReader stream = new StreamReader(attendant.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }

                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonAttendant> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonAttendant>>(strDataDetail);
                            _tbAttendant = Utility.ConvertToTable<AuditUploadInfo.jsonAttendant>(json, "TableAttendant");
                        }
                        else
                        {
                            _tbAttendant = Utility.CreateDataTalbe<AuditUploadInfo.jsonAttendant>();
                        }
                        Logs.d(EmployeeId.ToString(), "Attendant", strDataDetail);

                    }


                    strDataDetail = null;
                    var photo = Context.Request.Files["Photo"];
                    if (photo != null)
                    {
                        using (StreamReader stream = new StreamReader(photo.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }
                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonPhoto> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonPhoto>>(strDataDetail);
                            _tbPhoto = Utility.ConvertToTable<AuditUploadInfo.jsonPhoto>(json, "TablePhoto");
                        }
                        else
                        {
                            _tbPhoto = Utility.CreateDataTalbe<AuditUploadInfo.jsonPhoto>();
                        }

                    }


                    strDataDetail = null;
                    var audio = Context.Request.Files["Audio"];
                    if (audio != null)
                    {

                        using (StreamReader stream = new StreamReader(audio.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }
                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonAudio> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonAudio>>(strDataDetail);
                            _tbAudio = Utility.ConvertToTable<AuditUploadInfo.jsonAudio>(json, "TableAudio");
                        }
                        else
                        {
                            _tbAudio = Utility.CreateDataTalbe<AuditUploadInfo.jsonAudio>();
                        }

                    }

                    strDataDetail = null;
                    var osa = Context.Request.Files["Osa"];
                    if (osa != null)
                    {

                        using (StreamReader stream = new StreamReader(osa.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }
                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonOsa> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonOsa>>(strDataDetail);
                            _tbOSA = Utility.ConvertToTable<AuditUploadInfo.jsonOsa>(json, "TableOsa");
                        }
                        else
                        {
                            _tbOSA = Utility.CreateDataTalbe<AuditUploadInfo.jsonOsa>();
                        }
                        Logs.d(EmployeeId.ToString(), "Osa", strDataDetail);


                    }

                    strDataDetail = null;
                    var posm = Context.Request.Files["Posm"];
                    if (posm != null)
                    {

                        using (StreamReader stream = new StreamReader(posm.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }
                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonPosm> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonPosm>>(strDataDetail);
                            _tbPosm = Utility.ConvertToTable<AuditUploadInfo.jsonPosm>(json, "TablePosm");
                        }
                        else
                        {
                            _tbPosm = Utility.CreateDataTalbe<AuditUploadInfo.jsonPosm>();
                        }
                        Logs.d(EmployeeId.ToString(), "Posm", strDataDetail);


                    }
                    strDataDetail = null;
                    var surveyResult = Context.Request.Files["SurveyResult"];
                    if (surveyResult != null)
                    {

                        using (StreamReader stream = new StreamReader(surveyResult.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }
                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonSurveyResult> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonSurveyResult>>(strDataDetail);
                            _tbSurveyResult = Utility.ConvertToTable<AuditUploadInfo.jsonSurveyResult>(json, "TableSurveyResult");
                        }
                        else
                        {
                            _tbSurveyResult = Utility.CreateDataTalbe<AuditUploadInfo.jsonSurveyResult>();
                        }
                        Logs.d(EmployeeId.ToString(), "SurveyResult", strDataDetail);


                    }
                    strDataDetail = null;
                    var surveyDetailResult = Context.Request.Files["SurveyDetailResult"];
                    if (surveyDetailResult != null)
                    {

                        using (StreamReader stream = new StreamReader(surveyDetailResult.InputStream))
                        {
                            strDataDetail = stream.ReadToEnd();
                        }
                        if (strDataDetail != null && strDataDetail.Length > 0)
                        {
                            List<AuditUploadInfo.jsonSurveyDetailResult> json = this.GetObjectFromJSON<List<AuditUploadInfo.jsonSurveyDetailResult>>(strDataDetail);
                            _tbSurveyDetailResult = Utility.ConvertToTable<AuditUploadInfo.jsonSurveyDetailResult>(json, "TableSurveyDetailResult");
                        }
                        else
                        {
                            _tbSurveyDetailResult = Utility.CreateDataTalbe<AuditUploadInfo.jsonSurveyDetailResult>();
                        }
                        Logs.d(EmployeeId.ToString(), "SurveyDetailResult", strDataDetail);


                    }

                    int result = AuditController.InsertData(ShopId, WorkDate, WorkTime, EmployeeId, ShopFormatId, AuditResult, ShopType, Comment, _tbAttendant, _tbPhoto, _tbAudio, _tbOSA, _tbPosm, _tbSurveyResult, _tbSurveyDetailResult);
                    if (result == 1)
                    {
                        return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.OK, "Tải dữ liệu thành công !");
                    }
                    else
                    {
                        return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.InternalServerError, "Tải dữ liệu không thành công !");
                    }
                }
                catch (Exception ex)
                {
                    Logs.w(EmployeeId.ToString(), ex.Message, "WR", 590);
                    return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.InternalServerError, ex.Message);
                }

            }
            if ("CREATE_SHOP".Equals(FUNCTION, StringComparison.InvariantCultureIgnoreCase))
            {

                try
                {
                    string merchantName = new FieldRequest("merchantName");
                    string phoneNumber = new FieldRequest("phoneNumber");
                    int? provinceId = new FieldRequest("provinceId");
                    int? districtId = new FieldRequest("districtId");
                    int? townId = new FieldRequest("townId");
                    string addressline = new FieldRequest("addressline");
                    int? areaDisplay = new FieldRequest("areaDisplay");

                    string itemDisplay = new FieldRequest("itemDisplay");
                    string typeDisplay = new FieldRequest("typeDisplay");
                    string revenue = new FieldRequest("revenue");
                    string photo = new FieldRequest("photo");

                    double? latitude = new FieldRequest("latitude");
                    double? longitude = new FieldRequest("longitude");

                    if(isValidVietNamPhoneNumberV2(phoneNumber) == false)
                    {
                        return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.InternalServerError, "Số điện thoại không đúng");
                    }

                    int result = AuditController.InsertData_CreateShop(merchantName, phoneNumber, provinceId, districtId, townId, addressline,
             areaDisplay, itemDisplay, typeDisplay, revenue, photo, latitude, longitude, EmployeeId);
                    if (result == 1)
                    {
                        return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.OK, "Tải dữ liệu thành công !");
                    }
                    else
                    {
                        return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.InternalServerError, "Tải dữ liệu không thành công !");
                    }
                }
                catch (Exception ex)
                {
                    Logs.w(EmployeeId.ToString(), ex.Message, "CREATESHOP", 590);
                    return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.InternalServerError, ex.Message);
                }

            }

            return HttpResponseMessage.CreateResponse(System.Net.HttpStatusCode.InternalServerError, "FUNCTION NOT FOUND !");
        }
    }
}