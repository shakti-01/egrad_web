function registerValidation() {
    var name = document.getElementById("cname").value.trim();
    var id = document.getElementById("cemail").value.trim();
    var password = document.getElementById("cpass").value;
    var age = document.getElementById("cage").value.trim();
    var gender = "";
    if (document.getElementById("genradio1").checked) {
      gender = "male";
    } else if (document.getElementById("genradio2").checked) {
      gender = "female";
    } else if (document.getElementById("genradio3").checked) {
      gender = "others";
    }
    var address = document.getElementById("caddr").value.trim();
    var branch = document.getElementById("cbranch").value;
    var skills = [], minSkill=2;
    var checkboxes = document.getElementsByName("cskills");
    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        skills.push(checkboxes[i].value);
      }
    }
   
    if (name == "" || name.length>25 ) {
        alert("Please enter your name");
        document.getElementById("cname").focus();
        return false;
    }
    if (id == "") {
      alert("Please enter your ID");
      document.getElementById("cemail").focus();
      return false;
    }
    if (password == "" || !/\d/.test(password) || !/\W/.test(password)) {
      alert("Please enter a valid password with a symbol and a number");
      document.getElementById("cpass").focus();
      return false;
    }
    if (age == "" || isNaN(age) || age<18 || age>23) {
      alert("Please enter your age and make sure the age is betweeen 18-23");
      document.getElementById("cage").focus();
      return false;
    }
    if (gender == "") {
      alert("Please select your gender");
      document.getElementsByClassName("form-check")[0].focus();
      return false;
    }
    if (address == "") {
      alert("Please enter your college address");
      document.getElementById("caddr").focus();
      return false;
    }
    if (branch == "-") {
      alert("Please select your branch");
      document.getElementById("cbranch").focus();
      return false;
    }
    if (skills.length < minSkill) {
      alert("Please select at least " + minSkill +" skill");
      document.getElementsByName("cskills")[0].focus();
      return false;
    }
    if(document.getElementById("cfile").files.length == 0){
        alert("Please upload your resume!");
        document.getElementById("cfile").focus();
        return false;
    }
    return true;
  }