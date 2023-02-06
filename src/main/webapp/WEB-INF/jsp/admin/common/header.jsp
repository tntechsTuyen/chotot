<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="header" class="app-header">
  <div class="navbar-header">
    <a href="${_ctx}/admin" class="navbar-brand"><span class="navbar-logo"></span> <b class="me-1">CMS</b></a>
    <button type="button" class="navbar-mobile-toggler" data-toggle="app-sidebar-mobile">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
  </div>

  <div class="navbar-nav">
    <div class="navbar-item navbar-user dropdown">
      <a href="#" class="navbar-link dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
        <!-- <img src="" alt="" /> -->
        <span>
          <span class="d-none d-md-inline">Administrator</span>
          <b class="caret"></b>
        </span>
      </a>
      <div class="dropdown-menu dropdown-menu-end me-1">
        <a href="#" class="dropdown-item">Edit Profile</a>
        <a href="#" class="dropdown-item d-flex align-items-center">
          Inbox
          <span class="badge bg-danger rounded-pill ms-auto pb-4px">2</span>
        </a>
        <a href="#" class="dropdown-item">Calendar</a>
        <a href="#" class="dropdown-item">Settings</a>
        <div class="dropdown-divider"></div>
        <a href="${_ctx}/logout" class="dropdown-item">Log Out</a>
      </div>
    </div>
  </div>
</div>