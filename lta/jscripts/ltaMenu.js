function expand(s)
{
  var td = s;
  var d = td.getElementsByTagName("div").item(0);

  td.className = "menuHover";
  d.className = "menuHover";
}

function expand1(s)
{
  var td = s;
  var d = td.getElementsByTagName("div").item(0);

  td.className = "menuHover";
  d.className = "menuH";
}

function collapse(s)
{
  var td = s;
  var d = td.getElementsByTagName("div").item(0);

  td.className = "menuNormal";
  d.className = "menuNormal";
}

function collapse1(s)
{
  var td = s;
  var d = td.getElementsByTagName("div").item(0);

  td.className = "menuNorm";
  d.className = "menuNorm";
}