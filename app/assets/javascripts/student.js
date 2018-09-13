// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('#dept_select').select2({
    tags: true,
    allowClear: true,
    placeholder: 'department'
  });

  $('#course_select').select2({
    tags: true,
    allowClear: true,
    placeholder: 'course'
  });

  $('#section_select').select2({
    tags: true,
    allowClear: true,
    placeholder: 'section'
  });

  $('#dept_select').on('change', function(e) {
    $.get('/courses_for_dept.json', {dept: this.value}, function(data){
      var courses = data.courses;
      for (var i = 0; i < courses.length; i++) {
        var name = courses[i].name;
        var id = courses[i].id;
        var newOption = new Option(name, id, true, true);
        $('#course_select').val(null).trigger('change');
        $('#course_select').append(newOption).trigger('change');
      }
    })
  });

  $('#course_select').on('change', function(e) {
    $.get('/sections_for_course.json', {course: this.value}, function(data){
      var sections = data.sections;
      for (var i = 0; i < sections.length; i++) {
        var name = sections[i].name;
        var id = sections[i].id;
        var newOption = new Option(name, id, true, true);
        $('#section_select').val(null).trigger('change');
        $('#section_select').append(newOption).trigger('change');
      }
    })
  });

  $('#section_select').on('change', function(e) {
    $.get('/times_for_section.json', {section: this.value}, function(data){
      var times = data.times;
      $("#times").val(times);
    })
  });
});
