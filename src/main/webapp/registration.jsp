<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./static_files/cstyles.css">
    <script src="./static_files/clientscript.js" defer></script>
    <title>e-EXAM portal</title>
</head>

<body>
    <div class="register-container">
    <form class="register-form rounded" action="register_servlet" method="post" onsubmit="return registerValidation()">
        <h2><b>Fill the registration form</b></h2>
        <div class="input-group">
            <label class="input-group-text" for="cname">Name</label>
            <input type="text" class="form-control" id="cname" name="cname">
        </div>
        <small class="form-text text-muted">Enter full name</small>
        <div class="mt-3 mb-3 input-group">
            <label for="cemail" class="input-group-text">Email ID:</label>
            <input type="email" class="form-control" id="cemail" name="cemail">
        </div>
        <div class="mb-3">
          <label for="cpass">Password:</label>
          <input type="password" class="form-control" id="cpass" name="cpass" autocomplete="new-password">
          <small class="form-text text-muted">Enter a string password by including a symbol and a number</small>
        </div>
        <div class="row g-1">
        <div class="col-md-6 mr-5 mb-3">
            <label for="cage">Age:</label>
            <input type="text" class="form-control" id="cage" name="cage">
        </div>
        <fieldset class="col-md-6 row mb-3">
            <legend class="col-form-label col-sm-4 pt-0">Gender</legend>
            <div class="col-sm-6">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="genradio" id="genradio1" value="male">
                <label class="form-check-label" for="genradio1">male</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="genradio" id="genradio2" value="female">
                <label class="form-check-label" for="genradio2">female</label>
              </div>
              <div class="form-check disabled">
                <input class="form-check-input" type="radio" name="genradio" id="genradio3" value="others">
                <label class="form-check-label" for="genradio3">others</label>
              </div>
            </div>
          </fieldset>
          </div>
          <div class="mb-3">
            <label for="caddr">College address:</label>
            <textarea class="form-control" id="caddr" name="caddr" rows="2"></textarea>
          </div>
          <div class="input-group mb-3">
            <label class="input-group-text" for="cbranch">Branch:</label>
            <select class="form-select" id="cbranch" name="cbranch" style="color:gray;">
              <option value="-" selected>---select one---</option>
              <option value="cse">CSE</option>
              <option value="cst">CST</option>
              <option value="cen">CEN</option>
              <option value="ece">ECE</option>
              <option value="eie">EIE</option>
            </select>
          </div>
          <p class="mb-1">Select your skills:</p>
          <div class="input-group mb-3">
            <label class="me-2 skill-label"> C</label>
            <div class="input-group-text">
              <input class="form-check-input mt-0" type="checkbox" name="cskills" value="C">
            </div>
            <label class="me-2 ms-3 skill-label"> Java</label>
            <div class="input-group-text">
              <input class="form-check-input mt-0" type="checkbox" name="cskills" value="Java">
            </div>
            <label class="me-2 ms-3 skill-label"> Python</label>
            <div class="input-group-text">
              <input class="form-check-input mt-0" type="checkbox" name="cskills" value="Python">
            </div>
            <label class="me-2 ms-3 skill-label"> JSP</label>
            <div class="input-group-text">
              <input class="form-check-input mt-0" type="checkbox" name="cskills" value="JSP">
            </div>
          </div>
          <div class="input-group mb-5">
            <input type="file" class="form-control" name="cfile" id="cfile">
            <label class="input-group-text" for="cfile">Upload resume</label>
          </div>
          <button type="submit" class="btn btn-success me-3">Submit</button>
          <button type="reset" class="btn btn-danger">Reset</button>
      </form>
      </div>
    <!------------------------------------------->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>