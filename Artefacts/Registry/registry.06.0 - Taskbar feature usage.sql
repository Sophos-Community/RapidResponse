/*************************** Sophos.com/RapidResponse ***************************\
| DESCRIPTION                                                                    |
| The FeatureUsage artifact can be used as evidence of software execution        |
| interactivaly by an account. It also record user interaction with an app.      |
|                                                                                |
| Gets data from subkey:                                                         |
| - AppLaunch: tracks the number of times an application pinned to taskbar was   |
| executed.                                                                      |
| - AppSwitched: tracks the number of times an application switched focus        |
| (minimized/maximazed)                                                          |
| - ShowJumpView: track application that was right clicked only                  |    
| - TrayButtonClicked: track user clicking on built-in task bar                  |
|                                                                                |
| VARIABLE                                                                       |
| - username        (type: STRING)                                               |
| - user_sid    (type: STRING)                                                   |
| To get everything the analyst can use wildcard (%) in both variables           |
|                                                                                |
| Timestamps are not reliable.                                                   |
|                                                                                |
| Version: 1.0                                                                   |
| Author: The rapid Response Team                                                |
| github.com/SophosRapidResponse                                                 |
\********************************************************************************/


WITH path_map (code, paths) AS ( VALUES
   ('{6D809377-6AF0-444B-8957-A3773F02200E}', 'C:\Program Files'),
   ('{008CA0B1-55B4-4C56-B8A8-4DE4B299D3BE}', 'C:\Users\[user-name]\AccountPictures'),
   ('{DE61D971-5EBC-4F02-A3A9-6C82895E5C04}', 'Control Panel\All Control Panel Items\Get Programs'),
   ('{724EF170-A42D-4FEF-9F26-B60E846FBA4F}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools'),
   ('{3EB685DB-65F9-4CF6-A03A-E3EF65729F3D}', 'C:\Users\[user-name]\AppData\Roaming'),
   ('{1E87508D-89C2-42F0-8A7E-645A0F50CA58}', 'Applications'),
   ('{A3918781-E5F2-4890-B3D9-A7E54332328C}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows\Application Shortcuts'),
   ('{A305CE99-F527-492B-8B1A-7E76FA98D6E4}', 'Installed Updates'),
   ('{352481E8-33BE-4251-BA85-6007CAEDCF9D}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows\Temporary Internet Files'),
   ('{9E52AB10-F80D-49DF-ACB8-4330F5687855}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows\Burn\Burn'),
   ('{DF7266AC-9274-4867-8D55-3BD661DE872D}', 'Control Panel\All Control Panel Items\Programs and Features'),
   ('{D0384E7D-BAC3-4797-8F14-CBA229B392B5}', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools'),
   ('{62AB5D82-FDC1-4DC3-A9DD-070D1D495D97}', 'C:\ProgramData'),
   ('{C4AA340D-F20F-4863-AFEF-F87EF2E6BA25}', 'C:\Users\Public\Desktop'),
   ('{ED4824AF-DCE4-45A8-81E2-FC7965083634}', 'C:\Users\Public\Documents'),
   ('{3D644C9B-1FB8-4F30-9B45-F670235F79C0}', 'C:\Users\Public\Downloads'),
   ('{3214FAB5-9757-4298-BB61-92A9DEAA44FF}', 'C:\Users\Public\Music'),
   ('{B6EBFB86-6907-413C-9AF7-4FC2ABF07CC5}', 'C:\Users\Public\Pictures'),
   ('{0139D44E-6AFE-49F2-8690-3DAFCAE6FFB8}', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'),
   ('{E555AB60-153B-4D17-9F04-A5FE99FC15EC}', 'C:\ProgramData\Microsoft\Windows\Ringtones'),
   ('{A4115719-D62E-491D-AA7C-E74B8BE3B067}', 'C:\ProgramData\Microsoft\Windows\Start Menu'),
   ('{82A5EA35-D9CD-47C5-9629-E15D2F714E6E}', 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup'),
   ('{B94237E7-57AC-4347-9151-B08C6C32D1F7}', 'C:\ProgramData\Microsoft\Windows\Templates'),
   ('{2400183A-6185-49FB-A2D8-4A392A602BA3}', 'C:\Users\Public\Videos'),
   ('{4BFEFB45-347D-4006-A5BE-AC0CB0567192}', 'Control Panel\All Control Panel Items\Sync Center\Conflicts'),
   ('{6F0CD92B-2E97-45D1-88FF-B0D186B8DEDD}', 'Control Panel\All Control Panel Items\Network Connections'),
   ('{56784854-C6CB-462B-8169-88E350ACB882}', 'C:\Users\[user-name]\Contacts'),
   ('{82A74AEB-AEB4-465C-A014-D097EE346D63}', 'Control Panel\All Control Panel Items'),
   ('{2B0F765D-C0E9-4171-908E-08A611B84FF6}', 'C:\Users\{user-name]\AppData\Roaming\Microsoft\Windows\Cookies'),
   ('{915221FB-9EFE-4BDA-8FD7-F78DCA774F87}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Credentials'),
   ('{B88F4DAA-E7BD-49A9-B74D-02885A5DC765}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Crypto'),
   ('{7B396E54-9EC5-4300-BE0A-2482EBAE1A26}', 'C:\Program Files\Windows Sidebar\Gadgets'),
   ('{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}', 'C:\Users\[user-name]\Desktop'),
   ('{5CE4A5E9-E4EB-479D-B89F-130C02886155}', 'C:\ProgramData\Microsoft\Windows\DeviceMetadataStore'),
   ('{7B0DB17D-9CD2-4A93-9733-46CC89022E7C}', 'Libraries\Documents'),
   ('{374DE290-123F-4565-9164-39C4925E467B}', 'C:\Users\[user-name]\Downloads'),
   ('{10C07CD0-EF91-4567-B850-448B77CB37F9}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Protect'),
   ('{1777F761-68AD-4D8A-87BD-30B759FA33DD}', 'C:\Users\[user-name]\Favorites'),
   ('{FD228CB7-AE11-4AE3-864C-16F3910AB8FE}', 'C:\Windows\Fonts'),
   ('{A75D362E-50FC-4FB7-AC2C-A8BEAA314493}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows Sidebar\Gadgets'),
   ('{CAC52C1A-B53D-4EDC-92D7-6B2E8AC19434}', 'Games'),
   ('{054FAE61-4DD8-4787-80B6-090220C4B700}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows\GameExplorer'),
   ('{D9DC8A3B-B784-432E-A781-5A1130A75963}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows\History'),
   ('{52528A6B-B9E3-4ADD-B60D-588C2DBA842D}', 'Homegroup'),
   ('{BCB5256F-79F6-4CEE-B725-DC34E402FD46}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\ImplicitAppShortcuts'),
   ('{4D9F7874-4E0C-4904-967B-40B0D20C3E4B}', 'Internet Explorer'),
   ('{1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}', 'Libraries'),
   ('{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}', 'C:\Users\[user-name]\Links'),
   ('{F1B32785-6FBA-4FCF-9D55-7B8E7F157091}', 'C:\Users\[user-name]\AppData\Local'),
   ('{A520A1A4-1780-4FF6-BD18-167343C5AF16}', 'C:\Users\[user-name]\AppData\LocalLow'),
   ('{2112AB0A-C86A-4FFE-A368-0DE96E47012E}', 'Libraries\Music'),
   ('{0AC0837C-BBF8-452A-850D-79D08E667CA7}', 'Computer'),
   ('{4BD8D571-6D19-48D3-BE97-422220080E43}', 'C:\Users\[user-name]\Music'),
   ('{33E28130-4E1E-4676-835A-98395C3BC3BB}', 'C:\Users\[user-name]\Pictures'),
   ('{18989B1D-99B5-455B-841C-AB7C74E4DDFC}', 'C:\Users\[user-name]\Videos'),
   ('{C5ABBF53-E17F-4121-8900-86626FC2C973}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Network Shortcuts'),
   ('{D20BEEC4-5CA8-4905-AE3B-BF251EA09B53}', 'Network'),
   ('{FDD39AD0-238F-46AF-ADB4-6C85480369C7}', 'C:\Users\[user-name]\Documents'),
   ('{A990AE9F-A03B-4E80-94BC-9912D7504104}', 'Libraries\Pictures'),
   ('{9274BD8D-CFD1-41C3-B35E-B13F55A758F4}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Printer Shortcuts'),
   ('{76FC4E2D-D6AD-4519-A663-37BD56068185}', 'All Control Panel Items\Printers'),
   ('{5E6C858F-0E22-4760-9AFE-EA3317B67173}', 'C:\Users\[user-name]'),
   ('{905E63B6-C1BF-494E-B29C-65B732D3D21A}', 'C:\Program Files'),
   ('{F7F1ED05-9F6D-47A2-AAAE-29D317C6F066}', 'C:\Program Files\Common Files'),
   ('{6365D5A7-0F0D-45E5-87F6-0DA56B6A4F7D}', 'C:\Program Files\Common Files'),
   ('{DE974D24-D9C6-4D3E-BF91-F4455120B917}', 'C:\Program Files [x86]\Common Files'),
   ('{7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E}', 'C:\Program Files [x86]'),
   ('{6D809377-6AF0-444B-8957-A3773F02200E}', 'C:\Program Files'),
   ('{A77F5D77-2E2B-44C3-A6A2-ABA601054A51}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs'),
   ('{DFDF76A2-C82A-4D63-906A-5644AC457385}', 'C:\Public'),
   ('{0482AF6C-08F1-4C34-8C90-E17EC98B1E17}', 'C:\Users\Public\AccountPictures'),
   ('{DEBF2536-E1A8-4C59-B6A2-414586476AEA}', 'C:\ProgramData\Microsoft\Windows\GameExplorer'),
   ('{48DAF80B-E6CF-4F4E-B800-0E69D84EE384}', 'C:\Users\Public\Libraries'),
   ('{52A4F021-7B75-48A9-9F6B-4B87A210BC8F}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch'),
   ('{AE50C081-EBD2-438A-8655-8A092E34987A}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Recent'),
   ('{B7534046-3ECB-4C18-BE4E-64CD4CB7D6AC}', 'Recycle Bin'),
   ('{8AD10C31-2ADB-4296-A8F7-E4701232C972}', 'C:\Windows\Resources'),
   ('{C870044B-F49E-4126-A9C3-B52A1FF411E8}', 'C:\ProgramData\Microsoft\Windows\Ringtones'),
   ('{00BCFC5A-ED94-4E48-96A1-3F6217F21990}', 'C:\Users\[user-name]\AppData\Local\Microsoft\Windows\RoamingTiles'),
   ('{B97D20BB-F46A-4C97-BA10-5E3608430854}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'),
   ('{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}', 'C:\Users\[user-name]\Saved Games'),
   ('{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}', 'C:\Users\[user-name]\Searches'),
   ('{190337D1-B8CA-4121-A639-6D472D16972A}', 'search-ms:'),
   ('{8983036C-27C0-404B-8F08-102D10DCFD74}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\SendTo'),
   ('{625B53C3-AB48-4EC1-BA1F-A1EF4146FC19}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Start Menu'),
   ('{43668BF8-C14E-49B2-97C9-747784D784B7}', 'Control Panel\All Control Panel Items\Sync Center'),
   ('{289A9A43-BE44-4057-A41B-587A76D7E7F9}', 'Control Panel\All Control Panel Items\Sync Center\Sync Results'),
   ('{0F214138-B1D3-4A90-BBA9-27CBC0C5389A}', 'Control Panel\All Control Panel Items\Sync Center\Sync Setup'),
   ('{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}', 'C:\Windows\System32'),
   ('{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}', 'C:\Windows\SysWOW64'),
   ('{54EED2E0-E7CA-4FDB-9148-0F4247291CFA}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\SystemCertificates'),
   ('{A63293E8-664E-48DB-A079-DF759E0509F7}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Windows\Templates'),
   ('{9E3995AB-1F9C-4F13-B827-48B24B6C7174}', 'C:\Users\[user-name]\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned'),
   ('{0762D272-C50A-4BB0-A382-697DCD729B80}', 'C:\Users'),
   ('{F3CE0F7C-4901-4ACC-8648-D5D44B04EF8F}', 'C:\Users\[user-name]'),
   ('{A302545D-DEFF-464B-ABE8-61C8648D939B}', 'Libraries'),
   ('{491E922F-5643-4AF4-A7EB-4E7A138D8174}', 'Libraries\Videos'),
   ('{F38BF404-1D43-42F2-9305-67DE0B28FC23}', 'C:\Windows')
   )
   

SELECT 
    datetime(mtime,'unixepoch') AS modified_time,
    CASE 
    WHEN path LIKE '%\AppLaunch\%' THEN 'Pinned app from taskbar executed'
    WHEN path LIKE '%\AppSwitched\%' THEN 'App switched focus' 
    WHEN path LIKE '%\ShowJumpView\%' THEN 'App right clicked' 
    WHEN path LIKE '%\TrayButtonClicked\%' THEN 'built-in taskbar buttons clicked'
    END AS data_from,
    key, 
    name, 
    REPLACE(name, path_map.code, path_map.paths) path_on_disk,
    CASE WHEN path LIKE '%\AppLaunch\%' THEN data END AS run_count,
    CASE WHEN path LIKE '%\AppSwitched\%' THEN data END AS focus_count,
    CASE WHEN path LIKE '%\ShowJumpView\%' THEN data END AS righclick_count,
    CASE WHEN path LIKE '%\TrayButtonClicked\%' THEN data END AS Builtin_count,
    u.username,
    regex_match(path,'(S-[0-9]+(-[0-9]+)+)', '') AS sid,
    'registry' AS source,
    'Taskbar feature usage' AS query
FROM registry 
LEFT JOIN  users u ON sid = u.uuid
LEFT JOIN path_map on name LIKE path_map.code||'%'
WHERE (path LIKE 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppLaunch\%' 
   OR path LIKE 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched\%' 
   OR path LIKE 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView\%'
   OR path LIKE 'HKEY_USERS\%\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked\%')
   AND u.username LIKE '$$username$$' 
   AND sid LIKE '$$user_sid$$'