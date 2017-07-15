object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Multiplos Details'
  ClientHeight = 549
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnExport: TButton
    Left = 32
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Exportador'
    TabOrder = 0
    OnClick = btnExportClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 235
    Width = 267
    Height = 142
    Color = clScrollBar
    Lines.Strings = (
      'Possibilidade  de converter relat'#243'rios do Rave e do '
      'Report Builder.'
      'Por meio dos uses:'
      'ConverterRR2FR - converte de Rave para Fast'
      'ConverterRB2FR - converte de ReportBuilder para '
      'Fast'
      ''
      'lReport := TfrxReport.Create(Self);'
      'lReport.LoadFromFile(Arquivo Rave ou RB);'
      'lReport.SaveToFile(Rel em FR);'
      '')
    TabOrder = 1
  end
  object DBImage1: TDBImage
    Left = 192
    Top = 96
    Width = 105
    Height = 105
    DataField = 'Graphic'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 112
    Top = 204
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 3
  end
  object frxReportMasterDetail: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.OutlineVisible = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42931.453593692100000000
    ReportOptions.LastChange = 42931.453593692100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      ' lValorTotal: string;'
      '   '
      ''
      
        'procedure GroupFooterCustomerOnBeforePrint(Sender: TfrxComponent' +
        ');'
      'begin'
      '//  lValorTotal := FloatToStr(<SUM(<Order."ItemsTotal">)>);    '
      'end;'
      ''
      'procedure memTotalPaisOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '//  if Engine.FinalPass then'
      '//  begin'
      '//    memTotalPais.Text := lValorTotal;'
      '//    lValorTotal := '#39#39';                        '
      '//  end;            '
      'end;'
      ''
      'procedure Memo3OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '//  lValorTotal := Memo3.Text;                                  ' +
        '              '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 416
    Top = 32
    Datasets = <
      item
        DataSet = frxDBCustomer
        DataSetName = 'Customer'
      end
      item
        DataSet = frxDBItems
        DataSetName = 'Items'
      end
      item
        DataSet = frxDBOrders
        DataSetName = 'Order'
      end
      item
        DataSet = frxDBParts
        DataSetName = 'Parts'
      end
      item
        DataSet = frxDBVendors
        DataSetName = 'Vendors'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 154.960730000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 306.141930000000000000
          Top = 49.133889999999990000
          Width = 211.653680000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -33
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Master Detail')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 15.118120000000000000
          Top = 7.559059999999999000
          Width = 230.551330000000000000
          Height = 139.842610000000000000
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000007300
            00004508060000007960D956000000017352474200AECE1CE90000000467414D
            410000B18F0BFC61050000000970485973000017110000171101CA26F33F0000
            001F74455874536F667477617265004D6163726F6D656469612046697265776F
            726B732038B568D2780000145B4944415478DAED5D099855C5953EEFF5BEB3EF
            348B048CA841C40583A889A268D0000A5156050770144D30A8A3E3129C314840
            1008E0C222A2321924239BE84411CD28A208B2B4610011688466699ADEB7F7F2
            FFB7CEEDBE3CDEEB6E7A79B7E1E37C5F75F5BDB7EADEAAFAAB4E9D73EA543D8F
            DFEF97B3853AB5EF108DA83DC25508BD112ED1EB86087C56809085B00B612BC2
            A7081B11F6ECDAFB7DA9DBE5AF6BF29C0D6002C40B10DD8AD007E15A849433C8
            9E89F009C25A843500F507B7EB535754AFC104885D103D8AD00FA1792DBCF220
            C25F11A602D43D6ED7AFB6A95E8209101B219AA021E6B40428B3C7EF13292D11
            8F0FDC93FFB31E1E0F8257FC1191E2F74658FF5BF74EA71C842908D3006A8EDB
            F5AD2DAA776002C85F209A897091A39800AB54BC85F9D6952F3A4E7CF14952DC
            ACBD14376923BEB864F145C688B7B840BC79D912756C9F4465EC136FFE49F116
            E55BF97D31F1C180DD84F01000FD3FB7EB5D1B54AFC00490E3C58C9868E77D6F
            611EFEFAA5A06D57C9BFF01AC9EB7AAD14A45E0C801244300AC5EB35A39023D4
            C7115B2CDE825C89DDFBADC4EF582FF1699F4B4CFA0EA48B444788B7DEE520BE
            FC4100BAC0EDFAD794EA0D9800F239444F9F52B89222F114174A7EA72B24EBFA
            A1927BE92FC4D7A8A5481184D69262C35A2D72D641471F476124FA44748C441C
            4B97F8CD1F48834F9648EC9ECDE28F8A117F647460111E03A02FBADD0E35A17A
            01E6694002086FDE49294D692AC7FB3E2059BDEF167F7213281E184400F88C09
            E00958B327EB8834FC789134583B4F22724F882F36490246E944003AC5EDF6A8
            2EB90E26801C83686EF91DBF35EFE577EA2147863E2F851895529063093B35A6
            882891D804894DFBBB345DF294C5867DF1C9CE146C8C2100F46D571BA59AE42A
            9800F21A447F4388B5EF71C46477EF2B87474E014B6D85192DABF63F9CD04022
            0E7F2F2D164C9084AD1F49694243E7D36C845E00F45BD71AA69AE41A980012D2
            8B7C2EC68A635104586B76B73E7278CC2CB0C044CC8DF975570048B7DEECE3D2
            72DE3849D8BE5E4AE3531C73B0FC1DE126005A8705A87D7213CCA7104DB2AFBD
            F9D952D0B19BA48F5F24BEE4A60032AF8E4B807AC7244AE4D17DD26AFA088939
            B8131D28C199603CC09CE94AE354935C011340A622DA8E9068DD802AE1879A91
            3E7EA11476BE4A04FA61D828B181C47EFBB1B49E791FA467942332CA7E7204A1
            2B003D12F606AA26B905E63444BFB5AF29B91EBDF309C9BC6302E6C81352A65E
            848550FFF806D278E973D268E52C1588CADAE45980F95CD81BA89A1476300164
            5B441B105AF2DA0B49B5A0FDA592FEDB25E24BC0BC05BD32EC44EB51F61169FB
            E220893ABADFA9837E8F701900AD0329ACF6C90D3047205A683EEE134F61BE64
            0C992459B74043C939E1522B801360443658F1B2345BFA070843D43F2DEEC0C6
            B91B602E75A76067580D17C0E4AAC51DD6C78B0BA4B849AAEC7F7C99F8121B1A
            AB8E5B04E936F2D01E69336D88441E4F177F749CFDE40D841100D4BDB25591C2
            0A2680E43A24D713ADF548DA5CB37A0D968CD1D3559F0CE75C19D8120871C9D2
            62F61849DAB05C7C7149F693B386D5861BCC1B107D54F671A81F3F8E9D2BB997
            DF5AB73A655509BA6DF2C78BA4D95BCF58CB688E5596EE00F31BB78B5719851B
            CC4710BD645D708523224A7E786AA594346F6F8CE76E13049F28E89BA92FF42F
            5F1F35340C60BEE976F12AA37083F96744E3AC0F436A2D6C73A1A43FF286FBF3
            A54DDE084BBA4E9D749B44661D31A3D3D0F300F3DFDD2E5E65146E309723FA35
            FFF716E64ACECF6E9243F7BF6C2D49D58A21BDA604303D2585D26AC64889DBBD
            C994CBD00280799FDBC5AB8CC20DE687886EE4FF34DF9DEC39500E8F7CD12C2C
            FBEA81F31C17B94B4BA5D5DC7112BF6D9D53A2FD0BC01CE476F12AA37083B95E
            8C779D01B3D720393C7CB279581FC064A7826AD9F2D5F192B8E97DE36A626825
            C0ECE776F12A2D7E98C17C1FD1CDFCDF02F3EAFE72F8DE3FA1141100B37EB059
            CEDDADE68C91F8B44FC166CB46E6BB0073A0DBC5AB8CC20DE67F21BA8BFF53C7
            CCBDF83AF971CC6CC3CEEACB9C595C20ADA70D93D87D5B9D66BD5701E6BFB85D
            BCCA28DC609619D8E9DF53DCAC9DEC7FF41DF1D125A4B81AEE20B54DDE48708C
            2C69F74C1F8900E7B0DC350D9D1506F770833916D11C73E5178FCF27FB9E5A21
            45ADBBD40F3D13D26BCC9E4DD266EA106D9D323D7310C0FC8BDBC5AB8CC20DE6
            E588BE2AFB38586DC688C972B2F73D228575BD185D05A2B17DE50C69F2EE14C3
            620D98EC65ED01E661943F1E713D2868700A37989428B8A9A715AF396F6677BF
            450E3D345F243FDBE59680241B152B2D670C97C42DFFEBB4CDE68A716FE1423A
            CB9FAD75E04ACA5A80EBBE7BA35D0517564D5E476429E054D04B131BCB81096F
            4971ABCEEEDA67E393247AE746693363A4780B4E6264C65425D73A8409007493
            7B052F2737C0A4BEF69EB9F25B4E5C47EF9820C7EF7AD2AC9CB8E193C451191B
            2F4DDE7A561AAD992DA5090DCA1F41FFF5703EB738AEC7B229FB23A29CD621FA
            B80C07A0FF13FE820754C30530D952DCDBF153AB0050054A529ACB81DFBF2325
            CD3AB8333AA11A45A57F276DA70CB658BFD974E45110BD52D8EE62296CF353F1
            C520DDD10312BB778B441E4B77B2628AE2D701D02FC25FF87272CB0788BBBBFE
            644AE0116F6E96B5FD20E3BE69C6E1399C65A2092F2A4E5ACC192B491BDF332E
            9E1881DEA23C296ED8528E0E982839578099C4259A7D2C781675204D1ABF375D
            92BEFCABD9BB6204A5AF11AE01A0AEE9586E81C916A3775EAA7503ACCC5B5A22
            3F8E7A49727A0D86C8C175E030948B2024A648F2070BA4F9E2C7C40701C8B202
            A13C96B7E003F3A4F0D2DE284F8EE54158B678CE1189F2B678ED6149FAFCBF75
            9B8345F4867F2BEC0D6A57C745BFD9BB1195559C6A4A694A33491F3F5F8A2EE8
            51379EEC81949022B1DBD65BE63B7A08DAF3A017DF3E7AE79392D97F82E958C1
            DA08AC39E2F841693B79A0449EC8B05D349702CCDFB8D2A0E22E98ECE6F407BA
            DD94C4636DC32B6AD1510E3EF89A14638E923C6A0175503E8EC8B86489DEFD35
            801C6B79E4590ED0DCC45B5284B930450E3CB2089DAA7B689589C58A4B9066F3
            2748CA674B6DA3FC66317367181D7F1DD57279AF09D92C0F9148D5E258A3A208
            6ACAA151D3A4B04B4F007AD27825D45A8D3D66447EFBB1B458F8A84465FCE014
            642C01A8B0ED45920EDDB7B4618B8A5D3F313A1B7CF08A345DFA079D6B65BF98
            7D2AFBDC68CFFAB00BEC3A446BC428E46523B424A9B11C1DF8B8645FFB1BA33A
            14E6D64C30B2D40F8C3EE8B6C9EBDE9426CBA7422DCA0208F1A7BCD702B37517
            B0FB0552DAB875C5664648B70D57CF9626CB5EC0C8B4C0DC2B06CC7437DAD275
            3049007400A22562EF06A35A6099F73C927D653FC9ECFB801475F89931C65747
            75E10E6B48ADD1BB3749A3D5B32469D3FBE2E7D907D6E2F3A9F5F7F84AF02CC2
            02B3E092EB55180B4190645BCC1E2D499B3F84546B159D96A21BDD32F9D50B30
            490094EE248B10CA374CA26CDE826CE8A1CD24A7473FC9EED95F0ADA7733EA84
            D7B1EDDDAA0383C7B051D513AD67002776F737903A9749D257AB2422E7B86189
            A79E6FF023C27F8AD9821F4B6128EBFA6192C1B556E8C1A748B236C5A748CCCE
            2FA4F5F4E1461F35FE427301E438B7DAB0DE804902A03CA889E6BE4E8E225A86
            053A80F9121B4941EA4592D7F53A29E87819406E6A01E38F8AB6469365AD011B
            259B8ECC3C24717BBE91F8ED9F48CCFE34E8B299D6483466BA53EABC0D612840
            D882EFD332D5CF12844A8B2463F0D372F2E631962B49199BE786DD8404894CDF
            2D2DE78E93587C43E74B526FBCE753B7DAAF5E81494283D2084F83C2DDA73E61
            03975A23CDA323A524B9A9944048F113508C0CEEE2F214E448D48943129175C4
            1A7D96879D75944C64B0CFB1E33C0E008EEAB72171597EBDB17C17F36761CE3E
            F9F3419650C425326FE6416B3F67C3B5AF48CC8134E7567A57D51252BD03D326
            65BB5C10BE3464E14B1558CB32A36CD6EB35B6D388C88A5ECF23D89E41E3AF09
            F2DDDF237AD1E208EC3814C61A34975204BE93EE2E5147F6595CC05667C41840
            7EC9653237DBACDE824942C3D2C36A14C2503167E5D594B8E59E7B471657B474
            85EF3E86E88FE6CA6F46BCBAB5F8B5B348B91702CD78F7E07D3BDD6EAF7A0DA6
            4D685C4E743D106ED3D051EC8DBAA18915E3E95BBBC5ACD2AC42F8BAAA0722E2
            9BBF147302CAD512702E911237E1D2A97B9A5B4682403A2BC00C2434743B44D0
            55E42708D0EC2D606982A1DE4293CD01310BC85BD0D0076AF8AD2B11DD24E6F4
            4CDAEC8E8B198DABF1EE4CB7DBC249672598E729389D07F31CA2F3609E43741E
            CC7388CE83790ED17930CF01A20B2B4F130B092612B441D41A81E6954D67A09F
            5D81E86284A608D4AC29CAF308ED7578477190F45C6EB844BFC3E73B91AE2020
            0DF5BCAE083422946A9ABC20EFA2B3D8856274CC1D4853A9332EF2F0DBDC99D6
            588C8F6C1AC2FB9518156ED0F23441E08227D59FCF90E7FB10E999F6B4836E95
            58A75CE4DDAE47D075D176739EBFEAD3741E471EFA1AFD43D3D3A0B22B2898F4
            DC46B442CCAF14F045FF8A8F2DAEA451A8643F8140BD2C29E0313FB205611EDE
            3337201FBDF436681AEA6DB720CD7701695235BF5D89BE48F3559032F0DD43F5
            7226D23C5149995F40C4ADF9EC50A5DA88247AD9F140E1AF03D2D360F1470592
            0DCBCE671FE945C301B730F0DCDA638E3C8C78A8627BFD46E0291CFCE636E4E9
            A91EFF6BB43C0E1BE56931DB81E7ECF495F25F91C80F05267FA96095E3160F67
            E8810F065DF247FADF89593EF24AE5C4E33F47D9870CEAC8B04F90E4BD2BF16C
            5BC0FBD910CE5E4F2FB8CF03D2D02AF49DA371B910D919E9324294596DB0C2B3
            0A9E44E082323B31EB32518C017EA6233DD33CAFE5784181B3473E8F201FA781
            A3E576DBBCA7EE3179DA8693B57CCE76E2FF9948BF56CFA6E7A88F54E08AF49A
            27644F15E39511A38092237CA4DFA601E5582830CD52503911C45F85304CDFA9
            1573D26708EBF5833494DFEE6864D2CB78D7C39A9F2C79ABDE676FE34AFDF60A
            C0A491F4DA401F551D658F079423E861C0CAB609721A474490E79D9DB6565C0F
            1363D3E536FE11A1D8B79E2FBF4A3B464F9EBBA72393D3C61BD5D91688FC6CBB
            77116E45FE0F42A449C0B3DCD3C0D4C6652F0A5C76E00BEF74CE25CA8E398A3A
            E82DDA4259606E1B2F71A4A35D956CFA42C7FBAE429A2F6B034C3D5F88EF681B
            50668ED46E485B18F03E1EF5C69FC5988C67811D20B03D78182DEDBB649D9757
            6687457A6E21E3689F84B44F2B98E438EFE0FADE6A80C9EDF7E466032AF39A0F
            0666D9892062E6B2CBC4189A291CB0B76D75A41D2EC63BC0A63178FE4A884271
            9EE18FC534D65BD6A10FB504263BD03CBD64474CD5EF043D2E0DE9E9CD40C1EC
            0B7D5745C28E7DDC4DC8BA05C9C3BD272C731B0A6AB826984BF0FFE8B081A912
            2C01E40231276B0A4074A7E8A3495EC20B7FE748CFBD9663F5722F42878A8E25
            437AF658DDFC680934DDC44863B6C073C660E219D93759FAD5FA7C80FE3F51AF
            3F44DA3E41CA424E416189BBB99F469A7F842833592BA79C54A4395845006C8F
            FD9FF3673670CD39739998E53CA7542A7A5D104A5BA809989C6867E8E5DF90F9
            C65337C85AACE627F66A019E91F5F6D767959EC881F40F8AF9CD125170382AC9
            F276D5004CE7A95F3CCA8D9D83421505247BAAA050B531E09DFC0523FEFC455F
            BDC5B96E351BDD5E64461AE6E7A9D0ED70AF455580D47C3C1B903EC1F722DF42
            5CD3059312FEFFCBA9B2836819B950BEACD6C054A180ECA1AB361833AFC07D8A
            CE14063A6A9E47717FAAE6E1CB6FD7FB6FE2FEB04A2AE96487F42DA5704476B8
            5BEF652A983B02F271C96B6F0830D90803F4D973B8FFACDEA7B0768BDE5F84FB
            23839487A3822A15B7180ED4866687E5214ED375D4935335C3759B3300932ACC
            4A84FB91EF355C1F1223F9AED56F384726C15C10CA77A8BA60DABD89C4499E47
            6ED36B8DC39F2BEFDDF419D923E7CE7CE4E17C395CEF6FC4BD2B431468A0568E
            8BBDFFA6B7A99C7364D279CB66711C99543BD202F2B755F049C50AE606D551A9
            0BDA3E933C33817326A5EFC1A2A7676A435E52D18FBAE15D1C39F720F0242E1A
            4BC622FD3CDCA704C91F06684E89B18A60929DBE26460358A573263BFBFD55EC
            0F3506B3ECC0A54AC867BFD8A1ABD98DCC51F5A5A3208C38C77224F3D818DEE8
            A28FF98B79B7EA8FB7D9732647DD55819B5791A6BB82466247E35CB40DF7A7EA
            FB45CA15EA5054366A2B693C72208EFA1CA4EF88EBFF10D3016F0EA51A047907
            5535AA6C2D91E79082F976754EF93A6330D504474933AE2A1F1063EEEAAB15E7
            48B55D3808C21DCED57DA4A1C5840241A0AA43BF99B775EEE2686AA9F7E7E0FE
            0301155A8868845E721453D521FB0FA68E8422B2F22BAAE21D80EF51A7E49441
            4B0C3B2039053D0B6EAB425E2AF19CF39723FD00BD173ED524E0CC740A23B474
            048AEB643563F47F3EA3CEF50DF2D2AA31D1918E76D8F96236D452BF237BE6E8
            75FE3401EDB4376861399A1638C022BDCACA8B1969647DCE1EFD3A457CE41BAD
            E9481CAD648F814749534599E4B8B64EA7548E41893D0FD7A71D3F8DE7EBC4E8
            C41D55B5B0D535FE08DCAC0A1A9EB661E625FBE754B429AC7AE605EDDA53B8A0
            E4678F8C5056139A9AB66A2390E623DD2875B662C3FF3A200B59265972306728
            F6F4A1363BC53BA8CB52BD480CC84F728E68363CD50E8E4E7204DB0D932CEC9E
            108DC14E655B793620DDD5B8D749F3537A7DD8563954E07948CCB440756592DE
            A77184F2047D81D831673B3707693E966B969669349EBFAECF6C735E58C0A4AA
            F0A05ED319B857053A9753AFA4D24D917FB7AE7CF0774AC81E1B86F81647E9A7
            DAB00498E700BCE37837A5CAD9523EA7061259D7384A7DEA53BB5CEFD37E49CB
            D48A1065E688FAB35E92A350C2A5B9718A96974211A7184B481263B85EACDFCA
            75BC871D8DF327D5B7435A177AE811C8CE08DC00C54E4A697FB5235F58C19CA4
            8DCB9056919543AD38363BE4FCBA3840E061AFA422FE2B31730D47D541ADF842
            31AC97927174B0150DE4B7A44831C2836EF3B354120A14731CFA1F8F6CEB2566
            F4B2534D0BF5EB4048DB540188D33A92C5BFABCFD82928C45DA3C93945D0F1FA
            8D50C60FF5D6E3FBEE9272AEB34B3BCC62DB3BDE915EB4136CAECEC150BA1031
            44CBB4A3A2B4FF04AB072658FA4D7E260000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          Left = 487.559370000000000000
          Top = 132.283550000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Impresso em [<Date>] [<Time>]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 151.181200000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object GroupHeaderCustomer: TfrxGroupHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Child = frxReportMasterDetail.ChildGroupHeaderCustomer
        Condition = 'Customer."Country"'
        DrillDown = True
        ExpandDrillDown = True
        KeepTogether = True
        OutlineText = 'Customer."Country"'
        object CountryCOUNTRY: TfrxMemoView
          Left = 4.779530000000000000
          Top = 8.559059999999988000
          Width = 400.630180000000000000
          Height = 26.456710000000000000
          DataSet = frxDBCountry2
          DataSetName = 'Country2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            'Pa'#237's: [Customer."Country"]')
          ParentFont = False
        end
        object memTotalPais: TfrxMemoView
          Left = 423.307360000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'memTotalPaisOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object MasterDataCustomer: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        DataSet = frxDBCustomer
        DataSetName = 'Customer'
        OutlineText = 'Customer."Company"'
        RowCount = 0
        object CustomerCUST_NO: TfrxMemoView
          Left = 3.779530000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'CustNo'
          DataSet = frxDBCustomer
          DataSetName = 'Customer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Customer."CustNo"]')
          ParentFont = False
        end
        object CustomerCUSTOMER: TfrxMemoView
          Left = 170.078850000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DataSet = frxDBCustomer
          DataSetName = 'Customer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Customer."Company"]')
          ParentFont = False
        end
        object CustomerCITY: TfrxMemoView
          Left = 514.016080000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'City'
          DataSet = frxDBCustomer
          DataSetName = 'Customer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Customer."City"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 20.677180000000020000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object HeaderGeral: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 18.897650000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Pedidos por Pa'#237's/Cliente/Ordem Compra/Itens')
        end
      end
      object HeaderOrders: TfrxHeader
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 15.559060000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#250'mero Pedido')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 177.637910000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Data de Compra')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 396.850650000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Data de Entrega')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 581.488560000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Pedido')
          ParentFont = False
        end
      end
      object DetailDataOrders: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 457.323130000000000000
        Width = 718.110700000000000000
        Child = frxReportMasterDetail.ChildDetailOrders
        DataSet = frxDBOrders
        DataSetName = 'Order'
        RowCount = 0
        object OrderOrderNo: TfrxMemoView
          Left = 15.118120000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'OrderNo'
          DataSet = frxDBOrders
          DataSetName = 'Order'
          Memo.UTF8W = (
            '[Order."OrderNo"]')
        end
        object OrderShipDate: TfrxMemoView
          Left = 396.850650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDBOrders
          DataSetName = 'Order'
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Order."ShipDate"]')
        end
        object OrderSaleDate: TfrxMemoView
          Left = 177.637910000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDBOrders
          DataSetName = 'Order'
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Order."SaleDate"]')
        end
        object OrderItemsTotal: TfrxMemoView
          Left = 582.047620000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataSet = frxDBOrders
          DataSetName = 'Order'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[Order."ItemsTotal"]')
        end
      end
      object GroupFooterCustomer: TfrxGroupFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 548.031849999999900000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupFooterCustomerOnBeforePrint'
        object Memo3: TfrxMemoView
          Top = 9.779530000000023000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo3OnAfterPrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total Geral: [SUM(<Order."ItemsTotal">)]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          Top = 7.559060000000159000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 3.779530000000022000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object SubdetailDataItems: TfrxSubdetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 600.945270000000000000
        Width = 718.110700000000000000
        DataSet = frxDBItems
        DataSetName = 'Items'
        RowCount = 0
        object ItemsItemNo: TfrxMemoView
          Left = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ItemNo'
          DataSet = frxDBItems
          DataSetName = 'Items'
          Memo.UTF8W = (
            '[Items."ItemNo"]')
        end
        object ItemsQty: TfrxMemoView
          Left = 396.850650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Qty'
          DataSet = frxDBItems
          DataSetName = 'Items'
          Memo.UTF8W = (
            '[Items."Qty"]')
        end
        object ItemsDiscount: TfrxMemoView
          Left = 185.196970000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Discount'
          DataSet = frxDBItems
          DataSetName = 'Items'
          Memo.UTF8W = (
            '[Items."Discount"]')
        end
      end
      object ChildDetailOrders: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          Left = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'digo do Item')
        end
        object Memo13: TfrxMemoView
          Left = 185.196970000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Desconto fornecido')
        end
        object Memo14: TfrxMemoView
          Left = 396.850650000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Quantidade de itens')
        end
      end
      object DataBand4Parts: TfrxDataBand4
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 646.299630000000000000
        Width = 718.110700000000000000
        DataSet = frxDBParts
        DataSetName = 'Parts'
        RowCount = 0
        object PartsPartNo: TfrxMemoView
          Left = 60.472480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PartNo'
          DataSet = frxDBParts
          DataSetName = 'Parts'
          Memo.UTF8W = (
            '[Parts."PartNo"]')
        end
        object PartsDescription: TfrxMemoView
          Left = 185.196970000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'Description'
          DataSet = frxDBParts
          DataSetName = 'Parts'
          Memo.UTF8W = (
            '[Parts."Description"]')
        end
        object PartsCost: TfrxMemoView
          Left = 491.338900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Cost'
          DataSet = frxDBParts
          DataSetName = 'Parts'
          Memo.UTF8W = (
            '[Parts."Cost"]')
        end
        object PartsListPrice: TfrxMemoView
          Left = 627.401980000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ListPrice'
          DataSet = frxDBParts
          DataSetName = 'Parts'
          Memo.UTF8W = (
            '[Parts."ListPrice"]')
        end
      end
      object DataBand5Vendors: TfrxDataBand5
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 691.653990000000000000
        Width = 718.110700000000000000
        DataSet = frxDBVendors
        DataSetName = 'Vendors'
        RowCount = 0
        object VendorsVendorNo: TfrxMemoView
          Left = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'VendorNo'
          DataSet = frxDBVendors
          DataSetName = 'Vendors'
          Memo.UTF8W = (
            '[Vendors."VendorNo"]')
        end
        object VendorsVendorName: TfrxMemoView
          Left = 196.535560000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'VendorName'
          DataSet = frxDBVendors
          DataSetName = 'Vendors'
          Memo.UTF8W = (
            '[Vendors."VendorName"]')
        end
        object VendorsCountry: TfrxMemoView
          Left = 468.661720000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'Country'
          DataSet = frxDBVendors
          DataSetName = 'Vendors'
          Memo.UTF8W = (
            '[Vendors."Country"]')
        end
        object VendorsCity: TfrxMemoView
          Left = 604.724800000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'City'
          DataSet = frxDBVendors
          DataSetName = 'Vendors'
          Memo.UTF8W = (
            '[Vendors."City"]')
        end
      end
      object ChildGroupHeaderCustomer: TfrxChild
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 170.078850000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 514.016080000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
      end
    end
  end
  object frxDBCountry2: TfrxDBDataset
    UserName = 'Country2'
    CloseDataSource = False
    DataSet = qryCountry2
    BCDToCurrency = False
    Left = 608
    Top = 136
  end
  object frxDBCustomer: TfrxDBDataset
    UserName = 'Customer'
    CloseDataSource = False
    DataSet = memCustomer
    BCDToCurrency = False
    Left = 336
    Top = 336
  end
  object frxDBOrders: TfrxDBDataset
    UserName = 'Order'
    CloseDataSource = False
    DataSet = memOrders
    BCDToCurrency = False
    Left = 408
    Top = 336
  end
  object dtsCountry2: TDataSource
    DataSet = qryCountry2
    Left = 608
    Top = 40
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Aluno\Desk' +
      'top\exemplos-delphi\SQLite\demo.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 536
    Top = 16
  end
  object qryCountry2: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from country')
    Left = 608
    Top = 88
  end
  object dtsOrders: TDataSource
    DataSet = memOrders
    Left = 408
    Top = 240
  end
  object qrySelect: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from')
    Left = 32
    Top = 24
  end
  object memExportador: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 112
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 24
    Top = 168
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 32
    Top = 120
  end
  object memCustomer: TFDMemTable
    Active = True
    IndexFieldNames = 'Country'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 336
    Top = 288
    Content = {
      414442530F00313770400000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B04000C0000
      0043007500730074004E006F0005000C00000043007500730074004E006F000C
      00010000000E000D000F000110000111000112000113000114000115000C0000
      0043007500730074004E006F00FEFF0B04000E00000043006F006D0070006100
      6E00790005000E00000043006F006D00700061006E0079000C00020000000E00
      160017001E0000000F000110000111000112000113000114000115000E000000
      43006F006D00700061006E00790018001E000000FEFF0B04000A000000410064
      0064007200310005000A000000410064006400720031000C00030000000E0016
      0017001E0000000F000110000111000112000113000114000115000A00000041
      00640064007200310018001E000000FEFF0B04000A0000004100640064007200
      320005000A000000410064006400720032000C00040000000E00160017001E00
      00000F000110000111000112000113000114000115000A000000410064006400
      7200320018001E000000FEFF0B04000800000043006900740079000500080000
      0043006900740079000C00050000000E00160017000F0000000F000110000111
      0001120001130001140001150008000000430069007400790018000F000000FE
      FF0B04000A0000005300740061007400650005000A0000005300740061007400
      65000C00060000000E0016001700140000000F00011000011100011200011300
      0114000115000A00000053007400610074006500180014000000FEFF0B040006
      0000005A00690070000500060000005A00690070000C00070000000E00160017
      000A0000000F00011000011100011200011300011400011500060000005A0069
      00700018000A000000FEFF0B04000E00000043006F0075006E00740072007900
      05000E00000043006F0075006E007400720079000C00080000000E0016001700
      140000000F000110000111000112000113000114000115000E00000043006F00
      75006E00740072007900180014000000FEFF0B04000A000000500068006F006E
      00650005000A000000500068006F006E0065000C00090000000E00160017000F
      0000000F000110000111000112000113000114000115000A000000500068006F
      006E00650018000F000000FEFF0B040006000000460041005800050006000000
      4600410058000C000A0000000E00160017000F0000000F000110000111000112
      000113000114000115000600000046004100580018000F000000FEFF0B04000E
      000000540061007800520061007400650005000E000000540061007800520061
      00740065000C000B0000000E000D000F00011000011100011200011300011400
      0115000E0000005400610078005200610074006500FEFF0B04000E0000004300
      6F006E00740061006300740005000E00000043006F006E007400610063007400
      0C000C0000000E0016001700140000000F000110000111000112000113000114
      000115000E00000043006F006E007400610063007400180014000000FEFF0B04
      001E0000004C0061007300740049006E0076006F006900630065004400610074
      00650005001E0000004C0061007300740049006E0076006F0069006300650044
      006100740065000C000D0000000E0019000F0001100001110001120001130001
      14000115001E0000004C0061007300740049006E0076006F0069006300650044
      00610074006500FEFEFF1AFEFF1BFEFF1CFF1D1E0000000000FF1F0000000000
      00001493400100220000004B0061007500610069002000440069007600650020
      00530068006F0070007000650002002600000034002D00390037003600200053
      0075006700610072006C006F0061006600200048007700790003001200000053
      00750069007400650020003100300033000400160000004B0061007000610061
      0020004B00610075006100690005000400000048004900060014000000390034
      003700360036002D003100320033003400070004000000550053000800180000
      003800300038002D003500350035002D00300032003600390009001800000038
      00300038002D003500350035002D0030003200370038000A0000000000000021
      400B00180000004500720069006300610020004E006F0072006D0061006E000C
      00000014A9B59DCC42FEFEFF1D1E0001000000FF1F000000000000003C934001
      000C00000055006E006900730063006F0002001800000050004F00200042006F
      00780020005A002D00350034003700040010000000460072006500650070006F
      007200740007000E00000042006100680061006D006100730008001800000038
      00300039002D003500350035002D003300390031003500090018000000380030
      0039002D003500350035002D0034003900350038000A0000000000000000000B
      001E000000470065006F00720067006500200057006500610074006800650072
      0073000C0000003E64EF9CCC42FEFEFF1D1E0002000000FF1F00000000000000
      1C95400100160000005300690067006800740020004400690076006500720002
      001C000000310020004E0065007000740075006E00650020004C0061006E0065
      000400160000004B00610074006F00200050006100700068006F00730007000C
      0000004300790070007200750073000800180000003300350037002D0036002D
      003800370036003700300038000900180000003300350037002D0036002D0038
      00370030003900340033000A0000000000000000000B001E0000005000680079
      006C006C00690073002000530070006F006F006E00650072000C000000DA24A2
      9CCC42FEFEFF1D1E0003000000FF1F0000000000000028954001003A00000043
      00610079006D0061006E002000440069007600650072007300200057006F0072
      006C006400200055006E006C0069006D00690074006500640002001400000050
      004F00200042006F00780020003500340031000400180000004700720061006E
      00640020004300610079006D0061006E00070026000000420072006900740069
      007300680020005700650073007400200049006E006400690065007300080018
      0000003000310031002D0035002D003600390037003000340034000900180000
      003000310031002D0035002D003600390037003000360034000A000000000000
      0000000B00140000004A006F00650020004200610069006C00650079000C0000
      009AD2A792CC42FEFEFF1D1E0004000000FF1F00000000000000309540010030
      00000054006F006D002000530061007700790065007200200044006900760069
      006E0067002000430065006E0074007200650002002A0000003600330032002D
      0031002000540068006900720064002000460072007900640065006E0068006F
      006A0004001A000000430068007200690073007400690061006E007300740065
      006400050012000000530074002E002000430072006F006900780006000A0000
      0030003000380032003000070022000000550053002000560069007200670069
      006E002000490073006C0061006E00640073000800180000003500300034002D
      003700390038002D0033003000320032000900180000003500300034002D0037
      00390038002D0037003700370032000A0000000000000000000B001800000043
      0068007200690073002000540068006F006D00610073000C00000096912893CC
      42FEFEFF1D1E0005000000FF1F0000000000000090954001002A00000042006C
      007500650020004A00610063006B00200041007100750061002000430065006E
      0074006500720002002C000000320033002D0037003300380020005000610064
      00640069006E00670074006F006E0020004C0061006E00650003001200000053
      007500690074006500200033003100300004000E000000570061006900700061
      00680075000500040000004800490006000A0000003900390037003700360007
      0004000000550053000800180000003400300031002D003600300039002D0037
      003600320033000900180000003400300031002D003600300039002D00390034
      00300033000A0000000000000000000B001C000000450072006E006500730074
      00200042006100720072006100740074000C000000A037D89CCC42FEFEFF1D1E
      0006000000FF1F00000000000000A0954001001E000000560049005000200044
      0069007600650072007300200043006C00750062000200160000003300320020
      004D00610069006E002000530074002E0004001A000000430068007200690073
      007400690061006E007300740065006400050012000000530074002E00200043
      0072006F006900780006000A0000003000320038003000300007002200000055
      0053002000560069007200670069006E002000490073006C0061006E00640073
      000800180000003800300039002D003400350033002D00350039003700360009
      00180000003800300039002D003400350033002D0035003900330032000A0000
      000000000000000B0026000000520075007300730065006C006C002000430068
      0072006900730074006F0070006800650072000C000000E615B39DCC42FEFEFF
      1D1E0007000000FF1F0000000000000098974001001C0000004F006300650061
      006E0020005000610072006100640069007300650002001600000050004F0020
      0042006F007800200038003700340035000400160000004B00610069006C0075
      0061002D004B006F006E0061000500040000004800490006000A000000390034
      00370035003600070004000000550053000800180000003800300038002D0035
      00350035002D0038003200330031000900180000003800300038002D00350035
      0035002D0038003400350030000A0000000000000000000B0018000000500061
      0075006C00200047006100720064006E00650072000C000000CECADA9CCC42FE
      FEFF1D1E0008000000FF1F00000000000000A49740010028000000460061006E
      0074006100730074006900710075006500200041007100750061007400690063
      0061000200280000005A00330032002000390039003900200023003100320041
      002D0037003700200041002E0041002E0004000C00000042006F0067006F0074
      00610007001000000043006F006C0075006D0062006900610008001800000030
      00350037002D0031002D00370037003300340033003400090018000000300035
      0037002D0031002D003700370033003400320031000A0000000000000000000B
      001400000053007500730061006E00200057006F006E0067000C0000005240B5
      9BCC42FEFEFF1D1E0009000000FF1F000000000000003C98400100240000004D
      00610072006D006F0074002000440069007600650072007300200043006C0075
      00620002001A000000380037003200200051007500650065006E002000530074
      002E000400120000004B00690074006300680065006E006500720005000E0000
      004F006E0074006100720069006F0006000E000000470033004E002000320045
      00310007000C000000430061006E006100640061000800180000003400310036
      002D003600390038002D0030003300390039000900180000003400320036002D
      003600390038002D0030003300390039000A0000000000000000000B00160000
      004A006F0079006300650020004D0061007200730068000C000000D2F7E68CCC
      42FEFEFF1D1E000A000000FF1F00000000000000609840010020000000540068
      006500200044006500700074006800200043006800610072006700650002002A
      00000031003500320034003300200055006E0064006500720077006100740065
      00720020004600770079002E000400100000004D00610072006100740068006F
      006E0005000400000046004C0006000A00000033003500300030003300070004
      000000550053000800180000003800300030002D003500350035002D00330037
      00390038000900180000003800300030002D003500350035002D003000330035
      0033000A0000000000000000000B001E000000530061006D0020005700690074
      00680065007200730070006F006F006E000C0000005AC2B39ACC42FEFEFF1D1E
      000B000000FF1F000000000000006C984001001600000042006C007500650020
      00530070006F0072007400730002002A00000032003000330020003100320074
      00680020004100760065002E00200042006F0078002000370034003600040012
      0000004700690072006900620061006C00640069000500040000004F00520006
      000A000000390031003100380037000700040000005500530008001800000036
      00310030002D003700370032002D003600370030003400090018000000360031
      0030002D003700370032002D0036003800390038000A0000000000000000000B
      001A000000540068006500720065007300610020004B0075006E00650063000C
      000000CEE4FA8FCC42FEFEFF1D1E000C000000FF1F0000000000000060994001
      00200000004D0061006B0061006900200053004300550042004100200043006C
      007500620002001600000050004F00200042006F007800200038003500330034
      000400160000004B00610069006C00750061002D004B006F006E006100050004
      0000004800490006000A00000039003400370035003600070004000000550053
      000800180000003300310037002D003600340039002D00390030003900380009
      00180000003300310037002D003600340039002D0036003700380037000A0000
      000000000000000B001600000044006F006E006E006100200053006900610075
      0073000C00000068B6729DCC42FEFEFF1D1E000D000000FF1F00000000000000
      B4994001001600000041006300740069006F006E00200043006C007500620002
      001A00000050004F00200042006F007800200035003400350031002D00460004
      0010000000530061007200610073006F007400610005000400000046004C0006
      000A000000330032003200370034000700040000005500530008001800000038
      00310033002D003800370030002D003000320033003900090018000000380031
      0033002D003800370030002D0030003200380032000A0000000000000000000B
      00200000004D00690063006800610065006C00200053007000750072006C0069
      006E0067000C000000444CF698CC42FEFEFF1D1E000E000000FF1F0000000000
      0000CC99400100280000004A0061006D00610069006300610020005300430055
      00420041002000430065006E0074007200650002001200000050004F00200042
      006F00780020003600380004000C0000004E0065006700720069006C0005000E
      0000004A0061006D006100690063006100070016000000570065007300740020
      0049006E0064006900650073000800180000003000310031002D0033002D0036
      00390037003000340033000900180000003000310031002D0033002D00360039
      0037003000340033000A0000000000000000000B001C00000042006100720062
      0061007200610020004800610072007600650079000C000000FA67BF94CC42FE
      FEFF1D1E000F000000FF1F00000000000000409A4001001C000000490073006C
      0061006E0064002000460069006E00640065007200730002002A000000360031
      0033003300200031002F0033002000530074006F006E00650020004100760065
      006E007500650004001C000000530074002000530069006D006F006E00730020
      00490073006C0065000500040000004700410006000A00000033003200350032
      003100070004000000550053000800180000003700310033002D003400320033
      002D0035003600370035000900180000003700310033002D003400320033002D
      0035003600370036000A0000000000000000000B001C0000004400650073006D
      006F006E00640020004F00720074006500670061000C00000082D6659DCC42FE
      FEFF1D1E0010000000FF1F00000000000000009F400100240000004100640076
      0065006E007400750072006500200055006E0064006500720073006500610002
      001400000050004F00200042006F007800200037003400340004001600000042
      0065006C0069007A0065002000430069007400790007000C000000420065006C
      0069007A0065000800180000003000310031002D00330034002D003000390030
      00350034000900180000003000310031002D00330034002D0030003900300036
      0034000A0000000000000000000B001E00000047006C006F0072006900610020
      0047006F006E007A0061006C00650073000C0000004411D39CCC42FEFEFF1D1E
      0011000000FF1F000000000000008CA04001002000000042006C007500650020
      00530070006F00720074007300200043006C007500620002002C000000360033
      0033003600350020004E0065007A002000500065007200630065002000530074
      00720065006500740004000A0000004C006100720067006F0005000400000046
      004C0006000A0000003300340036003800340007000400000055005300080018
      0000003600310032002D003800390037002D0030003300340032000900180000
      003600310032002D003800390037002D0030003300340038000A000000000000
      0000000B001C000000480061007200720079002000420061007400680062006F
      006E0065000C0000009C4B9C8CCC42FEFEFF1D1E0012000000FF1F0000000000
      0000AEA04001002A0000004600720061006E006B002700730020004400690076
      00650072007300200053007500700070006C0079000200260000003100340035
      00350020004E006F00720074006800200034003400740068002000530074002E
      0004000C00000045007500670065006E0065000500040000004F00520006000A
      0000003900300034003200370007000400000055005300080018000000350030
      0033002D003500350035002D0032003700370038000900180000003500300033
      002D003500350035002D0032003700360039000A0000000000000000000B001A
      0000004C006C006F00790064002000460065006C006C006F00770073000C0000
      00E6A51989CC42FEFEFF1D1E0013000000FF1F00000000000000D8A040010024
      000000440061007600790020004A006F006E0065007300270020004C006F0063
      006B0065007200020028000000320034003600200053006F0075007400680020
      003100360074006800200050006C00610063006500040012000000560061006E
      0063006F0075007600650072000500040000004200430006000E0000004B0038
      005600200039005000310007000C000000430061006E00610064006100080018
      0000003800300033002D003500300039002D0030003100310032000900180000
      003800300033002D003500300039002D0030003500350033000A000000000000
      0000000B0018000000540061006E007900610020005700610067006E00650072
      000C0000002661CA91CC42FEFEFF1D1E0014000000FF1F00000000000000E6A0
      40010018000000530043005500420041002000480065006100760065006E0002
      001A00000050004F00200042006F007800200051002D00380038003700340004
      000C0000004E006100730073006100750007000E00000042006100680061006D
      00610073000800180000003000310031002D00330032002D0030003900340038
      0035000900180000003000310031002D00330032002D00300039003400380035
      000A0000000000000000000B002000000052006F00620065007200740020004D
      0069006300680065006C0069006E0064000C0000005EB49C8ECC42FEFEFF1D1E
      0015000000FF1F00000000000000EAA0400100300000005300680061006E0067
      00720069002D004C0061002000530070006F007200740073002000430065006E
      0074006500720002001A00000050004F00200042006F007800200044002D0035
      00340039003500040010000000460072006500650070006F007200740007000E
      00000042006100680061006D00610073000800180000003000310031002D0033
      0032002D00300038003500370034000900180000003000310031002D00330032
      002D00340034003900330038000A0000000000000000000B001C000000460072
      0061006E006B002000500061006E00690061006700750061000C00000084D230
      89CC42FEFEFF1D1E0016000000FF1F0000000000000016A24001002A00000044
      006900760065007200730020006F006600200043006F007200660075002C0020
      0049006E0063002E000200220000004D00610072006D006F0073006500740020
      0050006C0061006300650020003500340004001E0000004100790069006F0073
      0020004D006100740074006800610069006F00730005000A00000043006F0072
      006600750007000C000000470072006500650063006500080018000000330030
      002D003600360031002D0038003800330036003400090018000000330030002D
      003600360031002D00300035003900340033000A0000000000000000000B001A
      00000043006800610072006C006500730020004C006F00700065007A000C0000
      0008215B9BCC42FEFEFF1D1E0017000000FF1F0000000000000064A240010020
      0000004B00690072006B00200045006E00740065007200700072006900730065
      007300020018000000340032002000410071007500610020004C0061006E0065
      0004000E00000048006F007500730074006F006E000500040000005400580006
      000A000000370037003000370039000700040000005500530008001800000037
      00310033002D003500350036002D003600340033003700090018000000370031
      0033002D003500350036002D0031003000370033000A0000000000000000000B
      001A0000005200750064006F006C0070006800200043006C006100750073000C
      0000009243199ACC42FEFEFF1D1E0018000000FF1F000000000000003EA74001
      0022000000470065006F0072006700650020004200650061006E002000260020
      0043006F002E0002002600000023003700330020004B0069006E006700200053
      0061006C006D006F006E00200057006100790004000C0000004C00750067006F
      00660066000500040000004E00430006000A0000003200390030003700380007
      0004000000550053000800180000003800300033002D003400330038002D0032
      003700370031000900180000003800300033002D003400330038002D00330030
      00300033000A0000000000000000000B0014000000420069006C006C00200057
      0079006500720073000C000000D008AC9ACC42FEFEFF1D1E0019000000FF1F00
      00000000000050A740010032000000500072006F00660065007300730069006F
      006E0061006C0020004400690076006500720073002C0020004C00740064002E
      00020020000000340037003300340020004D0065006C0069006E006400610020
      00530074002E0004000C00000048006F006F0076006500720005000400000041
      004C0006000A0000003300320031003400350007000400000055005300080018
      0000003200300035002D003500350035002D0038003300330033000900180000
      003200300035002D003500350035002D0034003000350034000A000000000000
      0000000B001E00000053006800690072006C006500790020004D006100740068
      006500720073000C00000006B5F69ACC42FEFEFF1D1E001A000000FF1F000000
      00000000C2A74001002800000044006900760065007200730020006F00660020
      0042006C00750065002D0067007200650065006E000200200000003600330034
      00200043006F006D0070006C006500780020004100760065002E0004000C0000
      00500065006C00680061006D0005000400000041004C0006000A000000330032
      00310034003500070004000000550053000800180000003200300035002D0035
      00350035002D0037003100380034000900180000003200300035002D00350035
      0035002D0036003000350039000A0000000000000000000B00140000004E0061
      006E006300790020004200650061006E000C0000002AC34C9ACC42FEFEFF1D1E
      001B000000FF1F00000000000000C4A74001002200000047006F006C00640020
      0043006F00610073007400200053007500700070006C00790002002600000032
      00320033002D004200200048006F007500730074006F006E00200050006C0061
      006300650004000C0000004D006F00620069006C00650005000400000041004C
      0006000A00000033003000360039003600070004000000550053000800180000
      003200300035002D003500350035002D00320036003400300009001800000032
      00300035002D003500350035002D0034003000390034000A0000000000000000
      000B001800000045006C00610069006E0065002000460061006C006C0073000C
      0000003ECDA59BCC42FEFEFF1D1E001C000000FF1F00000000000000D6A74001
      002A000000530061006E0020005000610062006C006F00200044006900760065
      002000430065006E0074006500720002002200000031003700300031002D0044
      0020004E002000420072006F0061006400770061007900040016000000530061
      006E007400610020004D0061007200690061000500040000004300410006000A
      0000003900350034003400330007000400000055005300080018000000380032
      0033002D003000340034002D0032003900310030000900180000003800320033
      002D003000340034002D0032003900390030000A0000000000000000000B0020
      0000005000610074007200690063006900610020004F00270042007200690065
      006E000C000000DCF9BC9BCC42FEFEFF1D1E001D000000FF1F00000000000000
      D8A74001002A00000055006E0064006500720077006100740065007200200053
      0070006F00720074007300200043006F002E000200240000003300350031002D
      0041002000530061007200610073006F00740061002000530074002E00040010
      000000530061006E0020004A006F00730065000500040000004300410006000A
      0000003900320031003900350007000400000055005300080018000000340030
      0038002D003800360037002D0030003500390034000900180000003400300038
      002D003800360037002D0030003000390034000A0000000000000000000B0018
      00000044006100760065002000570061006C006C0069006E0067000C0000008A
      58649CCC42FEFEFF1D1E001E000000FF1F00000000000000DAA74001002A0000
      0041006D00650072006900630061006E00200053004300550042004100200053
      007500700070006C00790002002800000031003700330039002000410074006C
      0061006E0074006900630020004100760065006E007500650004000C0000004C
      006F006D006900740061000500040000004300410006000A0000003900310037
      0037003000070004000000550053000800180000003200310033002D00360035
      0034002D0030003000390032000900180000003200310033002D003600350034
      002D0030003000390035000A0000000000000000000B00200000004C0079006E
      006E002000430069006E006300690072006900700069006E0069000C000000DE
      FC6A9DCC42FEFEFF1D1E001F000000FF1F00000000000000DCA7400100260000
      0043006100740061006D006100720061006E0020004400690076006500200043
      006C007500620002002C00000042006F0078002000320036003400200050006C
      00650061007300750072006500200050006F0069006E00740004001E00000043
      006100740061006C0069006E0061002000490073006C0061006E006400050004
      0000004300410006000A00000039003000370034003000070004000000550053
      000800180000003200310033002D003200320033002D00300039003400310009
      00180000003200310033002D003200320033002D0032003300320034000A0000
      000000000000000B001A0000004E00690063006F006C00650020004400750070
      006F006E0074000C000000364BA79CCC42FEFEFF1D1E0020000000FF1F000000
      00000000DEA74001001C00000044006900760065007200270073002000470072
      006F00740074006F0002002800000032003400360030003100200055006E0069
      00760065007200730061006C0020004C0061006E00650004000C00000044006F
      0077006E00650079000500040000004300410006000A00000039003400320032
      003000070004000000550053000800180000003200310033002D003400330032
      002D0030003000390033000900180000003200310033002D003400330032002D
      0034003800320031000A0000000000000000000B001400000050006500740065
      00720020004F00770065006E000C000000DC90069DCC42FEFEFF1D1E00210000
      00FF1F000000000000009EA84001001E0000004600690073006800650072006D
      0061006E0027007300200045007900650002001600000050004F00200042006F
      007800200037003500340032000400180000004700720061006E006400200043
      00610079006D0061006E00070026000000420072006900740069007300680020
      005700650073007400200049006E006400690065007300080018000000380030
      0039002D003500350035002D0034003600380030000900180000003800300039
      002D003500350035002D0034003600380039000A0000000000000000000B0018
      000000420065007400680061006E0020004C0065007700690073000C000000D6
      4CD99BCC42FEFEFF1D1E0022000000FF1F00000000000000ACA8400100260000
      0041006300740069006F006E0020004400690076006500720020005300750070
      0070006C00790002002000000042006C00750065002000530070006100720020
      0042006F007800200023003300040014000000530074002E002000540068006F
      006D006100730006000A00000030003000380032003000070022000000550053
      002000560069007200670069006E002000490073006C0061006E006400730008
      0018000000320032002D00340034002D00350030003000320031003100090018
      000000320032002D00340034002D003500300030003500390036000A00000000
      00000000000B001C0000004D0061007200690061006E006E00650020004D0069
      006C00650073000C000000488D7598CC42FEFEFF1D1E0023000000FF1F000000
      000000003EAC400100260000004D006100720069006E00610020005300430055
      00420041002000430065006E0074006500720002002C00000050004F00200042
      006F00780020003800320034003300380020005A0075006C0075002000370038
      003300310004000E000000430061007200610063006100730007001200000056
      0065006E0065007A00750065006C006100080016000000350038002D00330033
      002D0036003600320032003200090016000000350038002D00330033002D0036
      0036003000340039000A0000000000000000000B001C00000053007400650070
      00680065006E00200042007200790061006E0074000C000000844F5A97CC42FE
      FEFF1D1E0024000000FF1F0000000000000020AF4001002800000042006C0075
      006500200047006C006100730073002000480061007000700069006E00650073
      0073000200240000003600330034003500200057002E002000530068006F0072
      00650020004C0061006E006500040018000000530061006E007400610020004D
      006F006E006900630061000500040000004300410006000A0000003900300034
      0031003000070004000000550053000800180000003200310033002D00350035
      0035002D0031003900380034000900180000003200310033002D003500350035
      002D0031003900390035000A0000000000000000000B00200000004300680072
      0069007300740069006E00650020005400610079006C006F0072000C000000F0
      03169DCC42FEFEFF1D1E0025000000FF1F00000000000000D8B0400100200000
      0044006900760065007200730020006F0066002000560065006E006900630065
      0002001C000000320032003000200045006C006D002000530074007200650065
      00740004000C000000560065006E0069006300650005000400000046004C0006
      000A000000330039003200320034000700040000005500530008001800000038
      00310033002D003400340033002D003200330035003600090018000000380031
      0033002D003400340033002D0039003800340032000A0000000000000000000B
      0018000000530069006D006F006E006500200047007200650065006E000C0000
      0086520899CC42FEFEFF1D1E0026000000FF1F00000000000000B3B14001001E
      0000004F006E002D005400610072006700650074002000530043005500420041
      0002002A00000037002D003700330037003600330020004E0061006E0061006B
      00610077006100200052006F0061006400040010000000570069006E006E0069
      007000650067000500100000004D0061006E00690074006F006200610006000E
      0000004A0032005200200035005400330007000C000000430061006E00610064
      0061000800180000003400310036002D003400340035002D0030003900380038
      000900180000003400310036002D003400340035002D0030003200320033000A
      0000000000000000000B001A0000004200720061006D0020005000680069006C
      006C006900700073000C0000002E04CC99CC42FEFEFF1D1E0027000000FF1F00
      0000000000002CB2400100220000004A0061006D006100690063006100200053
      0075006E002C00200049006E0063002E0002001400000050004F00200042006F
      0078002000360034003300040016000000520075006E00610077006100790020
      0042006100790005000E0000004A0061006D0061006900630061000700160000
      005700650073007400200049006E006400690065007300080018000000380030
      0039002D003500350035002D0032003700340036000900180000003800300039
      002D003500350035002D0030003900320039000A0000000000000000000B001A
      0000004A006F006E0061007400680061006E00200057006500730074000C0000
      0074103A9DCC42FEFEFF1D1E0028000000FF1F000000000000004CB240010024
      00000055006E00640065007200770061007400650072002000460061006E0074
      0061007300790002001400000050004F00200042006F00780020003800340032
      000400120000004F00630068006F002000520069006F00730005000E0000004A
      0061006D0061006900630061000700160000005700650073007400200049006E
      0064006900650073000800180000003800300039002D003500350035002D0032
      003200310034000900180000003800300039002D003500350035002D00320032
      00330034000A0000000000000000000B001E0000004700720061006E00740020
      00410069006E00730077006F007200740068000C0000002619179CCC42FEFEFF
      1D1E0029000000FF1F000000000000000CB44001002A0000005000720069006E
      0063006500730073002000490073006C0061006E006400200053004300550042
      00410002002200000050004F00200042006F0078002000330032002000570061
      0069007900650076006F0004000E000000540061007600650075006E00690007
      0008000000460069006A0069000800140000003600370039002D003300310031
      003900320033000900140000003600370039002D003300310031003200300033
      000A0000000000000000000B001A00000041006E006E00650020004D00610072
      00690061006300680069000C000000DC4E008BCC42FEFEFF1D1E002A000000FF
      1F000000000000001FB440010036000000430065006E007400720061006C0020
      0055006E0064006500720077006100740065007200200053007500700070006C
      0069006500730002001400000050004F00200042006F00780020003700330037
      000400180000004A006F00680061006E006E0065007300620075007200670006
      00080000003200300034003200070026000000520065007000750062006C0069
      006300200053006F002E00200041006600720069006300610008001A00000032
      0037002D00310031002D00340034003300320034003500380009001A00000032
      0037002D00310031002D0034003400330033003200350039000A000000000000
      0000000B001C0000004D00610072006900610020004500760065006E0074006F
      00730068000C0000008617E59CCC42FEFEFF1D1E002B000000FF1F0000000000
      00002BB440010028000000530061006600610072006900200055006E00640065
      0072002000740068006500200053006500610002001600000050004F00200042
      006F007800200037003400350036000400180000004700720061006E00640020
      004300610079006D0061006E0007002600000042007200690074006900730068
      0020005700650073007400200049006E00640069006500730008001800000038
      00300039002D003400300039002D003400320033003300090018000000380030
      0039002D003400300039002D0033003000300032000A0000000000000000000B
      001200000041006E006E00610020005200610063006B000C0000005653A198CC
      42FEFEFF1D1E002C000000FF1F000000000000002DB44001002A0000004C0061
      0072007200790027007300200044006900760069006E00670020005300630068
      006F006F006C00020028000000330035003600320020004E0057002000420072
      0075006300650020005300740072006500650074000400120000004D0069006C
      007700610075006B00690065000500040000004F00520006000A000000390036
      00320037003700070004000000550053000800180000003500300033002D0034
      00300033002D0037003700370037000900180000003500300033002D00340030
      0033002D0030003000350039000A0000000000000000000B001C000000490073
      006100620065006C006C00650020004E0065006500630065000C000000E6E71F
      9BCC42FEFEFF1D1E002D000000FF1F0000000000000008B54001001C00000054
      006F0072006100200054006F0072006100200054006F007200610002001A0000
      0050004F00200042006F007800200048002D00340035003700330004000C0000
      004E006100730073006100750007000E00000042006100680061006D00610073
      000800180000003800300039002D003800390038002D00300030003400330009
      00180000003800300039002D003800390038002D0039003800360034000A0000
      000000000000000B00160000004B006500760069006E00200052006900640065
      0072000C0000009E62BD9DCC42FEFEFF1D1E002E000000FF1F00000000000000
      24B54001001E00000056006100730068006F006E002000560065006E00740075
      0072006500730002002200000037003400330020004B006500790068006F006C
      006500200043006F0075007200740004001000000048006F006E006F006C0075
      006C0075000500040000004800490006000A0000003900320038003500360007
      0004000000550053000800180000003500330032002D003000390039002D0030
      003400320033000900180000003500330032002D003000390039002D00360036
      00350034000A0000000000000000000B001600000053007500730061006E0020
      0053006D006900740068000C000000CC30E399CC42FEFEFF1D1E002F000000FF
      1F0000000000000038B54001001E0000004400690076006500720073002D0066
      006F0072002D00480069007200650002001A00000047002E004F002E00200050
      00200042006F0078002000390031000400080000005300750076006100070008
      000000460069006A0069000800140000003600370039002D0038003000340035
      00370036000900140000003600370039002D003000350039003300340035000A
      0000000000000000000B00140000004A006F0065002000480061007400740065
      0072000C00000098F0FC99CC42FEFEFF1D1E0030000000FF1F00000000000000
      8BB5400100200000004F006300650061006E00200041006400760065006E0074
      00750072006500730002002000000050004F00200042006F0078002000340036
      00360020004B0069006800650069000400080000004D00610075006900050004
      0000004800490006000A00000039003500370033003600070004000000550053
      000800180000003700370036002D003800360038002D00390033003300340009
      00180000003700370036002D003800360038002D0039003500350033000A0000
      000000000000000B00140000005000610075006C0020005300740069006C006C
      000C0000009649759DCC42FEFEFF1D1E0031000000FF1F0000000000000047B8
      4001003000000055006E00640065007200770061007400650072002000530043
      00550042004100200043006F006D00700061006E00790002001800000050004F
      00200042006F007800200053006E0020003900310004001000000053006F006D
      00650072007300650074000600080000005300580042004E0007000E00000042
      00650072006D007500640061000800180000003800300039002D003500350035
      002D0031003200320035000900180000003800300039002D003500350035002D
      0032003400340035000A0000000000000000000B00200000004D006900630068
      00610065006C002000470072006F00730073006D0061006E000C000000FE9BAE
      9ACC42FEFEFF1D1E0032000000FF1F00000000000000A8B84001001A00000041
      0071007500610074006900630020004400720061006D00610002002400000039
      00320031002000450076006500720067006C0061006400650073002000570061
      00790004000A000000540061006D007000610005000400000046004C0006000A
      0000003300300036003400330007000400000055005300080018000000360031
      0033002D003400340032002D0037003600350034000900180000003600310033
      002D003400340032002D0037003600370038000A0000000000000000000B0018
      000000470069006C006C00690061006E0020004F00770065006E000C0000008C
      542F88CC42FEFEFF1D1E0033000000FF1F0000000000000074B9400100240000
      00540068006500200044006900760069006E006700200043006F006D00700061
      006E00790002001600000050004F00200042006F007800200038003500330035
      00040014000000530074002E002000540068006F006D006100730006000A0000
      0030003000380032003000070022000000550053002000560069007200670069
      006E002000490073006C0061006E0064007300080016000000320032002D0034
      0034002D0035003000300039003800090016000000320032002D00340034002D
      00300039003800370038000A0000000000000000000B00160000004200720069
      0061006E0020004D0069006C00650073000C0000004277DB99CC42FEFEFF1D1E
      0034000000FF1F00000000000000B6B9400100300000004E006F007200770065
      007300740027006500720020005300430055004200410020004C0069006D0069
      0074006500640002001600000050004F00200042006F00780020003600380033
      00340004000A000000500061006700650074000600080000005000530042005A
      0007000E0000004200650072006D007500640061000800180000003700370038
      002D003100320033002D0030003700340035000900180000003700370038002D
      003100320033002D0039003700300035000A0000000000000000000B00180000
      0041006E00670065006C00610020004A006F006E00650073000C000000423CB8
      9DCC42FEFEFF1D1E0035000000FF1F000000000000009CBA4001002E00000057
      006100740065007200730070006F007500740020005300430055004200410020
      00430065006E00740065007200020024000000370038003600350020004E0045
      0020004200610072006200650072002000430074002E0004001000000050006F
      00720074006C0061006E0064000500040000004F00520006000A000000390039
      00320037003100070004000000550053000800180000003500300033002D0036
      00350034002D0032003400330034000900180000003500300033002D00360035
      0034002D0039003900380036000A0000000000000000000B001C000000520069
      0063006800610072006400200048006F0075007300650072000C000000981E90
      9CCC42FEFEFF1D1E0036000000FF1F0000000000008038C3400100300000004E
      0065007000740075006E006500270073002000540072006900640065006E0074
      00200053007500700070006C00790002001400000050004F00200042006F0078
      00200031003200390004000C0000004E0065006700720069006C0005000E0000
      004A0061006D0061006900630061000700160000005700650073007400200049
      006E0064006900650073000800180000003700370038002D003800390037002D
      0033003500340036000900180000003700370038002D003800390037002D0036
      003600340033000A0000000000000000000B001A0000004C006F007500690073
      00650020004600720061006E006B0073000C000000F40972A0CC42FEFEFEFEFE
      FF20FEFF212200C9050000FF23FEFEFE0E004D0061006E006100670065007200
      1E00550070006400610074006500730052006500670069007300740072007900
      12005400610062006C0065004C006900730074000A005400610062006C006500
      08004E0061006D006500140053006F0075007200630065004E0061006D006500
      0A0054006100620049004400240045006E0066006F0072006300650043006F00
      6E00730074007200610069006E00740073001E004D0069006E0069006D007500
      6D0043006100700061006300690074007900180043006800650063006B004E00
      6F0074004E0075006C006C00140043006F006C0075006D006E004C0069007300
      74000C0043006F006C0075006D006E00100053006F0075007200630065004900
      440010006400740044006F00750062006C006500100044006100740061005400
      7900700065001400530065006100720063006800610062006C00650012004100
      6C006C006F0077004E0075006C006C000800420061007300650014004F004100
      6C006C006F0077004E0075006C006C0012004F0049006E005500700064006100
      7400650010004F0049006E00570068006500720065001A004F00720069006700
      69006E0043006F006C004E0061006D0065001800640074005700690064006500
      53007400720069006E0067000800530069007A006500140053006F0075007200
      63006500530069007A0065001400640074004400610074006500540069006D00
      65001C0043006F006E00730074007200610069006E0074004C00690073007400
      100056006900650077004C006900730074000E0052006F0077004C0069007300
      7400060052006F0077000A0052006F0077004900440010004F00720069006700
      69006E0061006C001800520065006C006100740069006F006E004C0069007300
      74001C0055007000640061007400650073004A006F00750072006E0061006C00
      1200530061007600650050006F0069006E0074000E004300680061006E006700
      65007300}
  end
  object memOrders: TFDMemTable
    Active = True
    IndexFieldNames = 'CustNo'
    MasterSource = dtsCustomer
    MasterFields = 'CustNo'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 408
    Top = 288
    Content = {
      414442530F003137F47C0000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B04000E0000
      004F0072006400650072004E006F0005000E0000004F0072006400650072004E
      006F000C00010000000E000D000F000110000111000112000113000114000115
      000E0000004F0072006400650072004E006F00FEFF0B04000C00000043007500
      730074004E006F0005000C00000043007500730074004E006F000C0002000000
      0E000D000F000110000111000112000113000114000115000C00000043007500
      730074004E006F00FEFF0B040010000000530061006C00650044006100740065
      00050010000000530061006C00650044006100740065000C00030000000E0016
      000F0001100001110001120001130001140001150010000000530061006C0065
      004400610074006500FEFF0B0400100000005300680069007000440061007400
      6500050010000000530068006900700044006100740065000C00040000000E00
      16000F0001100001110001120001130001140001150010000000530068006900
      70004400610074006500FEFF0B04000A00000045006D0070004E006F0005000A
      00000045006D0070004E006F000C00050000000E0017000F0001100001110001
      12000113000114000115000A00000045006D0070004E006F00FEFF0B04001A00
      0000530068006900700054006F0043006F006E00740061006300740005001A00
      0000530068006900700054006F0043006F006E0074006100630074000C000600
      00000E0018001900140000000F00011000011100011200011300011400011500
      1A000000530068006900700054006F0043006F006E0074006100630074001A00
      14000000FEFF0B040016000000530068006900700054006F0041006400640072
      003100050016000000530068006900700054006F00410064006400720031000C
      00070000000E00180019001E0000000F00011000011100011200011300011400
      01150016000000530068006900700054006F00410064006400720031001A001E
      000000FEFF0B040016000000530068006900700054006F004100640064007200
      3200050016000000530068006900700054006F00410064006400720032000C00
      080000000E00180019001E0000000F0001100001110001120001130001140001
      150016000000530068006900700054006F00410064006400720032001A001E00
      0000FEFF0B040014000000530068006900700054006F00430069007400790005
      0014000000530068006900700054006F0043006900740079000C00090000000E
      00180019000F0000000F00011000011100011200011300011400011500140000
      00530068006900700054006F0043006900740079001A000F000000FEFF0B0400
      16000000530068006900700054006F0053007400610074006500050016000000
      530068006900700054006F00530074006100740065000C000A0000000E001800
      1900140000000F00011000011100011200011300011400011500160000005300
      68006900700054006F00530074006100740065001A0014000000FEFF0B040012
      000000530068006900700054006F005A00690070000500120000005300680069
      00700054006F005A00690070000C000B0000000E00180019000A0000000F0001
      100001110001120001130001140001150012000000530068006900700054006F
      005A00690070001A000A000000FEFF0B04001A00000053006800690070005400
      6F0043006F0075006E0074007200790005001A00000053006800690070005400
      6F0043006F0075006E007400720079000C000C0000000E001800190014000000
      0F000110000111000112000113000114000115001A0000005300680069007000
      54006F0043006F0075006E007400720079001A0014000000FEFF0B0400160000
      00530068006900700054006F00500068006F006E006500050016000000530068
      006900700054006F00500068006F006E0065000C000D0000000E00180019000F
      0000000F00011000011100011200011300011400011500160000005300680069
      00700054006F00500068006F006E0065001A000F000000FEFF0B04000E000000
      530068006900700056004900410005000E000000530068006900700056004900
      41000C000E0000000E0018001900070000000F00011000011100011200011300
      0114000115000E00000053006800690070005600490041001A0007000000FEFF
      0B04000400000050004F0005000400000050004F000C000F0000000E00180019
      000F0000000F000110000111000112000113000114000115000400000050004F
      001A000F000000FEFF0B04000A0000005400650072006D00730005000A000000
      5400650072006D0073000C00100000000E0018001900060000000F0001100001
      11000112000113000114000115000A0000005400650072006D0073001A000600
      0000FEFF0B04001A0000005000610079006D0065006E0074004D006500740068
      006F00640005001A0000005000610079006D0065006E0074004D006500740068
      006F0064000C00110000000E0018001900070000000F00011000011100011200
      0113000114000115001A0000005000610079006D0065006E0074004D00650074
      0068006F0064001A0007000000FEFF0B0400140000004900740065006D007300
      54006F00740061006C000500140000004900740065006D00730054006F007400
      61006C000C00120000000E000D000F0001100001110001120001130001140001
      1500140000004900740065006D00730054006F00740061006C00FEFF0B04000E
      000000540061007800520061007400650005000E000000540061007800520061
      00740065000C00130000000E000D000F00011000011100011200011300011400
      0115000E0000005400610078005200610074006500FEFF0B04000E0000004600
      72006500690067006800740005000E0000004600720065006900670068007400
      0C00140000000E000D000F000110000111000112000113000114000115000E00
      00004600720065006900670068007400FEFF0B04001400000041006D006F0075
      006E007400500061006900640005001400000041006D006F0075006E00740050
      006100690064000C00150000000E000D000F0001100001110001120001130001
      14000115001400000041006D006F0075006E0074005000610069006400FEFEFF
      1BFEFF1CFEFF1DFF1E1F0000000000FF2000000000000000588F400100000000
      00001C95400200000032D5B184CC4203000000F8E7E784CC420400720000000D
      00060000005500500053000F000600000046004F00420010000C000000430072
      0065006400690074001100000000000088934012000000000000001240130000
      0000000000000014000000000000000000FEFEFF1E1F0001000000FF20000000
      00000000608F4001000000000000D8A0400200000018B5BE84CC420300000046
      48C184CC4204009100000005001C0000004D0061007200690061002000450076
      0065006E0074006F007300680006001400000050004F00200042006F00780020
      003700330037000800180000004A006F00680061006E006E0065007300620075
      00720067000A000800000032003000340032000B002600000052006500700075
      0062006C0069006300200053006F002E0020004100660072006900630061000C
      001A000000320037002D00310031002D0034003400330032003400350038000D
      0006000000440048004C000F000600000046004F00420010000A000000430068
      00650063006B0011000000000000CDBE40120000000000000000001300000000
      000000000014000000000000CDBE40FEFEFF1E1F0002000000FF200000000000
      0000688F400100000000000030954002000000A26EC684CC420300000076B0DE
      83CC4204006E0000000D00060000005500500053000F000600000046004F0042
      00100008000000560069007300610011000000000000C7B24012000000000000
      0000001300000000000000000014000000000000C7B240FEFEFF1E1F00030000
      00FF2000000000000000708F4001000000000000909540020000004411D39CCC
      4203000000C0FDCB86CC4204002E0000000D000A00000045006D006500720079
      000E000E00000050003100300031003300320034000F000600000046004F0042
      001000080000005600690073006100110000000000C03CDF4012000000000000
      0000001300000000000000000014000000000000000000FEFEFF1E1F00040000
      00FF2000000000000000788F4001000000000000A09540020000009CC1E284CC
      4203000000CA54E584CC4204002D0000000D000E0000005500530020004D0061
      0069006C000F000600000046004F004200100008000000560069007300610011
      00000000000064B9401200000000000000000013000000000000000000140000
      0000000064B940FEFEFF1E1F0005000000FF2000000000000000808F40010000
      0000000098974002000000F8E7E784CC4203000000267BEA84CC4204000C0000
      000D000E0000005500530020004D00610069006C000F000C0000004E00650074
      00200033003000100008000000560069007300610011000000000000A6964012
      0000000000000000001300000000000000000014000000000000000000FEFEFF
      1E1F0006000000FF2000000000000000888F4001000000000000A49740020000
      006881FC84CC42030000009614FF84CC420400470000000D000E000000550053
      0020004D00610069006C000F000C0000004E0065007400200033003000100006
      00000043004F00440011000000000000D3B54012000000000000000000130000
      0000000000000014000000000000000000FEFEFF1E1F0007000000FF20000000
      00000000908F40010000000000003C9840020000006881FC84CC420300000096
      14FF84CC4204002E0000000D00060000005500500053000F000C0000004E0065
      00740020003300300010000600000043004F0044001100000000000084B34012
      000000000000000000130000000000000000001400000000000084B340FEFEFF
      1E1F0008000000FF2000000000000000988F4001000000000000609840020000
      00AA870E85CC4203000000D81A1185CC420400050000000D0006000000550050
      0053000F000C0000004E006500740020003300300010000600000043004F0044
      00110033333333B3EFA440120000000000000000001300000000000000000014
      0033333333B3EFA440FEFEFF1E1F0009000000FF2000000000000000A08F4001
      0000000000006C984002000000D81A1185CC420300000006AE1385CC42040076
      0000000D00060000005500500053000F000C0000004E00650074002000330030
      0010000C0000004300720065006400690074001100000000000051B440120000
      00000000000000130000000000000000001400000000000051B440FEFEFF1E1F
      000A000000FF2000000000000000A88F400100000000000060994002000000EC
      8D2085CC42030000001A212385CC420400860000000D000A00000045006D0065
      00720079000F000C0000004E006500740020003300300010000C000000430072
      0065006400690074001100000000000056A84012000000000000000000130000
      000000000000001400000000000056A840FEFEFF1E1F000B000000FF20000000
      00000000B08F4001000000000000B4994002000000EC8D2085CC42030000001A
      212385CC420400900000000D000A00000045006D006500720079000F000C0000
      004E006500740020003300300010000C00000043007200650064006900740011
      003433333333DB60401200000000000000000013000000000000000000140033
      33333333DB6040FEFEFF1E1F000C000000FF2000000000000000B88F40010000
      00000000CC994002000000EC8D2085CC42030000001A212385CC420400470000
      000D000A00000045006D006500720079000F000600000046004F004200100004
      0000004D00430011000000000070D8D340120000000000000000001300000000
      000000000014000000000070D8D340FEFEFF1E1F000D000000FF200000000000
      0000C08F4001000000000000409A40020000005C273585CC42030000008ABA37
      85CC420400410000000D00060000005500500053000F000600000046004F0042
      0010000800000041006D0045007800110000000000005AA44012000000000000
      0000001300000000000000000014000000000000000000FEFEFF1E1F000E0000
      00FF2000000000000000C88F4001000000000000009F400200000028E74E85CC
      4203000000567A5185CC4204001C0000000D0006000000440048004C000F0006
      00000046004F00420010000A00000043006800650063006B0011000000000080
      E9C3401200000000000000000013000000000000000000140000000000000000
      00FEFEFF1E1F000F000000FF2000000000000000D08F40010000000000008CA0
      40020000003C5A5E85CC42030000006AED6085CC420400760000000D00060000
      00440048004C000F000600000046004F00420010000A00000043006800650063
      006B001100000000000088B44012000000000000000000130000000000000000
      0014000000000000000000FEFEFF1E1F0010000000FF2000000000000000D88F
      4001000000000000AEA0400200000050CD6D85CC42030000007E607085CC4204
      00720000000D0006000000440048004C000F000C0000004E0065007400200033
      00300010000C000000430072006500640069007400110000000000801ED44012
      0000000000000000001300000000000000000014000000000000000000FEFEFF
      1E1F0011000000FF2000000000000000E08F4001000000000000D8A040020000
      0050CD6D85CC42030000007E607085CC4204003D0000000D0006000000440048
      004C000F000C0000004E006500740020003300300010000C0000004300720065
      006400690074001100000000008071C340120000000000000000001300000000
      00000000001400000000008071C340FEFEFF1E1F0012000000FF200000000000
      0000E88F4001000000000000E6A0400200000050CD6D85CC42030000007E6070
      85CC420400340000000D00060000005500500053000F000C0000004E00650074
      0020003300300010000C00000043007200650064006900740011000000000000
      0EAD401200000000000000000013000000000000000000140000000000000EAD
      40FEFEFF1E1F0013000000FF2000000000000000F08F4001000000000000E6A0
      400200000064407D85CC420300000092D37F85CC4204002E0000000D00060000
      005500500053000F000C0000004E006500740020003300300010000C00000043
      007200650064006900740011003333333353A8C3401200000000000000000013
      00000000000000000014003333333353A8C340FEFEFF1E1F0014000000FF2000
      000000000000F88F40010000000000001493400200000092D37F85CC42030000
      00C0668285CC420400050000000D00060000005500500053000F000C0000004E
      006500740020003300300010000A00000043006800650063006B001100000000
      000042B240120000000000000000001300000000000000000014000000000000
      42B240FEFEFF1E1F0015000000FF200000000000000000904001000000000000
      9EA84002000000C0668285CC4203000000EEF98485CC420400020000000D0006
      0000005500500053000F000C0000004E006500740020003300300010000A0000
      0043006800650063006B0011000000000000F1BA401200000000000000000013
      00000000000000000014000000000000F1BA40FEFEFF1E1F0016000000FF2000
      0000000000000490400100000000000098974002000000EEF98485CC42030000
      001C8D8785CC420400080000000D0006000000440048004C000F000C0000004E
      006500740020003300300010000800000041006D004500780011000000000000
      108D40120000000000000000001300000000000000000014000000000000108D
      40FEFEFF1E1F0017000000FF2000000000000000089040010000000000006099
      4002000000A6468F85CC4203000000D4D99185CC4204002C0000000D00060000
      005500500053000F000C0000004E006500740020003300300010000800000041
      006D004500780011000000000000D0A640120000000000000000001300000000
      000000000014000000000000D0A640FEFEFF1E1F0018000000FF200000000000
      00000C904001000000000000A0954002000000A6468F85CC4203000000D4D991
      85CC420400220000000D00060000005500500053000F000C0000004E00650074
      002000330030001000080000005600690073006100110000000000809ED84012
      00000000000000000013000000000000000000140000000000809ED840FEFEFF
      1E1F0019000000FF200000000000000010904001000000000000CC9940020000
      00A6468F85CC4203000000D4D99185CC4204000B0000000D000A00000045006D
      006500720079000F000600000046004F00420010000800000056006900730061
      001100CDCCCCCCCC7C7540120000000000000000001300000000000000000014
      00CDCCCCCCCC7C7540FEFEFF1E1F001A000000FF200000000000000014904001
      000000000000B4994002000000A099AB85CC4203000000CE2CAE85CC4204006E
      0000000D000A000000460065006400450078000F000600000046004F00420010
      00040000004D00430011000000000000A3D34012000000000000000000130000
      0000000000000014000000000000A3D340FEFEFF1E1F001B000000FF20000000
      00000000189040010000000000003EAC4002000000E29FBD85CC420300000010
      33C085CC4204006B0000000D000A000000460065006400450078000F00060000
      0046004F0042001000040000004D0043001100CDCCCCCCCC7C81401200000000
      0000000000130000000000000000001400CDCCCCCCCC7C8140FEFEFF1E1F001C
      000000FF20000000000000001C9040010000000000008CA040020000006C59C5
      85CC420300000024A6CF85CC4204007F0000000D000A00000046006500640045
      0078000F000600000046004F00420010000C0000004300720065006400690074
      0011000000000080C6C840120000000000000000001300000000000000000014
      000000000080C6C840FEFEFF1E1F001D000000FF200000000000000020904001
      000000000000E6A040020000006C59C585CC420300000024A6CF85CC42040090
      0000000D000A000000460065006400450078000F000600000046004F00420010
      000C000000430072006500640069007400110000000000003888401200000000
      00000000001300000000000000000014000000000000388840FEFEFF1E1F001E
      000000FF200000000000000024904001000000000000A095400200000024A6CF
      85CC42030000005239D285CC4204008A0000000D000A00000046006500640045
      0078000F000600000046004F0042001000080000004300610073006800110000
      0000000058934012000000000000000000130000000000000000001400000000
      0000589340FEFEFF1E1F001F000000FF20000000000000002890400100000000
      0000409A40020000004C8CEE85CC42030000007A1FF185CC420400180000000D
      00060000005500500053000F000600000046004F00420010000A000000430068
      00650063006B001100000000000019D240120000000000000000001300000000
      00000000001400000000000019D240FEFEFF1E1F0020000000FF200000000000
      00002C90400100000000000060984002000000D645F685CC420300000004D9F8
      85CC4204000F0000000D00060000005500500053000F000600000046004F0042
      0010000C00000043007200650064006900740011000000000000808140120000
      000000000000001300000000000000000014000000000000808140FEFEFF1E1F
      0021000000FF20000000000000003090400100000000000008B5400200000074
      720D86CC4203000000A2051086CC420400040000000D0006000000440048004C
      000F000600000046004F00420010000C00000043007200650064006900740011
      0000000000000EB0401200000000000000000013000000000000000000140000
      000000000EB040FEFEFF1E1F0022000000FF2000000000000000349040010000
      00000000009F4002000000A2051086CC4203000000D0981286CC4204000C0000
      000D0006000000440048004C000F000600000046004F00420010000C00000043
      0072006500640069007400110000000000005AA8401200000000000000000013
      000000000000000000140000000000005AA840FEFEFF1E1F0023000000FF2000
      00000000000038904001000000000000B4994002000000A2051086CC42030000
      00D0981286CC420400480000000D0006000000440048004C000F000600000046
      004F004200100008000000560069007300610011000000000000D4C340120000
      000000000000001300000000000000000014000000000000D4C340FEFEFF1E1F
      0024000000FF20000000000000003C904001000000000000ACA840020000002C
      BF1786CC4203000000B6781F86CC4204003D0000000D000E0000005500530020
      004D00610069006C000F000600000046004F0042001000080000005600690073
      00610011006666666666C6804012000000000000000000130000000000000000
      0014006666666666C68040FEFEFF1E1F0025000000FF20000000000000004090
      40010000000000009CBA400200000040322786CC42030000006EC52986CC4204
      00340000000D000E0000005500530020004D00610069006C000F000C0000004E
      0065007400200033003000100008000000560069007300610011000000000000
      60AC4012000000000000000000130000000000000000001400000000000060AC
      40FEFEFF1E1F0026000000FF2000000000000000449040010000000000002CB2
      400200000068184686CC420300000096AB4886CC4204006D0000000D000E0000
      005500530020004D00610069006C000F000C0000004E00650074002000330030
      0010000800000041006D0045007800110000000000007FBE4012000000000000
      00000013000000000000000000140000000000007FBE40FEFEFF1E1F00270000
      00FF20000000000000004890400100000000000020AF4002000000D8B15A86CC
      420300000006455D86CC420400090000000D00060000005500500053000F000C
      0000004E006500740020003300300010000800000041006D004500780011009A
      999999995D8E40120000000000000000001300000000000000000014009A9999
      99995D8E40FEFEFF1E1F0028000000FF20000000000000004C90400100000000
      00000CB44002000000EC246A86CC42030000001AB86C86CC4204000E0000000D
      00060000005500500053000F000C0000004E006500740020003300300010000C
      0000004300720065006400690074001100000000008053C84012000000000000
      000000130000000000000000001400000000008053C840FEFEFF1E1F00290000
      00FF2000000000000000509040010000000000008BB540020000005CBE7E86CC
      42030000008A518186CC4204000C0000000D00060000005500500053000F0006
      00000046004F00420010000C0000004300720065006400690074001100000000
      004046EF40120000000000000000001300000000000000000014000000000040
      46EF40FEFEFF1E1F002A000000FF200000000000000054904001000000000080
      38C34002000000CC579386CC4203000000FAEA9586CC420400240000000D000A
      000000460065006400450078000F000600000046004F00420010000C00000043
      0072006500640069007400110066666666669E88401200000000000000000013
      000000000000000000140066666666669E8840FEFEFF1E1F002B000000FF2000
      0000000000005890400100000000000016A24002000000A6DDD886CC42030000
      00D470DB86CC420400180000000D000A000000460065006400450078000F0006
      00000046004F00420010000A00000043006800650063006B0011006666666666
      F68740120000000000000000001300000000000000000014006666666666F687
      40FEFEFF1E1F002C000000FF20000000000000005C9040010000000000008BB5
      4002000000587DFF86CC420300000086100287CC4204002C0000000D000A0000
      00460065006400450078000F000600000046004F004200100008000000430061
      00730068001100000000008002CE401200000000000000000013000000000000
      0000001400000000008002CE40FEFEFF1E1F002D000000FF2000000000000000
      6090400100000000000038B540020000003E5D0C87CC42030000006CF00E87CC
      420400760000000D000A000000460065006400450078000F000600000046004F
      004200100008000000560069007300610011000000000000B2BC401200000000
      00000000001300000000000000000014000000000000B2BC40FEFEFF1E1F002E
      000000FF20000000000000006490400100000000008038C3400200000038B028
      87CC420300000066432B87CC4204006B0000000D00060000005500500053000F
      000600000046004F0042001000040000004D00430011006666666666479C4012
      0000000000000000001300000000000000000014006666666666479C40FEFEFF
      1E1F002F000000FF200000000000000068904001000000000000D8A740020000
      0032034587CC420300000060964787CC4204005E0000000D0006000000550050
      0053000F000600000046004F00420010000800000041006D004500780011009A
      999999D98FB840120000000000000000001300000000000000000014009A9999
      99D98FB840FEFEFF1E1F0030000000FF20000000000000006C90400100000000
      0000EAA040020000002C566187CC42030000005AE96387CC420400020000000D
      000A000000460065006400450078000F000C0000004E00650074002000330030
      0010000C00000043007200650064006900740011000000000000507440120000
      000000000000001300000000000000000014000000000000507440FEFEFF1E1F
      0031000000FF2000000000000000709040010000000000001C95400200000088
      7C6687CC4203000000B60F6987CC420400900000000D000A0000004600650064
      00450078000F000C0000004E006500740020003300300010000C000000430072
      0065006400690074001100000000000065D04012000000000000000000130000
      000000000000001400000000000065D040FEFEFF1E1F0032000000FF20000000
      000000007490400100000000000074B9400200000026A97D87CC420300000054
      3C8087CC420400910000000D000A000000460065006400450078000F000C0000
      004E006500740020003300300010000C00000043007200650064006900740011
      00000000008012D8401200000000000000000013000000000000000000140000
      0000008012D840FEFEFF1E1F0033000000FF2000000000000000789040010000
      0000000038B540020000007C229F87CC4203000000346FA987CC420400530000
      000D00060000005500500053000F000C0000004E006500740020003300300010
      0008000000560069007300610011000000000000B6CB40120000000000000000
      001300000000000000000014000000000000B6CB40FEFEFF1E1F0034000000FF
      20000000000000007C9040010000000000001C954002000000BE28B187CC4203
      000000ECBBB387CC4204001D0000000D00060000005500500053000F000C0000
      004E006500740020003300300010000C00000043007200650064006900740011
      000000000080DBD6401200000000000000000013000000000000000000140000
      00000080DBD640FEFEFF1E1F0035000000FF2000000000000000809040010000
      00000000A49740020000007675BB87CC4203000000A408BE87CC420400180000
      000D00060000005500500053000F000C0000004E006500740020003300300010
      00040000004D0043001100CDCCCCCC6CD7D24012000000000000000000130000
      000000000000001400CDCCCCCC6CD7D240FEFEFF1E1F0036000000FF20000000
      00000000849040010000000000006C9840020000004235D587CC420300000070
      C8D787CC4204000E0000000D00060000005500500053000F000C0000004E0065
      00740020003300300010000C0000004300720065006400690074001100000000
      0000DC9E40120000000000000000001300000000000000000014000000000000
      DC9E40FEFEFF1E1F0037000000FF200000000000000088904001000000000000
      8CA04002000000CCEEDC87CC4203000000FA81DF87CC420400080000000D000E
      0000005500530020004D00610069006C000F000C0000004E0065007400200033
      00300010000C00000043007200650064006900740011000000000000E0C84012
      0000000000000000001300000000000000000014000000000000E0C840FEFEFF
      1E1F0038000000FF20000000000000008C904001000000000000309540020000
      0056A8E487CC4203000000843BE787CC4204006D00000006002600000034002D
      003900370036002000530075006700610072006C006F00610066002000480077
      0079000700120000005300750069007400650020003100300033000800160000
      004B00610070006100610020004B006100750061006900090004000000480049
      000A0014000000390034003700360036002D0031003200330034000B000E0000
      0041006D00650072006900630061000C00180000003800300038002D00350035
      0035002D0030003200360039000D000E0000005500530020004D00610069006C
      000F000600000046004F00420010000800000043006100730068001100000000
      0000CCA040120000000000000021401300000000000000000014000000000000
      CCA040FEFEFF1E1F0039000000FF200000000000000090904001000000000000
      3C9340020000000EF5EE87CC42030000003C88F187CC4204005E0000000D000E
      0000005500530020004D00610069006C000F000600000046004F00420010000A
      00000043006800650063006B0011000000000080FDCD40120000000000000000
      001300000000000000000014000000000080FDCD40FEFEFF1E1F003A000000FF
      2000000000000000949040010000000000006C98400200000098AEF687CC4203
      000000C641F987CC420400020000000D000E0000005500530020004D00610069
      006C000F000600000046004F00420010000C0000004300720065006400690074
      0011003333333353B5D740120000000000000000001300000000000000000014
      003333333353B5D740FEFEFF1E1F003B000000FF200000000000000098904001
      0000000000008CA040020000007E8E0388CC4203000000AC210688CC4204000B
      0000000D000E0000005500530020004D00610069006C000F000600000046004F
      00420010000C00000043007200650064006900740011000000000000E4D14012
      0000000000000000001300000000000000000014000000000000E4D140FEFEFF
      1E1F003C000000FF20000000000000009C904001000000000000C4A740020000
      00646E1088CC420300000092011388CC420400180000000D000E000000550053
      0020004D00610069006C000F000600000046004F00420010000C000000430072
      00650064006900740011009A999999A935EE4012000000000000000000130000
      0000000000000014009A999999A935EE40FEFEFF1E1F003D000000FF20000000
      00000000A09040010000000000008CA040020000005EC12C88CC42030000008C
      542F88CC420400530000000D0006000000440048004C000F000C0000004E0065
      00740020003300300010000C0000004300720065006400690074001100000000
      0000B07840120000000000000000001300000000000000000014000000000000
      B07840FEFEFF1E1F003E000000FF2000000000000000A4904001000000000000
      A8B840020000008C542F88CC4203000000BAE73188CC420400480000000D0006
      0000005500500053000F000600000046004F0042001000080000005600690073
      0061001100000000008065D14012000000000000000000130000000000000000
      001400000000008065D140FEFEFF1E1F003F000000FF2000000000000000A890
      4001000000000000DCA74002000000BAE73188CC4203000000E87A3488CC4204
      00410000000D0006000000440048004C000F000C0000004E0065007400200033
      00300010000800000056006900730061001100000000000059D3401200000000
      0000000000130000000000000000001400000000000059D340FEFEFF1E1F0040
      000000FF2000000000000000AC9040010000000000001C954002000000CE5A41
      88CC4203000000FCED4388CC420400220000000D000A00000046006500640045
      0078000F000600000046004F0042001000080000005600690073006100110000
      000000008FB14012000000000000000000130000000000000000001400000000
      00008FB140FEFEFF1E1F0041000000FF2000000000000000B090400100000000
      0000B3B140020000002A814688CC420300000058144988CC420400690000000D
      000A000000460065006400450078000F000600000046004F0042001000040000
      004D004300110000000000C019DF401200000000000000000013000000000000
      000000140000000000C019DF40FEFEFF1E1F0042000000FF2000000000000000
      B49040010000000000003EA7400200000086A74B88CC4203000000B43A4E88CC
      420400880000000D00060000005500500053000F000600000046004F00420010
      000C000000430072006500640069007400110066666666AE84E0401200000000
      000000000013000000000000000000140066666666AE84E040FEFEFF1E1F0043
      000000FF2000000000000000B890400100000000000047B84002000000E2CD50
      88CC420300000010615388CC420400900000000D0006000000440048004C000F
      000C0000004E006500740020003300300010000C000000430072006500640069
      00740011000000000080D4D54012000000000000000000130000000000000000
      0014000000000080D4D540FEFEFF1E1F0044000000FF2000000000000000BC90
      4001000000000000609840020000003EF45588CC42030000006C875888CC4204
      00720000000D000A000000460065006400450078000F000C0000004E00650074
      0020003300300010000800000043006100730068001100000000001028F94012
      000000000000000000130000000000000000001400000000001028F940FEFEFF
      1E1F0045000000FF2000000000000000C0904001000000000000309540020000
      009A1A5B88CC4203000000C8AD5D88CC4204001D0000000D000E000000550053
      0020004D00610069006C000F000C0000004E0065007400200033003000100008
      00000043006100730068001100000000000018AC401200000000000000000013
      0000000000000000001400000000000018AC40FEFEFF1E1F0046000000FF2000
      000000000000C49040010000000000003C93400200000052676588CC42030000
      0080FA6788CC420400020000000D000E0000005500530020004D00610069006C
      000F000C0000004E00650074002000330030001000040000004D004300110000
      00000080F5D24012000000000000000000130000000000000000001400000000
      0080F5D240FEFEFF1E1F0047000000FF2000000000000000C890400100000000
      0000009F40020000000AB46F88CC420300000038477288CC4204000F0000000D
      000E0000005500530020004D00610069006C000F000C0000004E006500740020
      00330030001000040000004D0043001100000000000026A14012000000000000
      000000130000000000000000001400000000000026A140FEFEFF1E1F00480000
      00FF2000000000000000CC9040010000000000001C95400200000066DA7488CC
      4203000000946D7788CC4204000B0000000D00060000005500500053000F0006
      00000046004F0042001000040000004D00430011000000000000B8C040120000
      000000000000001300000000000000000014000000000000B8C040FEFEFF1E1F
      0049000000FF2000000000000000D09040010000000000001493400200000074
      103A9DCC42030000004CBA8188CC420400090000000D00060000005500500053
      000F000600000046004F00420010000800000056006900730061001100000000
      00405DD140120000000000000000001300000000000000000014000000000040
      5DD140FEFEFF1E1F004A000000FF2000000000000000D4904001000000000000
      3C984002000000D6738988CC4203000000329A8E88CC4204006E0000000D0006
      000000440048004C000F000600000046004F00420010000C0000004300720065
      0064006900740011000000000000806340120000000000000000001300000000
      000000000014000000000000806340FEFEFF1E1F004B000000FF200000000000
      0000D8904001000000000000C2A74002000000329A8E88CC4203000000602D91
      88CC4204001D0000000D0006000000440048004C000F000600000046004F0042
      0010000C000000430072006500640069007400110000000000C050F340120000
      0000000000000013000000000000000000140000000000C050F340FEFEFF1E1F
      004C000000FF2000000000000000DC904001000000000000909540020000008E
      C09388CC4203000000BC539688CC4204002C0000000D0006000000440048004C
      000F000600000046004F00420010000C00000043007200650064006900740011
      0000000000005DB1401200000000000000000013000000000000000000140000
      000000005DB140FEFEFF1E1F004D000000FF2000000000000000E09040010000
      0000000030954002000000EAE69888CC4203000000187A9B88CC4204002D0000
      000D00060000005500500053000F000C0000004E006500740020003300300010
      000C00000043007200650064006900740011000000000000D1C2401200000000
      00000000001300000000000000000014000000000000D1C240FEFEFF1E1F004E
      000000FF2000000000000000E4904001000000000000C4A74002000000460D9E
      88CC420300000074A0A088CC4204006D0000000D000A00000046006500640045
      0078000F000C0000004E006500740020003300300010000800000041006D0045
      00780011000000000080D9DD4012000000000000000000130000000000000000
      0014000000000080D9DD40FEFEFF1E1F004F000000FF2000000000000000E890
      40010000000000003C984002000000A233A388CC4203000000D0C6A588CC4204
      00020000000D000A000000460065006400450078000F000C0000004E00650074
      0020003300300010000800000041006D00450078001100CDCCCCCCCC21964012
      000000000000000000130000000000000000001400CDCCCCCCCC219640FEFEFF
      1E1F0050000000FF2000000000000000EC9040010000000000006C9840020000
      00A233A388CC4203000000D0C6A588CC420400140000000D000A000000460065
      006400450078000F000C0000004E006500740020003300300010000800000043
      0061007300680011006666666666CEC540120000000000000000001300000000
      000000000014006666666666CEC540FEFEFF1E1F0051000000FF200000000000
      0000F0904001000000000000409A4002000000FE59A888CC42030000002CEDAA
      88CC4204000F0000000D000E0000005500530020004D00610069006C000F000C
      0000004E00650074002000330030001000080000004300610073006800110000
      0000000084924012000000000000000000130000000000000000001400000000
      0000849240FEFEFF1E1F0052000000FF2000000000000000F890400100000000
      0000A49740020000004060BA88CC42030000006EF3BC88CC4204001D0000000D
      000E0000005500530020004D00610069006C000F000C0000004E006500740020
      0033003000100008000000430061007300680011009A999999F970CB40120000
      000000000000001300000000000000000014009A999999F970CB40FEFEFF1E1F
      0053000000FF2000000000000000FC9040010000000000001C9540020000009C
      86BF88CC4203000000CA19C288CC4204007F0000000D0006000000440048004C
      000F000C0000004E006500740020003300300010000C00000043007200650064
      0069007400110000000000806ECB401200000000000000000013000000000000
      000000140000000000806ECB40FEFEFF1E1F0054000000FF2000000000000000
      049140010000000000009EA84002000000F8ACC488CC42030000002640C788CC
      420400710000000D00060000005500500053000F000600000046004F00420010
      000C0000004300720065006400690074001100000000000024A5401200000000
      0000000000130000000000000000001400000000000024A540FEFEFF1E1F0055
      000000FF200000000000000008914001000000000000A49740020000008266CC
      88CC4203000000B0F9CE88CC4204005E0000000D0006000000440048004C000F
      000600000046004F00420010000C000000430072006500640069007400110000
      000000809DC04012000000000000000000130000000000000000001400000000
      00809DC040FEFEFF1E1F0056000000FF20000000000000000C91400100000000
      00006C9840020000000C20D488CC4203000000C46CDE88CC420400530000000D
      000E0000005500530020004D00610069006C000F000600000046004F00420010
      000C00000043007200650064006900740011000000000000789E401200000000
      00000000001300000000000000000014000000000000789E40FEFEFF1E1F0057
      000000FF200000000000000010914001000000000000B6B940020000006846D9
      88CC4203000000C46CDE88CC4204003D0000000D000A00000046006500640045
      0078000F000C0000004E00650074002000330030001000080000005600690073
      006100110000000000ACB9F24012000000000000000000130000000000000000
      00140000000000ACB9F240FEFEFF1E1F0058000000FF20000000000000001491
      4001000000000000409A4002000000C46CDE88CC4203000000F2FFE088CC4204
      00020000000D000A000000460065006400450078000F000C0000004E00650074
      0020003300300010000800000056006900730061001100CDCCCCCCCCFC7D4012
      000000000000000000130000000000000000001400CDCCCCCCCCFC7D40FEFEFF
      1E1F0059000000FF2000000000000000189140010000000000002BB440020000
      002093E388CC42030000004E26E688CC420400040000000D000A000000460065
      006400450078000F000600000046004F0042001000040000004D004300110000
      000000C011B04012000000000000000000130000000000000000001400000000
      0000000000FEFEFF1E1F005A000000FF20000000000000001C91400100000000
      0000D8A040020000007CB9E888CC4203000000AA4CEB88CC420400240000000D
      000E0000005500530020004D00610069006C000F000C0000004E006500740020
      00330030001000040000004D004300110000000000C06BBD4012000000000000
      0000001300000000000000000014000000000000000000FEFEFF1E1F005B0000
      00FF20000000000000002091400100000000000064A240020000003406F388CC
      42030000003406F388CC420400220000000D0006000000440048004C000F000C
      0000004E00650074002000330030001000040000004D004300110000000000C0
      35FE401200000000000000000013000000000000000000140000000000000000
      00FEFEFF1E1F005C000000FF2000000000000000249140010000000000003EAC
      4002000000BEBFFA88CC4203000000BEBFFA88CC4204006B0000000D00060000
      005500500053000F000C0000004E00650074002000330030001000040000004D
      0043001100CDCCCCCCCC4CC94012000000000000000000130000000000000000
      0014000000000000000000FEFEFF1E1F005D000000FF20000000000000002891
      400100000000000016A240020000001AE6FF88CC42030000001AE6FF88CC4204
      00760000000D00060000005500500053000F000C0000004E0065007400200033
      00300010000C000000430072006500640069007400110066666666668E7D4012
      0000000000000000001300000000000000000014000000000000000000FEFEFF
      1E1F005E000000FF20000000000000002C914001000000000000009F40020000
      00760C0589CC4203000000760C0589CC4204008A0000000D0006000000550050
      0053000F000C0000004E006500740020003300300010000C0000004300720065
      0064006900740011009A99999999DF8A40120000000000000000001300000000
      000000000014000000000000000000FEFEFF1E1F005F000000FF200000000000
      000030914001000000000000A09540020000002E590F89CC42030000002E590F
      89CC420400090000000D00060000005500500053000F000600000046004F0042
      0010000C0000004300720065006400690074001100CDCCCCCCCCCEB740120000
      000000000000001300000000000000000014000000000000000000FEFEFF1E1F
      0060000000FF200000000000000034914001000000000000EAA04002000000B2
      653389CC4203000000B2653389CC420400250000000D00060000005500500053
      000F000600000046004F00420010000C00000043007200650064006900740011
      00CDCCCCCCECB6C6401200000000000000000013000000000000000000140000
      00000000000000FEFEFF1E1F0061000000FF2000000000000000389140010000
      000000003C9340020000009A69F193CC42030000009A69F193CC420400690000
      000D00060000005500500053000F000600000046004F00420010000C00000043
      00720065006400690074001100000000000038A6401200000000000000000013
      0000000000000000001400000000000038A640FEFEFF1E1F0062000000FF2000
      0000000000003C914001000000000000C4A7400200000040AF5094CC42030000
      0040AF5094CC4204005E0000000D00060000005500500053000F000600000046
      004F00420010000C000000430072006500640069007400110066666666B66EE3
      401200000000000000000013000000000000000000140066666666B66EE340FE
      FEFF1E1F0063000000FF20000000000000004091400100000000000028954002
      000000268F5D94CC4203000000268F5D94CC420400530000000D000600000044
      0048004C000F000600000046004F00420010000A00000043006800650063006B
      001100CCCCCCCC243BE940120000000000000000001300000000000000000014
      00CDCCCCCC243BE940FEFEFF1E1F0064000000FF200000000000000044914001
      00000000000030954002000000B0486594CC4203000000B0486594CC4204001C
      0000000D00060000005500500053000F000600000046004F0042001000080000
      0056006900730061001100CDCCCCCCFC7CDE4012000000000000000000130000
      000000000000001400CDCCCCCCFC7CDE40FEFEFF1E1F0065000000FF20000000
      00000000489140010000000000009095400200000030140A95CC420300000030
      140A95CC4204000F0000000D000A00000045006D006500720079000F00060000
      0046004F004200100008000000560069007300610011009A9999999997AB4012
      0000000000000000001300000000000000000014009A9999999997AB40FEFEFF
      1E1F0066000000FF20000000000000004C914001000000000000A09540020000
      00C2E65995CC4203000000C2E65995CC420400860000000D000E000000550053
      0020004D00610069006C000F000600000046004F004200100008000000560069
      007300610011000000000040B9DB401200000000000000000013000000000000
      00000014000000000040B9DB40FEFEFF1E1F0067000000FF2000000000000000
      54914001000000000000A49740020000005A668D95CC42030000005A668D95CC
      420400910000000D000E0000005500530020004D00610069006C000F000C0000
      004E006500740020003300300010000600000043004F00440011000000000000
      6069401200000000000000000013000000000000000000140000000000006069
      40FEFEFF1E1F0068000000FF20000000000000005C9140010000000000006098
      4002000000EC38DD95CC4203000000EC38DD95CC420400020000000D00060000
      005500500053000F000C0000004E006500740020003300300010000600000043
      004F0044001100CDCCCCCCCC70B2401200000000000000000013000000000000
      0000001400CDCCCCCCCC70B240FEFEFF1E1F0069000000FF2000000000000000
      60914001000000000000B3B1400200000056250E96CC420300000056250E96CC
      4204003D0000000D00060000005500500053000F000C0000004E006500740020
      003300300010000C00000043007200650064006900740011000000000000BDB5
      40120000000000000000001300000000000000000014000000000000000000FE
      FEFF1E1F006A000000FF20000000000000006491400100000000000060994002
      000000B4B77796CC4203000000B4B77796CC420400090000000D000A00000045
      006D006500720079000F000C0000004E006500740020003300300010000C0000
      004300720065006400690074001100CDCCCCCC4CA5A340120000000000000000
      001300000000000000000014000000000000000000FEFEFF1E1F006B000000FF
      20000000000000006C9140010000000000004CB24002000000EA63C296CC4203
      000000EA63C296CC4204001D0000000D000A00000045006D006500720079000F
      000600000046004F0042001000040000004D004300110033333333F31EB34012
      0000000000000000001300000000000000000014000000000000000000FEFEFF
      1E1F006C000000FF200000000000000070914001000000000000409A40020000
      005AFDD696CC42030000005AFDD696CC420400710000000D0006000000550050
      0053000F000600000046004F00420010000800000041006D0045007800110000
      0000000090D64012000000000000000000130000000000000000001400000000
      0000000000FEFEFF1E1F006D000000FF20000000000000007491400100000000
      0000009F40020000007C361297CC42030000007C361297CC4204002C0000000D
      0006000000440048004C000F000600000046004F00420010000A000000430068
      00650063006B0011009A999999D94EBA40120000000000000000001300000000
      000000000014000000000000000000FEFEFF1E1F006E000000FF200000000000
      0000789140010000000000008CA0400200000048F62B97CC420300000048F62B
      97CC420400220000000D0006000000440048004C000F000600000046004F0042
      0010000A00000043006800650063006B00110000000000801BD5401200000000
      000000000013000000000000000000140000000000801BD540FEFEFF1E1F006F
      000000FF20000000000000007C91400100000000000008B540020000003C9C64
      97CC42030000003C9C6497CC420400020000000D0006000000440048004C000F
      000C0000004E006500740020003300300010000C000000430072006500640069
      00740011009A999999F96ECC4012000000000000000000130000000000000000
      0014009A999999F96ECC40FEFEFF1E1F0070000000FF20000000000000008091
      4001000000000000D8A04002000000085C7E97CC4203000000085C7E97CC4204
      002E0000000D0006000000440048004C000F000C0000004E0065007400200033
      00300010000C0000004300720065006400690074001100333333333387884012
      0000000000000000001300000000000000000014003333333333878840FEFEFF
      1E1F0071000000FF200000000000000084914001000000000000E6A040020000
      0078F59297CC420300000078F59297CC420400550000000D0006000000550050
      0053000F000C0000004E006500740020003300300010000C0000004300720065
      0064006900740011000000000000A08940120000000000000000001300000000
      000000000014000000000000A08940FEFEFF1E1F0072000000FF200000000000
      000088914001000000000000E6A04002000000A2471698CC4203000000A24716
      98CC4204008D0000000D00060000005500500053000F000C0000004E00650074
      0020003300300010000C000000430072006500640069007400110000000000C0
      E6E5401200000000000000000013000000000000000000140000000000C0E6E5
      40FEFEFF1E1F0073000000FF20000000000000008C9140010000000000001493
      400200000062AD6898CC420300000062AD6898CC420400790000000D00060000
      005500500053000F000C0000004E006500740020003300300010000A00000043
      006800650063006B00110000000000803CCB4012000000000000000000130000
      00000000000000140000000000803CCB40FEFEFF1E1F0074000000FF20000000
      0000000090914001000000000000A0954002000000D2467D98CC4203000000D2
      467D98CC420400470000000D00060000005500500053000F000C0000004E0065
      00740020003300300010000A00000043006800650063006B00110000000000E0
      25E0401200000000000000000013000000000000000000140000000000E025E0
      40FEFEFF1E1F0075000000FF2000000000000000949140010000000000009897
      40020000005C008598CC42030000005C008598CC4204002C0000000D00060000
      00440048004C000F000C0000004E006500740020003300300010000800000041
      006D00450078001100CDCCCCCCCCB7B940120000000000000000001300000000
      00000000001400CDCCCCCCCCB7B940FEFEFF1E1F0076000000FF200000000000
      000098914001000000000000609940020000003686CA98CC42030000003686CA
      98CC4204002D0000000D00060000005500500053000F000C0000004E00650074
      0020003300300010000800000041006D004500780011000000000080BDC34012
      0000000000000000001300000000000000000014000000000080BDC340FEFEFF
      1E1F0077000000FF20000000000000009C914001000000000000A09540020000
      006419CD98CC42030000006419CD98CC420400410000000D0006000000550050
      0053000F000C0000004E00650074002000330030001000080000005600690073
      006100110000000000C07BD84012000000000000000000130000000000000000
      00140000000000C07BD840FEFEFF1E1F0078000000FF2000000000000000A091
      4001000000000000CC994002000000788CDC98CC4203000000788CDC98CC4204
      00250000000D000A00000045006D006500720079000F000600000046004F0042
      0010000800000056006900730061001100000000000033C04012000000000000
      000000130000000000000000001400000000000033C040FEFEFF1E1F00790000
      00FF2000000000000000A4914001000000000000B499400200000072DFF898CC
      420300000072DFF898CC420400180000000D000A000000460065006400450078
      000F000600000046004F0042001000040000004D00430011006666666666668F
      40120000000000000000001300000000000000000014006666666666668F40FE
      FEFF1E1F007A000000FF2000000000000000A8914001000000000000D8B04002
      000000B4E50A99CC4203000000B4E50A99CC420400720000000D000A00000046
      0065006400450078000F000600000046004F0042001000040000004D00430011
      0000000000009CB8401200000000000000000013000000000000000000140000
      000000009CB840FEFEFF1E1F007B000000FF2000000000000000AC9140010000
      000000008CA04002000000C8581A99CC4203000000C8581A99CC420400860000
      000D000A000000460065006400450078000F000600000046004F00420010000C
      00000043007200650064006900740011009A999999996AC74012000000000000
      0000001300000000000000000014009A999999996AC740FEFEFF1E1F007C0000
      00FF2000000000000000B0914001000000000000E6A04002000000C8581A99CC
      4203000000C8581A99CC420400790000000D000A000000460065006400450078
      000F000600000046004F00420010000C00000043007200650064006900740011
      000000000000508C401200000000000000000013000000000000000000140000
      00000000508C40FEFEFF1E1F007D000000FF2000000000000000B49140010000
      000000009EA84002000000F6EB1C99CC4203000000F6EB1C99CC4204008A0000
      000D000A000000460065006400450078000F000600000046004F004200100008
      000000430061007300680011000000000000E6A2401200000000000000000013
      00000000000000000014000000000000E6A240FEFEFF1E1F007E000000FF2000
      000000000000B89140010000000000001FB440020000001ED23B99CC42030000
      001ED23B99CC4204005E0000000D00060000005500500053000F000600000046
      004F00420010000A00000043006800650063006B00110033333333F313BA4012
      00000000000000000013000000000000000000140033333333F313BA40FEFEFF
      1E1F007F000000FF2000000000000000C0914001000000000000E6A040020000
      00744B5D99CC4203000000744B5D99CC420400470000000D0006000000440048
      004C000F000600000046004F00420010000C0000004300720065006400690074
      001100000000000036A740120000000000000000001300000000000000000014
      00000000000036A740FEFEFF1E1F0080000000FF2000000000000000C4914001
      000000000000009F4002000000744B5D99CC4203000000744B5D99CC4204000B
      0000000D0006000000440048004C000F000600000046004F00420010000C0000
      004300720065006400690074001100666666666681BA40120000000000000000
      00130000000000000000001400666666666681BA40FEFEFF1E1F0081000000FF
      2000000000000000CC914001000000000000989740020000002C986799CC4203
      0000002C986799CC4204001D0000000D000E0000005500530020004D00610069
      006C000F000600000046004F0042001000080000005600690073006100110000
      000000D84BE74012000000000000000000130000000000000000001400000000
      00D84BE740FEFEFF1E1F0082000000FF2000000000000000D091400100000000
      00009CBA400200000026EB8399CC420300000026EB8399CC420400340000000D
      000E0000005500530020004D00610069006C000F000C0000004E006500740020
      0033003000100008000000560069007300610011000000000000609340120000
      000000000000001300000000000000000014000000000000609340FEFEFF1E1F
      0083000000FF2000000000000000D49140010000000000002CB240020000000C
      CB9099CC42030000000CCB9099CC420400530000000D000E0000005500530020
      004D00610069006C000F000C0000004E00650074002000330030001000080000
      0041006D004500780011000000000000D89C4012000000000000000000130000
      0000000000000014000000000000D89C40FEFEFF1E1F0084000000FF20000000
      00000000D891400100000000000020AF40020000007C64A599CC42030000007C
      64A599CC420400690000000D00060000005500500053000F000C0000004E0065
      00740020003300300010000800000041006D004500780011000000000000B4AB
      40120000000000000000001300000000000000000014000000000000B4AB40FE
      FEFF1E1F0085000000FF2000000000000000DC9140010000000000000CB44002
      000000BE6AB799CC4203000000BE6AB799CC420400710000000D000600000055
      00500053000F000C0000004E006500740020003300300010000C000000430072
      006500640069007400110000000000001EA84012000000000000000000130000
      00000000000000140000000000001EA840FEFEFF1E1F0086000000FF20000000
      00000000E09140010000000000008BB540020000002E04CC99CC42030000002E
      04CC99CC420400860000000D00060000005500500053000F000600000046004F
      00420010000C00000043007200650064006900740011000000000000A3C34012
      0000000000000000001300000000000000000014000000000000A3C340FEFEFF
      1E1F0087000000FF2000000000000000E491400100000000008038C340020000
      009E9DE099CC42030000009E9DE099CC420400900000000D000A000000460065
      006400450078000F000600000046004F00420010000C00000043007200650064
      00690074001100CDCCCCCCCC85B0401200000000000000000013000000000000
      0000001400CDCCCCCCCC85B040FEFEFF1E1F0088000000FF2000000000000000
      E891400100000000000016A240020000007823269ACC42030000007823269ACC
      4204005E0000000D000A000000460065006400450078000F000600000046004F
      00420010000A00000043006800650063006B001100000000000066CD40120000
      00000000000000130000000000000000001400000000000066CD40FEFEFF1E1F
      0089000000FF2000000000000000F09140010000000000006C984002000000B4
      7C549ACC4203000000B47C549ACC420400530000000D000A0000004600650064
      00450078000F000600000046004F004200100008000000560069007300610011
      00000000000093B3401200000000000000000013000000000000000000140000
      0000000093B340FEFEFF1E1F008A000000FF2000000000000000F49140010000
      0000008038C34002000000AECF709ACC4203000000AECF709ACC420400340000
      000D00060000005500500053000F000600000046004F0042001000040000004D
      0043001100000000006032C94012000000000000000000130000000000000000
      001400000000006032C940FEFEFF1E1F008B000000FF2000000000000000F891
      4001000000000000D8A74002000000A8228D9ACC4203000000A8228D9ACC4204
      002C0000000D00060000005500500053000F000600000046004F004200100008
      00000041006D0045007800110066666666E6F7BD401200000000000000000013
      000000000000000000140066666666E6F7BD40FEFEFF1E1F008C000000FF2000
      000000000000009240010000000000001C954002000000FE9BAE9ACC42030000
      00FE9BAE9ACC420400180000000D000A000000460065006400450078000F000C
      0000004E006500740020003300300010000C0000004300720065006400690074
      0011009999999929DAF740120000000000000000001300000000000000000014
      009A99999929DAF740FEFEFF1E1F008D000000FF200000000000000004924001
      000000000000909540020000009CC8C59ACC42030000009CC8C59ACC42040004
      0000000D000A000000460065006400450078000F000C0000004E006500740020
      003300300010000C000000430072006500640069007400110033333333B329AE
      401200000000000000000013000000000000000000140033333333B329AE40FE
      FEFF1E1F008E000000FF20000000000000000892400100000000000060984002
      0000004E68EC9ACC42030000004E68EC9ACC420400090000000D000600000055
      00500053000F000C0000004E0065007400200033003000100008000000560069
      007300610011006666666666D5C9401200000000000000000013000000000000
      00000014006666666666D5C940FEFEFF1E1F008F000000FF2000000000000000
      0C9240010000000000001C95400200000006B5F69ACC420300000006B5F69ACC
      420400250000000D00060000005500500053000F000C0000004E006500740020
      003300300010000C00000043007200650064006900740011009A999999F937CB
      40120000000000000000001300000000000000000014009A999999F937CB40FE
      FEFF1E1F0090000000FF200000000000000010924001000000000000A4974002
      000000BE01019BCC4203000000BE01019BCC4204002E0000000D000600000055
      00500053000F000C0000004E00650074002000330030001000040000004D0043
      001100000000008027C840120000000000000000001300000000000000000014
      00000000008027C840FEFEFF1E1F0091000000FF200000000000000018924001
      0000000000002DB44002000000147B229BCC4203000000147B229BCC4204008D
      0000000D000E0000005500530020004D00610069006C000F000C0000004E0065
      00740020003300300010000C0000004300720065006400690074001100666666
      66C620C3401200000000000000000013000000000000000000140066666666C6
      20C340FEFEFF1E1F0092000000FF200000000000000020924001000000000000
      3C934002000000E03A3C9BCC4203000000E03A3C9BCC4204006E0000000D000E
      0000005500530020004D00610069006C000F000600000046004F00420010000A
      00000043006800650063006B00110033333333B33DA140120000000000000000
      0013000000000000000000140033333333B33DA140FEFEFF1E1F0093000000FF
      2000000000000000249240010000000000006C9840020000006AF4439BCC4203
      0000006AF4439BCC4204005E0000000D000E0000005500530020004D00610069
      006C000F000600000046004F00420010000C0000004300720065006400690074
      001100999999995903F940120000000000000000001300000000000000000014
      009A9999995903F940FEFEFF1E1F0094000000FF200000000000000028924001
      0000000000008CA0400200000050D4509BCC420300000050D4509BCC42040072
      0000000D000E0000005500530020004D00610069006C000F000600000046004F
      00420010000C00000043007200650064006900740011000000000000A2A84012
      0000000000000000001300000000000000000014000000000000A2A840FEFEFF
      1E1F0095000000FF20000000000000002C9240010000000000001C9540020000
      0036B45D9BCC420300000036B45D9BCC420400530000000D000E000000550053
      0020004D00610069006C000F000600000046004F00420010000C000000430072
      0065006400690074001100000000000060754012000000000000000000130000
      0000000000000014000000000000607540FEFEFF1E1F0096000000FF20000000
      0000000034924001000000000000A49740020000005E9A7C9BCC42030000005E
      9A7C9BCC420400480000000D00060000005500500053000F000600000046004F
      0042001000080000005600690073006100110033333333B309A5401200000000
      000000000013000000000000000000140033333333B309A540FEFEFF1E1F0097
      000000FF200000000000000038924001000000000000DCA74002000000447A89
      9BCC4203000000447A899BCC420400470000000D0006000000440048004C000F
      000C0000004E0065007400200033003000100008000000560069007300610011
      0000000000802FDC401200000000000000000013000000000000000000140000
      000000802FDC40FEFEFF1E1F0098000000FF2000000000000000409240010000
      000000006C984002000000CE33919BCC4203000000CE33919BCC420400090000
      000D000A000000460065006400450078000F000600000046004F004200100004
      0000004D00430011000000000000005A40120000000000000000001300000000
      000000000014000000000000005A40FEFEFF1E1F0099000000FF200000000000
      000044924001000000000000149340020000002A5A969BCC42030000002A5A96
      9BCC4204000C0000000D00060000005500500053000F000600000046004F0042
      0010000C00000043007200650064006900740011009A999999F97FC240120000
      000000000000001300000000000000000014009A999999F97FC240FEFEFF1E1F
      009A000000FF2000000000000000489240010000000000003C98400200000086
      809B9BCC420300000086809B9BCC420400140000000D0006000000440048004C
      000F000C0000004E006500740020003300300010000C00000043007200650064
      00690074001100CDCCCCCCCC16B6401200000000000000000013000000000000
      0000001400CDCCCCCCCC16B640FEFEFF1E1F009B000000FF2000000000000000
      4C92400100000000000060984002000000E2A6A09BCC4203000000E2A6A09BCC
      420400880000000D000A000000460065006400450078000F000C0000004E0065
      00740020003300300010000800000043006100730068001100CDCCCCCCCC69A2
      4012000000000000000000130000000000000000001400CDCCCCCCCC69A240FE
      FEFF1E1F009C000000FF2000000000000000549240010000000000003C934002
      000000F619B09BCC4203000000F619B09BCC4204007F0000000D000E00000055
      00530020004D00610069006C000F000C0000004E006500740020003300300010
      00040000004D00430011000000000000004B4012000000000000000000130000
      0000000000000014000000000000004B40FEFEFF1E1F009D000000FF20000000
      000000005C924001000000000000D6A740020000000A8DBF9BCC42030000000A
      8DBF9BCC4204006E0000000D00060000005500500053000F000600000046004F
      0042001000040000004D00430011006666666606FBCA40120000000000000000
      001300000000000000000014006666666606FBCA40FEFEFF1E1F009E000000FF
      20000000000000006092400100000000000014934002000000C2D9C99BCC4203
      000000C2D9C99BCC420400340000000D00060000005500500053000F00060000
      0046004F004200100008000000560069007300610011009A999999D952B04012
      0000000000000000001300000000000000000014009A999999D952B040FEFEFF
      1E1F009F000000FF2000000000000000689240010000000000003C9340020000
      0004E0DB9BCC420300000004E0DB9BCC420400180000000D0006000000440048
      004C000F000600000046004F00420010000C0000004300720065006400690074
      00110000000000C087B540120000000000000000001300000000000000000014
      0000000000C087B540FEFEFF1E1F00A0000000FF200000000000000070924001
      00000000000030954002000000BC2CE69BCC4203000000BC2CE69BCC42040090
      0000000D00060000005500500053000F000C0000004E00650074002000330030
      0010000C0000004300720065006400690074001100000000000070AC40120000
      00000000000000130000000000000000001400000000000070AC40FEFEFF1E1F
      00A1000000FF20000000000000007C924001000000000000B3B1400200000074
      79F09BCC42030000007479F09BCC420400050000000D000A0000004600650064
      00450078000F000C0000004E0065007400200033003000100008000000430061
      00730068001100000000000084AC401200000000000000000013000000000000
      0000001400000000000084AC40FEFEFF1E1F00A2000000FF2000000000000000
      AC92400100000000000008B540020000004EFF359CCC42030000004EFF359CCC
      420400140000000D000E0000005500530020004D00610069006C000F000C0000
      004E00650074002000330030001000040000004D00430011000000000000BCBE
      40120000000000000000001300000000000000000014000000000000BCBE40FE
      FEFF1E1F00A3000000FF2000000000000000B092400100000000000064A24002
      000000AA253B9CCC4203000000AA253B9CCC420400090000000D000600000044
      0048004C000F000C0000004E00650074002000330030001000040000004D0043
      00110000000000005FB740120000000000000000001300000000000000000014
      0000000000005FB740FEFEFF1E1F00A4000000FF2000000000000000B4924001
      000000000000A49740020000006272459CCC42030000006272459CCC42040047
      0000000D00060000005500500053000F000C0000004E00650074002000330030
      001000040000004D004300110000000000004BBA401200000000000000000013
      000000000000000000140000000000004BBA40FEFEFF1E1F00A5000000FF2000
      000000000000B892400100000000000016A24002000000BE984A9CCC42030000
      00BE984A9CCC420400410000000D00060000005500500053000F000C0000004E
      006500740020003300300010000C000000430072006500640069007400110067
      6666669E99F14012000000000000000000130000000000000000001400666666
      669E99F140FEFEFF1E1F00A6000000FF2000000000000000BC92400100000000
      00002BB440020000001ABF4F9CCC42030000001ABF4F9CCC420400550000000D
      00060000005500500053000F000C0000004E006500740020003300300010000C
      0000004300720065006400690074001100000000000060864012000000000000
      0000001300000000000000000014000000000000608640FEFEFF1E1F00A70000
      00FF2000000000000000C0924001000000000000A0954002000000D20B5A9CCC
      4203000000D20B5A9CCC4204006B0000000D00060000005500500053000F0006
      00000046004F00420010000C0000004300720065006400690074001100000000
      00008C9C40120000000000000000001300000000000000000014000000000000
      8C9C40FEFEFF1E1F00A8000000FF2000000000000000C4924001000000000000
      50A7400200000056187E9CCC420300000056187E9CCC420400720000000D0006
      0000005500500053000F000600000046004F00420010000C0000004300720065
      006400690074001100000000000036BF40120000000000000000001300000000
      00000000001400000000000036BF40FEFEFF1E1F00A9000000FF200000000000
      0000C89240010000000000003C934002000000B23E839CCC4203000000B23E83
      9CCC420400910000000D00060000005500500053000F000600000046004F0042
      0010000C000000430072006500640069007400110000000000006DB040120000
      0000000000000013000000000000000000140000000000006DB040FEFEFF1E1F
      00AA000000FF2000000000000000D0924001000000000000DAA74002000000DA
      24A29CCC4203000000DA24A29CCC4204008D0000000D0006000000440048004C
      000F000600000046004F00420010000A00000043006800650063006B00110000
      000000E00BC44012000000000000000000130000000000000000001400000000
      00E00BC440FEFEFF1E1F00AB000000FF2000000000000000D492400100000000
      0000DCA7400200000064DEA99CCC420300000064DEA99CCC420400080000000D
      00060000005500500053000F000600000046004F004200100008000000560069
      007300610011009A999999197BAF401200000000000000000013000000000000
      00000014009A999999197BAF40FEFEFF1E1F00AC000000FF2000000000000000
      DC924001000000000000A09540020000002AF1DF9CCC42030000002AF1DF9CCC
      420400340000000D000E0000005500530020004D00610069006C000F00060000
      0046004F004200100008000000560069007300610011009A999999D94AC94012
      0000000000000000001300000000000000000014009A999999D94AC940FEFEFF
      1E1F00AD000000FF2000000000000000E4924001000000000000A49740020000
      005884E29CCC42030000005884E29CCC4204003D0000000D000E000000550053
      0020004D00610069006C000F000C0000004E0065007400200033003000100006
      00000043004F00440011009A999999F939D44012000000000000000000130000
      0000000000000014009A999999F939D440FEFEFF1E1F00AE000000FF20000000
      00000000F09240010000000000006C984002000000B4AAE79CCC4203000000B4
      AAE79CCC420400040000000D00060000005500500053000F000C0000004E0065
      00740020003300300010000C0000004300720065006400690074001100000000
      00800FAF40120000000000000000001300000000000000000014000000000080
      0FAF40FEFEFF1E1F00AF000000FF2000000000000000FC924001000000000000
      CC99400200000010D1EC9CCC420300000010D1EC9CCC420400220000000D000A
      00000045006D006500720079000F000600000046004F0042001000040000004D
      004300110099999999F938C04012000000000000000000130000000000000000
      0014009A999999F938C040FEFEFF1E1F00B0000000FF20000000000000000493
      4001000000000000009F40020000002444FC9CCC42030000002444FC9CCC4204
      000E0000000D0006000000440048004C000F000600000046004F00420010000A
      00000043006800650063006B0011009A9999995942E940120000000000000000
      001300000000000000000014009A9999995942E940FEFEFF1E1F00B1000000FF
      200000000000000014934001000000000000E6A0400200000052D7FE9CCC4203
      00000052D7FE9CCC420400020000000D00060000005500500053000F000C0000
      004E006500740020003300300010000C00000043007200650064006900740011
      00000000000066A0401200000000000000000013000000000000000000140000
      0000000066A040FEFEFF1E1F00B2000000FF2000000000000000889340010000
      00000000D8A74002000000806A019DCC4203000000806A019DCC4204003D0000
      000D00060000005500500053000F000600000046004F00420010000800000041
      006D0045007800110034333333030DE640120000000000000000001300000000
      0000000000140033333333030DE640FEFEFF1E1F00B3000000FF200000000000
      00009493400100000000000090954002000000DC90069DCC4203000000DC9006
      9DCC4204002E0000000D000A000000460065006400450078000F000C0000004E
      006500740020003300300010000C00000043007200650064006900740011009A
      999999D9A6B240120000000000000000001300000000000000000014009A9999
      99D9A6B240FEFEFF1E1F00B4000000FF20000000000000009C93400100000000
      00001C954002000000320A289DCC4203000000320A289DCC4204007F0000000D
      00060000005500500053000F000C0000004E006500740020003300300010000C
      000000430072006500640069007400110000000000784EEF4012000000000000
      00000013000000000000000000140000000000784EEF40FEFEFF1E1F00B50000
      00FF2000000000000000B0934001000000000000C2A74002000000609D2A9DCC
      4203000000609D2A9DCC4204006B0000000D000E0000005500530020004D0061
      0069006C000F000600000046004F00420010000A00000043006800650063006B
      00110033333333B323A440120000000000000000001300000000000000000014
      0033333333B323A440FEFEFF1E1F00B6000000FF2000000000000000B4934001
      0000000000006C9840020000008E302D9DCC42030000008E302D9DCC4204002D
      0000000D000E0000005500530020004D00610069006C000F000600000046004F
      00420010000C000000430072006500640069007400110000000000003C9F4012
      00000000000000000013000000000000000000140000000000003C9F40FEFEFF
      1E1F00B7000000FF2000000000000000BC934001000000000000DAA740020000
      0018EA349DCC420300000018EA349DCC4204002C0000000D000E000000550053
      0020004D00610069006C000F000600000046004F00420010000C000000430072
      0065006400690074001100343333335566034112000000000000000000130000
      0000000000000014003333333355660341FEFEFF1E1F00B8000000FF20000000
      00000000C893400100000000000030954002000000467D379DCC420300000046
      7D379DCC420400470000000D0006000000440048004C000F000C0000004E0065
      00740020003300300010000800000056006900730061001100000000000017BB
      4012000000000000000000130000000000000000001400000000000017BB40FE
      FEFF1E1F00B9000000FF2000000000000000D493400100000000000014934002
      00000074103A9DCC420300000074103A9DCC4204001C0000000D000600000055
      00500053000F000600000046004F00420010000C000000430072006500640069
      00740011000000000000E0954012000000000000000000130000000000000000
      0014000000000000E09540FEFEFF1E1F00BA000000FF2000000000000000DC93
      4001000000000000609840020000002C5D449DCC42030000002C5D449DCC4204
      00910000000D000A000000460065006400450078000F000C0000004E00650074
      0020003300300010000800000043006100730068001100000000000000734012
      0000000000000000001300000000000000000014000000000000007340FEFEFF
      1E1F00BB000000FF2000000000000000EC9340010000000000001C9540020000
      008883499DCC42030000008883499DCC420400140000000D0006000000550050
      0053000F000600000046004F0042001000040000004D004300110000000000E0
      8AD0401200000000000000000013000000000000000000140000000000E08AD0
      40FEFEFF1E1F00BC000000FF2000000000000000F89340010000000000003C93
      4002000000B6164C9DCC4203000000B6164C9DCC420400470000000D00060000
      00440048004C000F000600000046004F00420010000C00000043007200650064
      00690074001100000000000098C6401200000000000000000013000000000000
      0000001400000000000098C640FEFEFF1E1F00BD000000FF2000000000000000
      009440010000000000003095400200000040D0539DCC420300000040D0539DCC
      420400760000000D00060000005500500053000F000C0000004E006500740020
      003300300010000C000000430072006500640069007400110000000000C0DDB0
      401200000000000000000013000000000000000000140000000000C0DDB040FE
      FEFF1E1F00BE000000FF20000000000000000C9440010000000000006C984002
      000000F81C5E9DCC4203000000F81C5E9DCC420400710000000D000A00000046
      0065006400450078000F000C0000004E00650074002000330030001000080000
      00430061007300680011000000000000DEBB4012000000000000000000130000
      0000000000000014000000000000DEBB40FEFEFF1E1F00BF000000FF20000000
      0000000030944001000000000000289540020000005443639DCC420300000054
      43639DCC420400880000000D000A000000460065006400450078000F000C0000
      004E006500740020003300300010000800000056006900730061001100666666
      66E632BF401200000000000000000013000000000000000000140066666666E6
      32BF40FEFEFF1E1F00C0000000FF200000000000000038944001000000000000
      009F4002000000DEFC6A9DCC4203000000DEFC6A9DCC420400550000000D000A
      000000460065006400450078000F000600000046004F0042001000040000004D
      004300110033333333B3D1A94012000000000000000000130000000000000000
      00140033333333B3D1A940FEFEFF1E1F00C1000000FF20000000000000003C94
      4001000000000000D8A040020000003A23709DCC42030000003A23709DCC4204
      002D0000000D000E0000005500530020004D00610069006C000F000C0000004E
      00650074002000330030001000040000004D004300110000000000407FD14012
      00000000000000000013000000000000000000140000000000407FD140FEFEFF
      1E1F00C2000000FF20000000000000004094400100000000000024B540020000
      009649759DCC42030000009649759DCC420400220000000D0006000000440048
      004C000F000C0000004E00650074002000330030001000040000004D00430011
      009A99999959FFBC40120000000000000000001300000000000000000014009A
      99999959FFBC40FEFEFF1E1F00C3000000FF2000000000000000489440010000
      0000000016A24002000000C4DC779DCC4203000000C4DC779DCC4204000B0000
      000D00060000005500500053000F000C0000004E006500740020003300300010
      000C0000004300720065006400690074001100000000008054C3401200000000
      0000000000130000000000000000001400000000008054C340FEFEFF1E1F00C4
      000000FF200000000000000050944001000000000000A0954002000000F26F7A
      9DCC4203000000F26F7A9DCC4204001C0000000D00060000005500500053000F
      000600000046004F00420010000C000000430072006500640069007400110000
      00000028BFE94012000000000000000000130000000000000000001400000000
      0028BFE940FEFEFF1E1F00C5000000FF20000000000000005894400100000000
      00003C93400200000006E3899DCC420300000006E3899DCC420400340000000D
      00060000005500500053000F000600000046004F00420010000C000000430072
      00650064006900740011000000000040E9D74012000000000000000000130000
      0000000000000014000000000040E9D740FEFEFF1E1F00C6000000FF20000000
      000000006494400100000000000030954002000000BE2F949DCC4203000000BE
      2F949DCC420400410000000D00060000005500500053000F000600000046004F
      004200100008000000560069007300610011000000000000F2A7401200000000
      00000000001300000000000000000014000000000000F2A740FEFEFF1E1F00C7
      000000FF2000000000000000749440010000000000003EAC40020000001A5699
      9DCC42030000001A56999DCC4204005E0000000D000E0000005500530020004D
      00610069006C000F000C0000004E006500740020003300300010000600000043
      004F00440011000000000000107D401200000000000000000013000000000000
      00000014000000000000107D40FEFEFF1E1F00C8000000FF2000000000000000
      8C944001000000000000CC994002000000D2A2A39DCC4203000000D2A2A39DCC
      420400790000000D000A00000045006D006500720079000F000600000046004F
      0042001000040000004D00430011009A99999919ADB340120000000000000000
      001300000000000000000014009A99999919ADB340FEFEFF1E1F00C9000000FF
      200000000000000094944001000000000000009F4002000000E615B39DCC4203
      000000E615B39DCC4204008A0000000D0006000000440048004C000F00060000
      0046004F00420010000A00000043006800650063006B001100000000000094BD
      4012000000000000000000130000000000000000001400000000000094BD40FE
      FEFF1E1F00CA000000FF200000000000000018954001000000000000D8A74002
      00000014A9B59DCC420300000014A9B59DCC420400470000000D000600000055
      00500053000F000600000046004F00420010000800000041006D004500780011
      00CDCCCCCCCC75C14012000000000000000000130000000000000000001400CD
      CCCCCCCC75C140FEFEFF1E1F00CB000000FF20000000000000002C9540010000
      00000000DAA740020000009E62BD9DCC42030000009E62BD9DCC4204008D0000
      000D00060000005500500053000F000C0000004E006500740020003300300010
      000C000000430072006500640069007400110000000000002ACB401200000000
      000000000013000000000000000000140000000000002ACB40FEFEFF1E1F00CC
      000000FF2000000000000000109D40010000000000003EAC400200000006A866
      A1CC420400090000000D00060000005500500053000F000C0000006E00650074
      0020003300300010000A00000043006800650063006B00110000000000004050
      40120000000000000000001300000000000000000014000000000000000000FE
      FEFEFEFEFF21FEFF222300CD000000FF24FEFEFE0E004D0061006E0061006700
      650072001E005500700064006100740065007300520065006700690073007400
      7200790012005400610062006C0065004C006900730074000A00540061006200
      6C00650008004E0061006D006500140053006F0075007200630065004E006100
      6D0065000A0054006100620049004400240045006E0066006F00720063006500
      43006F006E00730074007200610069006E00740073001E004D0069006E006900
      6D0075006D004300610070006100630069007400790018004300680065006300
      6B004E006F0074004E0075006C006C00140043006F006C0075006D006E004C00
      6900730074000C0043006F006C0075006D006E00100053006F00750072006300
      65004900440010006400740044006F00750062006C0065001000440061007400
      610054007900700065001400530065006100720063006800610062006C006500
      120041006C006C006F0077004E0075006C006C00080042006100730065001400
      4F0041006C006C006F0077004E0075006C006C0012004F0049006E0055007000
      640061007400650010004F0049006E00570068006500720065001A004F007200
      6900670069006E0043006F006C004E0061006D00650014006400740044006100
      74006500540069006D0065000E006400740049006E0074003300320018006400
      7400570069006400650053007400720069006E0067000800530069007A006500
      140053006F007500720063006500530069007A0065001C0043006F006E007300
      74007200610069006E0074004C00690073007400100056006900650077004C00
      6900730074000E0052006F0077004C00690073007400060052006F0077000A00
      52006F0077004900440010004F0072006900670069006E0061006C0018005200
      65006C006100740069006F006E004C006900730074001C005500700064006100
      7400650073004A006F00750072006E0061006C00120053006100760065005000
      6F0069006E0074000E004300680061006E00670065007300}
  end
  object memItems: TFDMemTable
    Active = True
    IndexFieldNames = 'OrderNo'
    MasterSource = dtsOrders
    MasterFields = 'OrderNo'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 472
    Top = 288
    Content = {
      414442530F00313738D80000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B04000E0000
      004F0072006400650072004E006F0005000E0000004F0072006400650072004E
      006F000C00010000000E000D000F000110000111000112000113000114000115
      000E0000004F0072006400650072004E006F00FEFF0B04000C00000049007400
      65006D004E006F0005000C0000004900740065006D004E006F000C0002000000
      0E000D000F000110000111000112000113000114000115000C00000049007400
      65006D004E006F00FEFF0B04000C00000050006100720074004E006F0005000C
      00000050006100720074004E006F000C00030000000E000D000F000110000111
      000112000113000114000115000C00000050006100720074004E006F00FEFF0B
      0400060000005100740079000500060000005100740079000C00040000000E00
      16000F0001100001110001120001130001140001150006000000510074007900
      FEFF0B04001000000044006900730063006F0075006E00740005001000000044
      006900730063006F0075006E0074000C00050000000E000D000F000110000111
      000112000113000114000115001000000044006900730063006F0075006E0074
      00FEFEFF17FEFF18FEFF19FF1A1B0000000000FF1C00000000000000588F4001
      00000000000000F03F0200000000000084944003000500000004000000000000
      000000FEFEFF1A1B0001000000FF1C00000000000000608F4001000000000000
      00F03F0200000000000084944003000A00000004000000000000004940FEFEFF
      1A1B0002000000FF1C00000000000000608F4001000000000000000040020000
      000000000BC84003000A00000004000000000000000000FEFEFF1A1B00030000
      00FF1C00000000000000608F400100000000000000084002000000000000E8A9
      4003000800000004000000000000000000FEFEFF1A1B0004000000FF1C000000
      00000000608F400100000000000000104002000000000000CCB4400300050000
      0004000000000000000000FEFEFF1A1B0005000000FF1C00000000000000688F
      400100000000000000F03F02000000000000A094400300010000000400000000
      0000000000FEFEFF1A1B0006000000FF1C00000000000000688F400100000000
      0000000040020000000000007EA24003000200000004000000000000000000FE
      FEFF1A1B0007000000FF1C00000000000000688F400100000000000000084002
      00000000000096C64003000500000004000000000000000000FEFEFF1A1B0008
      000000FF1C00000000000000688F400100000000000000104002000000000000
      BCBD4003000900000004000000000000000000FEFEFF1A1B0009000000FF1C00
      000000000000688F400100000000000000144002000000000000689E40030004
      00000004000000000000000000FEFEFF1A1B000A000000FF1C00000000000000
      708F400100000000000000F03F02000000000000208C4003000A000000040000
      00000000000000FEFEFF1A1B000B000000FF1C00000000000000708F40010000
      000000000000400200000000000084944003000A000000040000000000000000
      00FEFEFF1A1B000C000000FF1C00000000000000708F40010000000000000008
      4002000000000000B8954003000200000004000000000000000000FEFEFF1A1B
      000D000000FF1C00000000000000708F40010000000000000010400200000000
      000096C64003000200000004000000000000000000FEFEFF1A1B000E000000FF
      1C00000000000000708F40010000000000000014400200000000008006C84003
      000100000004000000000000000000FEFEFF1A1B000F000000FF1C0000000000
      0000788F400100000000000000F03F0200000000000090944003000A00000004
      000000000000000000FEFEFF1A1B0010000000FF1C00000000000000788F4001
      00000000000000004002000000000000689E4003000A00000004000000000000
      000000FEFEFF1A1B0011000000FF1C00000000000000808F4001000000000000
      00F03F0200000000000084944003000100000004000000000000000000FEFEFF
      1A1B0012000000FF1C00000000000000808F4001000000000000000040020000
      00000080B9C64003000A00000004000000000000000000FEFEFF1A1B00130000
      00FF1C00000000000000888F400100000000000000F03F02000000000000A094
      4003000700000004000000000000000000FEFEFF1A1B0014000000FF1C000000
      00000000888F400100000000000000004002000000000000C094400300040000
      0004000000000000000000FEFEFF1A1B0015000000FF1C00000000000000888F
      4001000000000000000840020000000000005095400300060000000400000000
      0000000000FEFEFF1A1B0016000000FF1C00000000000000888F400100000000
      00000010400200000000000009C84003000300000004000000000000000000FE
      FEFF1A1B0017000000FF1C00000000000000908F400100000000000000F03F02
      000000000000F3C54003000200000004000000000000000000FEFEFF1A1B0018
      000000FF1C00000000000000988F400100000000000000F03F02000000000000
      0AB54003001400000004000000000000000000FEFEFF1A1B0019000000FF1C00
      000000000000988F400100000000000000004002000000000000C2C640030003
      00000004000000000000000000FEFEFF1A1B001A000000FF1C00000000000000
      A08F400100000000000000F03F020000000000005CA240030005000000040000
      00000000000000FEFEFF1A1B001B000000FF1C00000000000000A08F40010000
      00000000000040020000000000007EA240030003000000040000000000000000
      00FEFEFF1A1B001C000000FF1C00000000000000A08F40010000000000000008
      400200000000000009C84003000E00000004000000000000000000FEFEFF1A1B
      001D000000FF1C00000000000000A88F400100000000000000F03F0200000000
      00004AA24003000600000004000000000000000000FEFEFF1A1B001E000000FF
      1C00000000000000A88F40010000000000000000400200000000000002B54003
      001900000004000000000000000000FEFEFF1A1B001F000000FF1C0000000000
      0000B08F400100000000000000F03F02000000000000BCBD4003000300000004
      000000000000000000FEFEFF1A1B0020000000FF1C00000000000000B88F4001
      00000000000000F03F02000000000000808C4003000200000004000000000000
      000000FEFEFF1A1B0021000000FF1C00000000000000B88F4001000000000000
      00004002000000000000C8944003002D00000004000000000000000000FEFEFF
      1A1B0022000000FF1C00000000000000B88F4001000000000000000840020000
      000000007EA24003002D00000004000000000000000000FEFEFF1A1B00230000
      00FF1C00000000000000B88F400100000000000000104002000000000000BCBD
      4003004100000004000000000000000000FEFEFF1A1B0024000000FF1C000000
      00000000C08F400100000000000000F03F0200000000000084944003000A0000
      0004000000000000000000FEFEFF1A1B0025000000FF1C00000000000000C08F
      4001000000000000000040020000000000004AA2400300010000000400000000
      0000000000FEFEFF1A1B0026000000FF1C00000000000000C88F400100000000
      000000F03F02000000000000089F4003002D00000004000000000000000000FE
      FEFF1A1B0027000000FF1C00000000000000C88F400100000000000000004002
      00000000000014A24003000300000004000000000000000000FEFEFF1A1B0028
      000000FF1C00000000000000C88F400100000000000000084002000000000000
      4AA24003000400000004000000000000000000FEFEFF1A1B0029000000FF1C00
      000000000000C88F4001000000000000001040020000000000005CA240030005
      00000004000000000000000000FEFEFF1A1B002A000000FF1C00000000000000
      D08F400100000000000000F03F02000000000000689E40030010000000040000
      00000000000000FEFEFF1A1B002B000000FF1C00000000000000D08F40010000
      00000000000040020000000000007EA240030006000000040000000000000000
      00FEFEFF1A1B002C000000FF1C00000000000000D88F400100000000000000F0
      3F020000000000007EA24003000400000004000000000000000000FEFEFF1A1B
      002D000000FF1C00000000000000D88F40010000000000000000400200000000
      0000C3BD4003007800000004000000000000000000FEFEFF1A1B002E000000FF
      1C00000000000000E08F400100000000000000F03F02000000000000208C4003
      000400000004000000000000000000FEFEFF1A1B002F000000FF1C0000000000
      0000E08F40010000000000000000400200000000000045C24003000500000004
      000000000000000000FEFEFF1A1B0030000000FF1C00000000000000E88F4001
      00000000000000F03F02000000000000C1B44003000700000004000000000000
      000000FEFEFF1A1B0031000000FF1C00000000000000E88F4001000000000000
      0000400200000000008007C84003000100000004000000000000000000FEFEFF
      1A1B0032000000FF1C00000000000000E88F4001000000000000000840020000
      000000800EC84003000300000004000000000000000000FEFEFF1A1B00330000
      00FF1C00000000000000F08F400100000000000000F03F02000000000000C6B4
      4003000700000004000000000000000000FEFEFF1A1B0034000000FF1C000000
      00000000F08F40010000000000000000400200000000000030C2400300360000
      0004000000000000000000FEFEFF1A1B0035000000FF1C00000000000000F88F
      400100000000000000F03F020000000000008494400300050000000400000000
      0000000000FEFEFF1A1B0036000000FF1C00000000000000F88F400100000000
      0000000040020000000000009EA24003000400000004000000000000000000FE
      FEFF1A1B0037000000FF1C00000000000000F88F400100000000000000084002
      000000000000C8944003000A00000004000000000000000000FEFEFF1A1B0038
      000000FF1C000000000000000090400100000000000000F03F02000000000000
      208C4003000300000004000000000000000000FEFEFF1A1B0039000000FF1C00
      00000000000000904001000000000000000040020000000000007EA240030006
      00000004000000000000000000FEFEFF1A1B003A000000FF1C00000000000000
      0490400100000000000000F03F02000000000000A09440030004000000040000
      00000000000000FEFEFF1A1B003B000000FF1C00000000000000049040010000
      0000000000004002000000000000C1B440030006000000040000000000000000
      00FEFEFF1A1B003C000000FF1C000000000000000890400100000000000000F0
      3F02000000000000B8954003000200000004000000000000000000FEFEFF1A1B
      003D000000FF1C00000000000000089040010000000000000000400200000000
      0000E8A94003000600000004000000000000000000FEFEFF1A1B003E000000FF
      1C000000000000000C90400100000000000000F03F02000000000000208C4003
      000800000004000000000000000000FEFEFF1A1B003F000000FF1C0000000000
      00000C90400100000000000000004002000000000000B8954003002D00000004
      000000000000000000FEFEFF1A1B0040000000FF1C0000000000000010904001
      00000000000000F03F020000000000005CA24003000400000004000000000000
      000000FEFEFF1A1B0041000000FF1C0000000000000010904001000000000000
      00004002000000000000C6B44003000400000004000000000000000000FEFEFF
      1A1B0042000000FF1C000000000000001490400100000000000000F03F020000
      00000000C0944003002E00000004000000000000000000FEFEFF1A1B00430000
      00FF1C000000000000001490400100000000000000004002000000000000C1B4
      4003000800000004000000000000000000FEFEFF1A1B0044000000FF1C000000
      000000001890400100000000000000F03F0200000000000076A4400300040000
      0004000000000000000000FEFEFF1A1B0045000000FF1C000000000000001890
      400100000000000000004002000000000080B9C6400300040000000400000000
      0000000000FEFEFF1A1B0046000000FF1C000000000000001C90400100000000
      000000F03F02000000000000FCA94003000300000004000000000000000000FE
      FEFF1A1B0047000000FF1C000000000000001C90400100000000000000004002
      000000000080EAC54003000500000004000000000000000000FEFEFF1A1B0048
      000000FF1C000000000000002090400100000000000000F03F02000000000000
      E5B44003000700000004000000000000000000FEFEFF1A1B0049000000FF1C00
      00000000000020904001000000000000000040020000000000000AB540030004
      00000004000000000000000000FEFEFF1A1B004A000000FF1C00000000000000
      2490400100000000000000F03F020000000000006AA440030006000000040000
      00000000000000FEFEFF1A1B004B000000FF1C00000000000000249040010000
      0000000000004002000000000000C1B440030004000000040000000000000000
      00FEFEFF1A1B004C000000FF1C000000000000002890400100000000000000F0
      3F02000000000000208C4003000800000004000000000000000000FEFEFF1A1B
      004D000000FF1C00000000000000289040010000000000000000400200000000
      00008CA44003003600000004000000000000000000FEFEFF1A1B004E000000FF
      1C000000000000002C90400100000000000000F03F020000000000000AB54003
      000700000004000000000000000000FEFEFF1A1B004F000000FF1C0000000000
      00003090400100000000000000F03F020000000000004AA24003000200000004
      000000000000000000FEFEFF1A1B0050000000FF1C0000000000000030904001
      0000000000000000400200000000000014A74003000600000004000000000000
      000000FEFEFF1A1B0051000000FF1C0000000000000034904001000000000000
      00F03F02000000000000E8A94003000600000004000000000000000000FEFEFF
      1A1B0052000000FF1C0000000000000034904001000000000000000040020000
      0000000030C24003000300000004000000000000000000FEFEFF1A1B00530000
      00FF1C000000000000003890400100000000000000F03F02000000000000089F
      4003003600000004000000000000000000FEFEFF1A1B0054000000FF1C000000
      000000003C90400100000000000000F03F02000000000000689E400300010000
      0004000000000000000000FEFEFF1A1B0055000000FF1C000000000000003C90
      400100000000000000004002000000000000C6B4400300040000000400000000
      0000000000FEFEFF1A1B0056000000FF1C000000000000004090400100000000
      000000F03F0200000000000090A44003001700000004000000000000000000FE
      FEFF1A1B0057000000FF1C000000000000004090400100000000000000004002
      000000000000CCB44003000500000004000000000000000000FEFEFF1A1B0058
      000000FF1C000000000000004490400100000000000000F03F02000000000000
      4EA24003002000000004000000000000000000FEFEFF1A1B0059000000FF1C00
      0000000000004490400100000000000000004002000000000000C1B440030007
      00000004000000000000000000FEFEFF1A1B005A000000FF1C00000000000000
      4890400100000000000000F03F02000000000000C2A44003000E000000040000
      00000000000000FEFEFF1A1B005B000000FF1C00000000000000489040010000
      0000000000004002000000000080B9C640030006000000040000000000000000
      00FEFEFF1A1B005C000000FF1C000000000000004C90400100000000000000F0
      3F02000000000000208C4003000400000004000000000000000000FEFEFF1A1B
      005D000000FF1C000000000000004C9040010000000000000000400200000000
      00004AA24003002300000004000000000000000000FEFEFF1A1B005E000000FF
      1C000000000000005090400100000000000000F03F02000000000000C1B44003
      000200000004000000000000000000FEFEFF1A1B005F000000FF1C0000000000
      000050904001000000000000000040020000000000007FC64003002000000004
      000000000000000000FEFEFF1A1B0060000000FF1C0000000000000054904001
      00000000000000F03F0200000000000074AA4003000200000004000000000000
      000000FEFEFF1A1B0061000000FF1C0000000000000054904001000000000000
      00004002000000000000C6B44003000400000004000000000000000000FEFEFF
      1A1B0062000000FF1C000000000000005890400100000000000000F03F020000
      00000000C1B44003000700000004000000000000000000FEFEFF1A1B00630000
      00FF1C000000000000005890400100000000000000004002000000000080B9C6
      4003000400000004000000000000000000FEFEFF1A1B0064000000FF1C000000
      000000005C90400100000000000000F03F02000000000000208C400300070000
      0004000000000000000000FEFEFF1A1B0065000000FF1C000000000000006090
      400100000000000000F03F02000000000000E8A9400300050000000400000000
      0000000000FEFEFF1A1B0066000000FF1C000000000000006090400100000000
      0000000040020000000000000EC84003000400000004000000000000000000FE
      FEFF1A1B0067000000FF1C000000000000006490400100000000000000F03F02
      00000000000014A74003000200000004000000000000000000FEFEFF1A1B0068
      000000FF1C000000000000006490400100000000000000004002000000000000
      C3BD4003000300000004000000000000000000FEFEFF1A1B0069000000FF1C00
      0000000000006890400100000000000000F03F0200000000000018AA40030001
      00000004000000000000000000FEFEFF1A1B006A000000FF1C00000000000000
      6890400100000000000000004002000000000000C6B440030023000000040000
      00000000000000FEFEFF1A1B006B000000FF1C00000000000000689040010000
      000000000008400200000000000002B54003002A000000040000000000000000
      00FEFEFF1A1B006C000000FF1C00000000000000689040010000000000000010
      4002000000000080B9C64003000800000004000000000000000000FEFEFF1A1B
      006D000000FF1C000000000000006C90400100000000000000F03F0200000000
      0000E5B44003000500000004000000000000000000FEFEFF1A1B006E000000FF
      1C000000000000007090400100000000000000F03F02000000000000C1B44003
      000500000004000000000000000000FEFEFF1A1B006F000000FF1C0000000000
      00007090400100000000000000004002000000000080EAC54003000700000004
      000000000000000000FEFEFF1A1B0070000000FF1C0000000000000074904001
      00000000000000F03F02000000000000ECB44003000600000004000000000000
      000000FEFEFF1A1B0071000000FF1C0000000000000074904001000000000000
      00004002000000000000CCB44003003800000004000000000000000000FEFEFF
      1A1B0072000000FF1C0000000000000074904001000000000000000840020000
      00000000F3C54003000800000004000000000000000000FEFEFF1A1B00730000
      00FF1C000000000000007890400100000000000000F03F020000000000007FC6
      4003000500000004000000000000000000FEFEFF1A1B0074000000FF1C000000
      00000000789040010000000000000000400200000000008006C8400300070000
      0004000000000000000000FEFEFF1A1B0075000000FF1C000000000000007C90
      400100000000000000F03F020000000000007EA2400300080000000400000000
      0000000000FEFEFF1A1B0076000000FF1C000000000000007C90400100000000
      00000000400200000000000014A74003000700000004000000000000000000FE
      FEFF1A1B0077000000FF1C000000000000007C90400100000000000000084002
      00000000000031C84003000700000004000000000000000000FEFEFF1A1B0078
      000000FF1C000000000000007C90400100000000000000104002000000000080
      74CA4003000500000004000000000000000000FEFEFF1A1B0079000000FF1C00
      0000000000008090400100000000000000F03F02000000000000C6B440030006
      00000004000000000000000000FEFEFF1A1B007A000000FF1C00000000000000
      8090400100000000000000004002000000000080EAC540030008000000040000
      00000000000000FEFEFF1A1B007B000000FF1C00000000000000849040010000
      0000000000F03F0200000000000018AA40030005000000040000000000000000
      00FEFEFF1A1B007C000000FF1C000000000000008890400100000000000000F0
      3F02000000000000C1B44003000600000004000000000000000000FEFEFF1A1B
      007D000000FF1C00000000000000889040010000000000000000400200000000
      0000F3C54003000500000004000000000000000000FEFEFF1A1B007E000000FF
      1C000000000000008C90400100000000000000F03F02000000000000E8A94003
      000500000004000000000000000000FEFEFF1A1B007F000000FF1C0000000000
      00009090400100000000000000F03F02000000000000CCB44003002D00000004
      000000000000000000FEFEFF1A1B0080000000FF1C0000000000000090904001
      00000000000000004002000000000000E5B44003000800000004000000000000
      000000FEFEFF1A1B0081000000FF1C0000000000000090904001000000000000
      000840020000000000007FC64003000500000004000000000000000000FEFEFF
      1A1B0082000000FF1C0000000000000090904001000000000000001040020000
      0000008006C84003000500000004000000000000000000FEFEFF1A1B00830000
      00FF1C000000000000009490400100000000000000F03F0200000000000014A7
      4003000800000004000000000000000000FEFEFF1A1B0084000000FF1C000000
      00000000949040010000000000000000400200000000000074AA4003002D0000
      0004000000000000000000FEFEFF1A1B0085000000FF1C000000000000009490
      400100000000000000084002000000000080B9C6400300360000000400000000
      0000000000FEFEFF1A1B0086000000FF1C000000000000009890400100000000
      000000F03F0200000000000014A74003000700000004000000000000000000FE
      FEFF1A1B0087000000FF1C000000000000009890400100000000000000004002
      00000000008074CA4003000600000004000000000000000000FEFEFF1A1B0088
      000000FF1C000000000000009C90400100000000000000F03F02000000000000
      C1B44003000F00000004000000000000000000FEFEFF1A1B0089000000FF1C00
      0000000000009C90400100000000000000004002000000000000C6B44003000E
      00000004000000000000000000FEFEFF1A1B008A000000FF1C00000000000000
      9C90400100000000000000084002000000000080EAC540030017000000040000
      00000000000000FEFEFF1A1B008B000000FF1C000000000000009C9040010000
      000000000010400200000000000031C840030006000000040000000000000000
      00FEFEFF1A1B008C000000FF1C00000000000000A090400100000000000000F0
      3F0200000000000018AA4003000100000004000000000000000000FEFEFF1A1B
      008D000000FF1C00000000000000A490400100000000000000F03F0200000000
      0000CCB44003000800000004000000000000000000FEFEFF1A1B008E000000FF
      1C00000000000000A490400100000000000000004002000000000000F3C54003
      000700000004000000000000000000FEFEFF1A1B008F000000FF1C0000000000
      0000A890400100000000000000F03F020000000000007EA24003000400000004
      000000000000000000FEFEFF1A1B0090000000FF1C00000000000000A8904001
      0000000000000000400200000000000074AA4003000800000004000000000000
      000000FEFEFF1A1B0091000000FF1C00000000000000A8904001000000000000
      0008400200000000008006C84003000600000004000000000000000000FEFEFF
      1A1B0092000000FF1C00000000000000A8904001000000000000001040020000
      0000008074CA4003000600000004000000000000000000FEFEFF1A1B00930000
      00FF1C00000000000000AC90400100000000000000F03F020000000000800EC8
      4003000500000004000000000000000000FEFEFF1A1B0094000000FF1C000000
      00000000B090400100000000000000F03F0200000000000014A74003002B0000
      0004000000000000000000FEFEFF1A1B0095000000FF1C00000000000000B090
      4001000000000000000040020000000000000EC8400300030000000400000000
      0000000000FEFEFF1A1B0096000000FF1C00000000000000B490400100000000
      000000F03F02000000000000E8A94003000300000004000000000000000000FE
      FEFF1A1B0097000000FF1C00000000000000B490400100000000000000004002
      000000000000C6B44003000500000004000000000000000000FEFEFF1A1B0098
      000000FF1C00000000000000B490400100000000000000084002000000000000
      CCB44003002200000004000000000000000000FEFEFF1A1B0099000000FF1C00
      000000000000B490400100000000000000104002000000000000E5B440030057
      00000004000000000000000000FEFEFF1A1B009A000000FF1C00000000000000
      B4904001000000000000001440020000000000007FC640030009000000040000
      00000000000000FEFEFF1A1B009B000000FF1C00000000000000B49040010000
      0000000000184002000000000080B9C640030006000000040000000000000000
      00FEFEFF1A1B009C000000FF1C00000000000000B4904001000000000000001C
      40020000000000000EC84003000500000004000000000000000000FEFEFF1A1B
      009D000000FF1C00000000000000B890400100000000000000F03F0200000000
      000018AA4003000600000004000000000000000000FEFEFF1A1B009E000000FF
      1C00000000000000B890400100000000000000004002000000000000F3C54003
      000800000004000000000000000000FEFEFF1A1B009F000000FF1C0000000000
      0000BC90400100000000000000F03F0200000000000074AA4003000700000004
      000000000000000000FEFEFF1A1B00A0000000FF1C00000000000000BC904001
      0000000000000000400200000000008006C84003000400000004000000000000
      000000FEFEFF1A1B00A1000000FF1C00000000000000BC904001000000000000
      0008400200000000008074CA4003002B00000004000000000000000000FEFEFF
      1A1B00A2000000FF1C00000000000000C090400100000000000000F03F020000
      000000800EC84003000400000004000000000000000000FEFEFF1A1B00A30000
      00FF1C00000000000000C490400100000000000000F03F0200000000000014A7
      4003000800000004000000000000000000FEFEFF1A1B00A4000000FF1C000000
      00000000C490400100000000000000004002000000000080EAC5400300060000
      0004000000000000000000FEFEFF1A1B00A5000000FF1C00000000000000C890
      400100000000000000F03F020000000000000BC8400300050000000400000000
      0000000000FEFEFF1A1B00A6000000FF1C00000000000000CC90400100000000
      000000F03F02000000000000CCB44003000600000004000000000000000000FE
      FEFF1A1B00A7000000FF1C00000000000000CC90400100000000000000004002
      000000000000E5B44003000800000004000000000000000000FEFEFF1A1B00A8
      000000FF1C00000000000000CC90400100000000000000084002000000000000
      0EC84003000600000004000000000000000000FEFEFF1A1B00A9000000FF1C00
      000000000000D090400100000000000000F03F02000000000080EAC540030004
      00000004000000000000000000FEFEFF1A1B00AA000000FF1C00000000000000
      D0904001000000000000000040020000000000007FC640030004000000040000
      00000000000000FEFEFF1A1B00AB000000FF1C00000000000000D09040010000
      0000000000084002000000000000689E40030001000000040000000000000000
      00FEFEFF1A1B00AC000000FF1C00000000000000D490400100000000000000F0
      3F020000000000007EA24003000300000004000000000000000000FEFEFF1A1B
      00AD000000FF1C00000000000000D890400100000000000000F03F0200000000
      000014A74003002200000004000000000000000000FEFEFF1A1B00AE000000FF
      1C00000000000000D89040010000000000000000400200000000000018AA4003
      003600000004000000000000000000FEFEFF1A1B00AF000000FF1C0000000000
      0000D89040010000000000000008400200000000000074AA4003004100000004
      000000000000000000FEFEFF1A1B00B0000000FF1C00000000000000D8904001
      00000000000000104002000000000000F3C54003000700000004000000000000
      000000FEFEFF1A1B00B1000000FF1C00000000000000DC904001000000000000
      00F03F02000000000080B9C64003001400000004000000000000000000FEFEFF
      1A1B00B2000000FF1C00000000000000DC904001000000000000000040020000
      0000000090944003000600000004000000000000000000FEFEFF1A1B00B30000
      00FF1C00000000000000E090400100000000000000F03F02000000000000E8A9
      4003000500000004000000000000000000FEFEFF1A1B00B4000000FF1C000000
      00000000E09040010000000000000000400200000000008006C8400300010000
      0004000000000000000000FEFEFF1A1B00B5000000FF1C00000000000000E090
      40010000000000000008400200000000008074CA400300030000000400000000
      0000000000FEFEFF1A1B00B6000000FF1C00000000000000E490400100000000
      000000F03F020000000000800EC84003002200000004000000000000000000FE
      FEFF1A1B00B7000000FF1C00000000000000E890400100000000000000F03F02
      00000000000076A44003004700000004000000000000000000FEFEFF1A1B00B8
      000000FF1C00000000000000EC90400100000000000000F03F02000000000000
      76A44003000400000004000000000000000000FEFEFF1A1B00B9000000FF1C00
      000000000000EC9040010000000000000000400200000000000014A740030006
      00000004000000000000000000FEFEFF1A1B00BA000000FF1C00000000000000
      EC9040010000000000000008400200000000000074AA40030005000000040000
      00000000000000FEFEFF1A1B00BB000000FF1C00000000000000EC9040010000
      0000000000104002000000000000E5B440030059000000040000000000000000
      00FEFEFF1A1B00BC000000FF1C00000000000000F090400100000000000000F0
      3F0200000000000018AA4003000300000004000000000000000000FEFEFF1A1B
      00BD000000FF1C00000000000000F890400100000000000000F03F0200000000
      00007EA24003000100000004000000000000000000FEFEFF1A1B00BE000000FF
      1C00000000000000F8904001000000000000000040020000000000007FC64003
      000700000004000000000000000000FEFEFF1A1B00BF000000FF1C0000000000
      0000FC90400100000000000000F03F0200000000000076A44003000300000004
      000000000000000000FEFEFF1A1B00C0000000FF1C00000000000000FC904001
      00000000000000004002000000000000CCB44003000600000004000000000000
      000000FEFEFF1A1B00C1000000FF1C0000000000000004914001000000000000
      00F03F020000000000007EA24003000400000004000000000000000000FEFEFF
      1A1B00C2000000FF1C0000000000000004914001000000000000000040020000
      00000000F3C54003000100000004000000000000000000FEFEFF1A1B00C30000
      00FF1C000000000000000891400100000000000000F03F0200000000000074AA
      4003000500000004000000000000000000FEFEFF1A1B00C4000000FF1C000000
      000000000891400100000000000000004002000000000080EAC5400300030000
      0004000000000000000000FEFEFF1A1B00C5000000FF1C000000000000000C91
      400100000000000000F03F0200000000000014A7400300030000000400000000
      0000000000FEFEFF1A1B00C6000000FF1C000000000000001091400100000000
      000000F03F02000000000000E8A94003003700000004000000000000000000FE
      FEFF1A1B00C7000000FF1C000000000000001091400100000000000000004002
      00000000000018AA4003000200000004000000000000000000FEFEFF1A1B00C8
      000000FF1C000000000000001091400100000000000000084002000000000000
      C6B44003000500000004000000000000000000FEFEFF1A1B00C9000000FF1C00
      000000000000109140010000000000000010400200000000000009C84003001A
      00000004000000000000000000FEFEFF1A1B00CA000000FF1C00000000000000
      1491400100000000000000F03F02000000000080B9C640030004000000040000
      00000000000000FEFEFF1A1B00CB000000FF1C00000000000000189140010000
      0000000000F03F0200000000000076A440030005000000040000000000000000
      00FEFEFF1A1B00CC000000FF1C00000000000000189140010000000000000000
      4002000000000000CCB44003000300000004000000000000000000FEFEFF1A1B
      00CD000000FF1C00000000000000189140010000000000000008400200000000
      0000E5B44003000300000004000000000000000000FEFEFF1A1B00CE000000FF
      1C000000000000001891400100000000000000104002000000000000F3C54003
      000100000004000000000000000000FEFEFF1A1B00CF000000FF1C0000000000
      0000189140010000000000000014400200000000008006C84003000200000004
      000000000000000000FEFEFF1A1B00D0000000FF1C000000000000001C914001
      00000000000000F03F0200000000000014A74003000700000004000000000000
      000000FEFEFF1A1B00D1000000FF1C000000000000001C914001000000000000
      00004002000000000000C6B44003000500000004000000000000000000FEFEFF
      1A1B00D2000000FF1C000000000000001C914001000000000000000840020000
      000000800EC84003000300000004000000000000000000FEFEFF1A1B00D30000
      00FF1C000000000000002091400100000000000000F03F0200000000000018AA
      4003000700000004000000000000000000FEFEFF1A1B00D4000000FF1C000000
      00000000209140010000000000000000400200000000000074AA400300060000
      0004000000000000000000FEFEFF1A1B00D5000000FF1C000000000000002091
      400100000000000000084002000000000000F3C54003002D0000000400000000
      0000000000FEFEFF1A1B00D6000000FF1C000000000000002091400100000000
      00000010400200000000008074CA4003000300000004000000000000000000FE
      FEFF1A1B00D7000000FF1C000000000000002491400100000000000000F03F02
      0000000000007FC64003000600000004000000000000000000FEFEFF1A1B00D8
      000000FF1C000000000000002491400100000000000000004002000000000080
      B9C64003000800000004000000000000000000FEFEFF1A1B00D9000000FF1C00
      0000000000002891400100000000000000F03F02000000000000C6B440030002
      00000004000000000000000000FEFEFF1A1B00DA000000FF1C00000000000000
      2891400100000000000000004002000000000000CCB440030004000000040000
      00000000000000FEFEFF1A1B00DB000000FF1C00000000000000289140010000
      0000000000084002000000000000E5B440030003000000040000000000000000
      00FEFEFF1A1B00DC000000FF1C000000000000002C91400100000000000000F0
      3F0200000000000076A44003000100000004000000000000000000FEFEFF1A1B
      00DD000000FF1C000000000000002C9140010000000000000000400200000000
      000074AA4003000300000004000000000000000000FEFEFF1A1B00DE000000FF
      1C000000000000003091400100000000000000F03F0200000000000076A44003
      000400000004000000000000000000FEFEFF1A1B00DF000000FF1C0000000000
      0000309140010000000000000000400200000000000014A74003000500000004
      000000000000000000FEFEFF1A1B00E0000000FF1C0000000000000030914001
      0000000000000008400200000000000018AA4003000700000004000000000000
      000000FEFEFF1A1B00E1000000FF1C0000000000000034914001000000000000
      00F03F0200000000000090944003000100000004000000000000000000FEFEFF
      1A1B00E2000000FF1C0000000000000034914001000000000000000040020000
      00000000B8954003000200000004000000000000000000FEFEFF1A1B00E30000
      00FF1C00000000000000349140010000000000000008400200000000000090A4
      4003000400000004000000000000000000FEFEFF1A1B00E4000000FF1C000000
      00000000349140010000000000000010400200000000000014A7400300010000
      0004000000000000000000FEFEFF1A1B00E5000000FF1C000000000000003491
      400100000000000000144002000000000000E5B4400300010000000400000000
      0000000000FEFEFF1A1B00E6000000FF1C000000000000003491400100000000
      000000184002000000000000BCBD4003000300000004000000000000000000FE
      FEFF1A1B00E7000000FF1C0000000000000034914001000000000000001C4002
      000000000080EAC54003000300000004000000000000000000FEFEFF1A1B00E8
      000000FF1C000000000000003491400100000000000000204002000000000080
      06C84003000400000004000000000000000000FEFEFF1A1B00E9000000FF1C00
      0000000000003891400100000000000000F03F02000000000000C09440030003
      00000004000000000000000000FEFEFF1A1B00EA000000FF1C00000000000000
      38914001000000000000000040020000000000005CA240030002000000040000
      00000000000000FEFEFF1A1B00EB000000FF1C00000000000000389140010000
      000000000008400200000000000030C240030004000000040000000000000000
      00FEFEFF1A1B00EC000000FF1C00000000000000389140010000000000000010
      400200000000000033C24003000400000004000000000000000000FEFEFF1A1B
      00ED000000FF1C000000000000003C91400100000000000000F03F0200000000
      000084944003000400000004000000000000000000FEFEFF1A1B00EE000000FF
      1C000000000000003C9140010000000000000000400200000000000090944003
      001900000004000000000000000000FEFEFF1A1B00EF000000FF1C0000000000
      00003C9140010000000000000008400200000000000050954003000400000004
      000000000000000000FEFEFF1A1B00F0000000FF1C000000000000003C914001
      00000000000000104002000000000000B8954003001500000004000000000000
      000000FEFEFF1A1B00F1000000FF1C000000000000003C914001000000000000
      001440020000000000004AA24003000300000004000000000000000000FEFEFF
      1A1B00F2000000FF1C000000000000003C914001000000000000001840020000
      000000009EA24003001000000004000000000000000000FEFEFF1A1B00F30000
      00FF1C000000000000003C914001000000000000001C4002000000000000ACA2
      4003000200000004000000000000000000FEFEFF1A1B00F4000000FF1C000000
      000000003C914001000000000000002040020000000000006AA44003000A0000
      0004000000000000000000FEFEFF1A1B00F5000000FF1C000000000000003C91
      40010000000000000022400200000000000018AA4003000C0000000400000000
      0000000000FEFEFF1A1B00F6000000FF1C000000000000003C91400100000000
      00000024400200000000000074AA4003000200000004000000000000000000FE
      FEFF1A1B00F7000000FF1C000000000000003C91400100000000000000264002
      000000000000C1B44003000B00000004000000000000000000FEFEFF1A1B00F8
      000000FF1C000000000000003C91400100000000000000284002000000000000
      CCB44003000300000004000000000000000000FEFEFF1A1B00F9000000FF1C00
      0000000000003C914001000000000000002A4002000000000000E5B440030001
      00000004000000000000000000FEFEFF1A1B00FA000000FF1C00000000000000
      3C914001000000000000002C4002000000000000ECB440030001000000040000
      00000000000000FEFEFF1A1B00FB000000FF1C000000000000003C9140010000
      00000000002E40020000000000000AB540030003000000040000000000000000
      00FEFEFF1A1B00FC000000FF1C000000000000003C9140010000000000008070
      4002000000000000C3BD4003000200000004000000000000000000FEFEFF1A1B
      00FD000000FF1C000000000000003C9140010000000000009070400200000000
      0000E6BD4003000300000004000000000000000000FEFEFF1A1B00FE000000FF
      1C000000000000003C914001000000000000A070400200000000000032C24003
      001900000004000000000000000000FEFEFF1A1B00FF000000FF1C0000000000
      00003C914001000000000000B0704002000000000080EAC54003000100000004
      000000000000000000FEFEFF1A1B0000010000FF1C000000000000003C914001
      000000000000C07040020000000000007FC64003000100000004000000000000
      000000FEFEFF1A1B0001010000FF1C000000000000003C914001000000000000
      D0704002000000000080B9C64003000100000004000000000000000000FEFEFF
      1A1B0002010000FF1C000000000000004091400100000000000000F03F020000
      0000000084944003000200000004000000000000000000FEFEFF1A1B00030100
      00FF1C0000000000000040914001000000000000000040020000000000008894
      4003000100000004000000000000000000FEFEFF1A1B0004010000FF1C000000
      0000000040914001000000000000000840020000000000009094400300010000
      0004000000000000000000FEFEFF1A1B0005010000FF1C000000000000004091
      400100000000000000104002000000000000A094400300020000000400000000
      0000000000FEFEFF1A1B0006010000FF1C000000000000004091400100000000
      000000144002000000000000C0944003000300000004000000000000000000FE
      FEFF1A1B0007010000FF1C000000000000004091400100000000000000184002
      000000000000B8954003000300000004000000000000000000FEFEFF1A1B0008
      010000FF1C0000000000000040914001000000000000001C4002000000000000
      689E4003000300000004000000000000000000FEFEFF1A1B0009010000FF1C00
      0000000000004091400100000000000000204002000000000000089F40030002
      00000004000000000000000000FEFEFF1A1B000A010000FF1C00000000000000
      409140010000000000000022400200000000000014A240030003000000040000
      00000000000000FEFEFF1A1B000B010000FF1C00000000000000409140010000
      00000000002440020000000000004EA240030001000000040000000000000000
      00FEFEFF1A1B000C010000FF1C00000000000000409140010000000000000026
      40020000000000005CA24003000100000004000000000000000000FEFEFF1A1B
      000D010000FF1C00000000000000409140010000000000000028400200000000
      00007EA24003000100000004000000000000000000FEFEFF1A1B000E010000FF
      1C0000000000000040914001000000000000002A40020000000000009EA24003
      000600000004000000000000000000FEFEFF1A1B000F010000FF1C0000000000
      000040914001000000000000002C4002000000000000ACA24003000400000004
      000000000000000000FEFEFF1A1B0010010000FF1C0000000000000040914001
      000000000000002E400200000000000068A44003001300000004000000000000
      000000FEFEFF1A1B0011010000FF1C0000000000000040914001000000000000
      D071400200000000000076A44003000100000004000000000000000000FEFEFF
      1A1B0012010000FF1C0000000000000040914001000000000000E07140020000
      000000008CA44003000100000004000000000000000000FEFEFF1A1B00130100
      00FF1C0000000000000040914001000000000000F071400200000000000090A4
      4003000F00000004000000000000000000FEFEFF1A1B0014010000FF1C000000
      000000004091400100000000000000724002000000000000B0A4400300040000
      0004000000000000000000FEFEFF1A1B0015010000FF1C000000000000004091
      40010000000000001072400200000000000014A7400300040000000400000000
      0000000000FEFEFF1A1B0016010000FF1C000000000000004091400100000000
      000020724002000000000000E8A94003000200000004000000000000000000FE
      FEFF1A1B0017010000FF1C000000000000004091400100000000000030724002
      000000000000FCA94003001700000004000000000000000000FEFEFF1A1B0018
      010000FF1C000000000000004091400100000000000040724002000000000000
      74AA4003000400000004000000000000000000FEFEFF1A1B0019010000FF1C00
      0000000000004091400100000000000050724002000000000000C6B440030004
      00000004000000000000000000FEFEFF1A1B001A010000FF1C00000000000000
      4091400100000000000060724002000000000000CCB440030011000000040000
      00000000000000FEFEFF1A1B001B010000FF1C00000000000000409140010000
      0000000070724002000000000000E5B440030001000000040000000000000000
      00FEFEFF1A1B001C010000FF1C00000000000000409140010000000000008072
      40020000000000000AB54003000100000004000000000000000000FEFEFF1A1B
      001D010000FF1C00000000000000409140010000000000009072400200000000
      0000BCBD4003000300000004000000000000000000FEFEFF1A1B001E010000FF
      1C0000000000000040914001000000000000A0724002000000000000C3BD4003
      000800000004000000000000000000FEFEFF1A1B001F010000FF1C0000000000
      000040914001000000000000B0724002000000000000E6BD4003000200000004
      000000000000000000FEFEFF1A1B0020010000FF1C0000000000000040914001
      000000000000C072400200000000000032C24003000200000004000000000000
      000000FEFEFF1A1B0021010000FF1C0000000000000040914001000000000000
      D072400200000000000033C24003000100000004000000000000000000FEFEFF
      1A1B0022010000FF1C0000000000000040914001000000000000E07240020000
      00000000F3C54003000400000004000000000000000000FEFEFF1A1B00230100
      00FF1C0000000000000040914001000000000000F072400200000000000096C6
      4003000400000004000000000000000000FEFEFF1A1B0024010000FF1C000000
      00000000409140010000000000000073400200000000008007C8400300020000
      0004000000000000000000FEFEFF1A1B0025010000FF1C000000000000004491
      400100000000000000F03F020000000000008494400300120000000400000000
      0000000000FEFEFF1A1B0026010000FF1C000000000000004491400100000000
      000000004002000000000000A0944003001900000004000000000000000000FE
      FEFF1A1B0027010000FF1C000000000000004491400100000000000000084002
      00000000000068A44003000100000004000000000000000000FEFEFF1A1B0028
      010000FF1C000000000000004491400100000000000000104002000000000000
      18AA4003000400000004000000000000000000FEFEFF1A1B0029010000FF1C00
      000000000000449140010000000000000014400200000000000074AA40030003
      00000004000000000000000000FEFEFF1A1B002A010000FF1C00000000000000
      44914001000000000000001840020000000000007FC64003000A000000040000
      00000000000000FEFEFF1A1B002B010000FF1C00000000000000489140010000
      0000000000F03F02000000000000889440030002000000040000000000000000
      00FEFEFF1A1B002C010000FF1C00000000000000489140010000000000000000
      4002000000000000089F4003000300000004000000000000000000FEFEFF1A1B
      002D010000FF1C00000000000000489140010000000000000008400200000000
      000014A24003000100000004000000000000000000FEFEFF1A1B002E010000FF
      1C00000000000000489140010000000000000010400200000000000090A44003
      000600000004000000000000000000FEFEFF1A1B002F010000FF1C0000000000
      00004891400100000000000000144002000000000000B0A44003000600000004
      000000000000000000FEFEFF1A1B0030010000FF1C0000000000000048914001
      00000000000000184002000000000000E6BD4003000400000004000000000000
      000000FEFEFF1A1B0031010000FF1C000000000000004C914001000000000000
      00F03F02000000000000C0944003000400000004000000000000000000FEFEFF
      1A1B0032010000FF1C000000000000004C914001000000000000000040020000
      0000000050954003000100000004000000000000000000FEFEFF1A1B00330100
      00FF1C000000000000004C91400100000000000000084002000000000000689E
      4003000200000004000000000000000000FEFEFF1A1B0034010000FF1C000000
      000000004C914001000000000000001040020000000000004EA2400300020000
      0004000000000000000000FEFEFF1A1B0035010000FF1C000000000000004C91
      4001000000000000001440020000000000008CA4400300040000000400000000
      0000000000FEFEFF1A1B0036010000FF1C000000000000004C91400100000000
      000000184002000000000000E5B44003000400000004000000000000000000FE
      FEFF1A1B0037010000FF1C000000000000004C914001000000000000001C4002
      000000000000F3C54003000200000004000000000000000000FEFEFF1A1B0038
      010000FF1C000000000000004C91400100000000000000204002000000000000
      7FC64003000700000004000000000000000000FEFEFF1A1B0039010000FF1C00
      0000000000004C9140010000000000000022400200000000008006C84003000A
      00000004000000000000000000FEFEFF1A1B003A010000FF1C00000000000000
      5491400100000000000000F03F02000000000000CCB440030003000000040000
      00000000000000FEFEFF1A1B003B010000FF1C00000000000000549140010000
      00000000000040020000000000000AB540030001000000040000000000000000
      00FEFEFF1A1B003C010000FF1C000000000000005C91400100000000000000F0
      3F0200000000000050954003000300000004000000000000000000FEFEFF1A1B
      003D010000FF1C000000000000005C9140010000000000000000400200000000
      00004EA24003000200000004000000000000000000FEFEFF1A1B003E010000FF
      1C000000000000005C91400100000000000000084002000000000000FCA94003
      000300000004000000000000000000FEFEFF1A1B003F010000FF1C0000000000
      00005C91400100000000000000104002000000000000C1B44003000200000004
      000000000000000000FEFEFF1A1B0040010000FF1C000000000000005C914001
      00000000000000144002000000000000ECB44003000400000004000000000000
      000000FEFEFF1A1B0041010000FF1C000000000000005C914001000000000000
      00184002000000000000E6BD4003000400000004000000000000000000FEFEFF
      1A1B0042010000FF1C000000000000005C914001000000000000001C40020000
      000000007FC64003000100000004000000000000000000FEFEFF1A1B00430100
      00FF1C000000000000006091400100000000000000F03F02000000000000C894
      4003001200000004000000000000000000FEFEFF1A1B0044010000FF1C000000
      0000000060914001000000000000000040020000000000004AA2400300020000
      0004000000000000000000FEFEFF1A1B0045010000FF1C000000000000006091
      40010000000000000008400200000000000018AA400300010000000400000000
      0000000000FEFEFF1A1B0046010000FF1C000000000000006091400100000000
      000000104002000000000000ECB44003000400000004000000000000000000FE
      FEFF1A1B0047010000FF1C000000000000006491400100000000000000F03F02
      00000000000090A44003000200000004000000000000000000FEFEFF1A1B0048
      010000FF1C000000000000006491400100000000000000004002000000000000
      B0A44003000400000004000000000000000000FEFEFF1A1B0049010000FF1C00
      0000000000006491400100000000000000084002000000000000C1B440030001
      00000004000000000000000000FEFEFF1A1B004A010000FF1C00000000000000
      6491400100000000000000104002000000000000ECB440030002000000040000
      00000000000000FEFEFF1A1B004B010000FF1C00000000000000649140010000
      0000000000144002000000000080B9C640030004000000040000000000000000
      00FEFEFF1A1B004C010000FF1C00000000000000649140010000000000000018
      4002000000000000C2C64003000300000004000000000000000000FEFEFF1A1B
      004D010000FF1C000000000000006C91400100000000000000F03F0200000000
      00005CA24003001600000004000000000000000000FEFEFF1A1B004E010000FF
      1C000000000000006C9140010000000000000000400200000000000074AA4003
      000F00000004000000000000000000FEFEFF1A1B004F010000FF1C0000000000
      00006C91400100000000000000084002000000000000C6B44003000100000004
      000000000000000000FEFEFF1A1B0050010000FF1C0000000000000070914001
      00000000000000F03F02000000000000208C4003000200000004000000000000
      000000FEFEFF1A1B0051010000FF1C0000000000000070914001000000000000
      0000400200000000000084944003000400000004000000000000000000FEFEFF
      1A1B0052010000FF1C0000000000000070914001000000000000000840020000
      00000000A0944003000200000004000000000000000000FEFEFF1A1B00530100
      00FF1C0000000000000070914001000000000000001040020000000000004EA2
      4003000300000004000000000000000000FEFEFF1A1B0054010000FF1C000000
      00000000709140010000000000000014400200000000000090A4400300040000
      0004000000000000000000FEFEFF1A1B0055010000FF1C000000000000007091
      400100000000000000184002000000000080EAC5400300030000000400000000
      0000000000FEFEFF1A1B0056010000FF1C000000000000007091400100000000
      0000001C4002000000000000F3C54003000300000004000000000000000000FE
      FEFF1A1B0057010000FF1C000000000000007091400100000000000000204002
      00000000008007C84003000200000004000000000000000000FEFEFF1A1B0058
      010000FF1C000000000000007491400100000000000000F03F02000000000000
      808C4003000300000004000000000000000000FEFEFF1A1B0059010000FF1C00
      00000000000074914001000000000000000040020000000000004AA240030002
      00000004000000000000000000FEFEFF1A1B005A010000FF1C00000000000000
      7491400100000000000000084002000000000000E5B44003000F000000040000
      00000000000000FEFEFF1A1B005B010000FF1C00000000000000749140010000
      0000000000104002000000000000C3BD40030003000000040000000000000000
      00FEFEFF1A1B005C010000FF1C000000000000007891400100000000000000F0
      3F0200000000000090944003000300000004000000000000000000FEFEFF1A1B
      005D010000FF1C00000000000000789140010000000000000000400200000000
      0000ACA24003001900000004000000000000000000FEFEFF1A1B005E010000FF
      1C00000000000000789140010000000000000008400200000000000018AA4003
      001400000004000000000000000000FEFEFF1A1B005F010000FF1C0000000000
      00007891400100000000000000104002000000000000C1B44003000100000004
      000000000000000000FEFEFF1A1B0060010000FF1C0000000000000078914001
      0000000000000014400200000000000002B54003000300000004000000000000
      000000FEFEFF1A1B0061010000FF1C0000000000000078914001000000000000
      0018400200000000000045C24003000200000004000000000000000000FEFEFF
      1A1B0062010000FF1C0000000000000078914001000000000000001C40020000
      0000008007C84003000200000004000000000000000000FEFEFF1A1B00630100
      00FF1C000000000000007C91400100000000000000F03F020000000000007EA2
      4003000300000004000000000000000000FEFEFF1A1B0064010000FF1C000000
      000000007C9140010000000000000000400200000000000076A4400300010000
      0004000000000000000000FEFEFF1A1B0065010000FF1C000000000000007C91
      40010000000000000008400200000000000014A7400300160000000400000000
      0000000000FEFEFF1A1B0066010000FF1C000000000000007C91400100000000
      000000104002000000000000C1B44003000200000004000000000000000000FE
      FEFF1A1B0067010000FF1C000000000000008091400100000000000000F03F02
      0000000000004AA24003000100000004000000000000000000FEFEFF1A1B0068
      010000FF1C000000000000008091400100000000000000004002000000000000
      FCA94003000200000004000000000000000000FEFEFF1A1B0069010000FF1C00
      0000000000008091400100000000000000084002000000000000E6BD40030002
      00000004000000000000000000FEFEFF1A1B006A010000FF1C00000000000000
      8491400100000000000000F03F02000000000000C89440030001000000040000
      00000000000000FEFEFF1A1B006B010000FF1C00000000000000849140010000
      0000000000004002000000000000FCA940030002000000040000000000000000
      00FEFEFF1A1B006C010000FF1C000000000000008891400100000000000000F0
      3F02000000000000C8944003001900000004000000000000000000FEFEFF1A1B
      006D010000FF1C00000000000000889140010000000000000000400200000000
      0000ACA24003000200000004000000000000000000FEFEFF1A1B006E010000FF
      1C000000000000008891400100000000000000084002000000000000FCA94003
      000A00000004000000000000000000FEFEFF1A1B006F010000FF1C0000000000
      00008891400100000000000000104002000000000080EAC54003000200000004
      000000000000000000FEFEFF1A1B0070010000FF1C0000000000000088914001
      00000000000000144002000000000000F3C54003000C00000004000000000000
      000000FEFEFF1A1B0071010000FF1C000000000000008C914001000000000000
      00F03F0200000000000088944003001000000004000000000000000000FEFEFF
      1A1B0072010000FF1C000000000000008C914001000000000000000040020000
      0000000088944003001800000004000000000000000000FEFEFF1A1B00730100
      00FF1C000000000000008C91400100000000000000084002000000000000089F
      4003000200000004000000000000000000FEFEFF1A1B0074010000FF1C000000
      000000008C914001000000000000001040020000000000008CA4400300020000
      0004000000000000000000FEFEFF1A1B0075010000FF1C000000000000008C91
      400100000000000000144002000000000000CCB4400300020000000400000000
      0000000000FEFEFF1A1B0076010000FF1C000000000000008C91400100000000
      000000184002000000000000E5B44003000300000004000000000000000000FE
      FEFF1A1B0077010000FF1C000000000000009091400100000000000000F03F02
      000000000000208C4003000800000004000000000000000000FEFEFF1A1B0078
      010000FF1C000000000000009091400100000000000000004002000000000000
      50954003000400000004000000000000000000FEFEFF1A1B0079010000FF1C00
      0000000000009091400100000000000000084002000000000000ACA240030004
      00000004000000000000000000FEFEFF1A1B007A010000FF1C00000000000000
      909140010000000000000010400200000000000090A440030014000000040000
      00000000000000FEFEFF1A1B007B010000FF1C00000000000000909140010000
      000000000014400200000000000074AA40030002000000040000000000000000
      00FEFEFF1A1B007C010000FF1C00000000000000909140010000000000000018
      400200000000000030C24003000400000004000000000000000000FEFEFF1A1B
      007D010000FF1C0000000000000090914001000000000000001C400200000000
      0000F3C54003000100000004000000000000000000FEFEFF1A1B007E010000FF
      1C0000000000000090914001000000000000002040020000000000007FC64003
      000300000004000000000000000000FEFEFF1A1B007F010000FF1C0000000000
      00009491400100000000000000F03F02000000000000208C4003000100000004
      000000000000000000FEFEFF1A1B0080010000FF1C0000000000000094914001
      00000000000000004002000000000000089F4003000200000004000000000000
      000000FEFEFF1A1B0081010000FF1C0000000000000094914001000000000000
      000840020000000000004AA24003000900000004000000000000000000FEFEFF
      1A1B0082010000FF1C0000000000000094914001000000000000001040020000
      00000000C1B44003000400000004000000000000000000FEFEFF1A1B00830100
      00FF1C000000000000009491400100000000000000144002000000000000C6B4
      4003000400000004000000000000000000FEFEFF1A1B0084010000FF1C000000
      000000009491400100000000000000184002000000000000ECB4400300040000
      0004000000000000000000FEFEFF1A1B0085010000FF1C000000000000009491
      4001000000000000001C400200000000008006C8400300040000000400000000
      0000000000FEFEFF1A1B0086010000FF1C000000000000009891400100000000
      000000F03F0200000000000002B54003000300000004000000000000000000FE
      FEFF1A1B0087010000FF1C000000000000009891400100000000000000004002
      00000000000096C64003000300000004000000000000000000FEFEFF1A1B0088
      010000FF1C000000000000009C91400100000000000000F03F02000000000000
      C8944003000400000004000000000000000000FEFEFF1A1B0089010000FF1C00
      0000000000009C9140010000000000000000400200000000000018AA40030002
      00000004000000000000000000FEFEFF1A1B008A010000FF1C00000000000000
      9C91400100000000000000084002000000000000C1B440030003000000040000
      00000000000000FEFEFF1A1B008B010000FF1C000000000000009C9140010000
      0000000000104002000000000080EAC540030009000000040000000000000000
      00FEFEFF1A1B008C010000FF1C000000000000009C9140010000000000000014
      400200000000008006C84003000300000004000000000000000000FEFEFF1A1B
      008D010000FF1C00000000000000A091400100000000000000F03F0200000000
      0000C0944003000400000004000000000000000000FEFEFF1A1B008E010000FF
      1C00000000000000A0914001000000000000000040020000000000004EA24003
      000100000004000000000000000000FEFEFF1A1B008F010000FF1C0000000000
      0000A091400100000000000000084002000000000000FCA94003000400000004
      000000000000000000FEFEFF1A1B0090010000FF1C00000000000000A0914001
      00000000000000104002000000000000ECB44003000100000004000000000000
      000000FEFEFF1A1B0091010000FF1C00000000000000A0914001000000000000
      001440020000000000000AB54003000D00000004000000000000000000FEFEFF
      1A1B0092010000FF1C00000000000000A0914001000000000000001840020000
      0000000030C24003000900000004000000000000000000FEFEFF1A1B00930100
      00FF1C00000000000000A0914001000000000000001C4002000000000000F3C5
      4003000100000004000000000000000000FEFEFF1A1B0094010000FF1C000000
      00000000A491400100000000000000F03F02000000000000C3BD400300040000
      0004000000000000000000FEFEFF1A1B0095010000FF1C00000000000000A491
      40010000000000000000400200000000000032C2400300010000000400000000
      0000000000FEFEFF1A1B0096010000FF1C00000000000000A891400100000000
      000000F03F02000000000000ACA24003000F00000004000000000000000000FE
      FEFF1A1B0097010000FF1C00000000000000AC91400100000000000000F03F02
      000000000000208C4003000400000004000000000000000000FEFEFF1A1B0098
      010000FF1C00000000000000AC91400100000000000000004002000000000000
      089F4003000300000004000000000000000000FEFEFF1A1B0099010000FF1C00
      000000000000AC914001000000000000000840020000000000005CA240030002
      00000004000000000000000000FEFEFF1A1B009A010000FF1C00000000000000
      AC9140010000000000000010400200000000000090A440030002000000040000
      00000000000000FEFEFF1A1B009B010000FF1C00000000000000AC9140010000
      000000000014400200000000000074AA40030003000000040000000000000000
      00FEFEFF1A1B009C010000FF1C00000000000000AC9140010000000000000018
      4002000000000000ECB44003000300000004000000000000000000FEFEFF1A1B
      009D010000FF1C00000000000000AC914001000000000000001C400200000000
      000002B54003000400000004000000000000000000FEFEFF1A1B009E010000FF
      1C00000000000000AC91400100000000000000204002000000000000E6BD4003
      001000000004000000000000000000FEFEFF1A1B009F010000FF1C0000000000
      0000B091400100000000000000F03F02000000000000B0A44003000400000004
      000000000000000000FEFEFF1A1B00A0010000FF1C00000000000000B0914001
      00000000000000004002000000000000E8A94003000100000004000000000000
      000000FEFEFF1A1B00A1010000FF1C00000000000000B4914001000000000000
      00F03F02000000000000C0944003000300000004000000000000000000FEFEFF
      1A1B00A2010000FF1C00000000000000B4914001000000000000000040020000
      00000000B8954003000300000004000000000000000000FEFEFF1A1B00A30100
      00FF1C00000000000000B49140010000000000000008400200000000000014A2
      4003000100000004000000000000000000FEFEFF1A1B00A4010000FF1C000000
      00000000B491400100000000000000104002000000000000CCB4400300040000
      0004000000000000000000FEFEFF1A1B00A5010000FF1C00000000000000B491
      400100000000000000144002000000000000E5B4400300010000000400000000
      0000000000FEFEFF1A1B00A6010000FF1C00000000000000B891400100000000
      000000F03F02000000000000A0944003001700000004000000000000000000FE
      FEFF1A1B00A7010000FF1C00000000000000B891400100000000000000004002
      000000000000B0A44003000100000004000000000000000000FEFEFF1A1B00A8
      010000FF1C00000000000000B891400100000000000000084002000000000000
      C2A44003000300000004000000000000000000FEFEFF1A1B00A9010000FF1C00
      000000000000B8914001000000000000001040020000000000000AB540030004
      00000004000000000000000000FEFEFF1A1B00AA010000FF1C00000000000000
      B891400100000000000000144002000000000000BCBD40030001000000040000
      00000000000000FEFEFF1A1B00AB010000FF1C00000000000000B89140010000
      000000000018400200000000008007C840030003000000040000000000000000
      00FEFEFF1A1B00AC010000FF1C00000000000000C091400100000000000000F0
      3F02000000000000A0944003000100000004000000000000000000FEFEFF1A1B
      00AD010000FF1C00000000000000C09140010000000000000000400200000000
      0000089F4003000100000004000000000000000000FEFEFF1A1B00AE010000FF
      1C00000000000000C09140010000000000000008400200000000000014A24003
      000100000004000000000000000000FEFEFF1A1B00AF010000FF1C0000000000
      0000C091400100000000000000104002000000000000C2A44003000400000004
      000000000000000000FEFEFF1A1B00B0010000FF1C00000000000000C0914001
      00000000000000144002000000000000E8A94003000400000004000000000000
      000000FEFEFF1A1B00B1010000FF1C00000000000000C0914001000000000000
      00184002000000000000ECB44003000100000004000000000000000000FEFEFF
      1A1B00B2010000FF1C00000000000000C0914001000000000000001C40020000
      0000000002B54003000400000004000000000000000000FEFEFF1A1B00B30100
      00FF1C00000000000000C0914001000000000000002040020000000000000AB5
      4003000100000004000000000000000000FEFEFF1A1B00B4010000FF1C000000
      00000000C491400100000000000000F03F02000000000000C894400300110000
      0004000000000000000000FEFEFF1A1B00B5010000FF1C00000000000000C491
      40010000000000000000400200000000000014A7400300010000000400000000
      0000000000FEFEFF1A1B00B6010000FF1C00000000000000C491400100000000
      00000008400200000000000074AA4003000100000004000000000000000000FE
      FEFF1A1B00B7010000FF1C00000000000000C491400100000000000000104002
      000000000000E6BD4003000C00000004000000000000000000FEFEFF1A1B00B8
      010000FF1C00000000000000C491400100000000000000144002000000000000
      30C24003000400000004000000000000000000FEFEFF1A1B00B9010000FF1C00
      000000000000CC91400100000000000000F03F02000000000000C0944003000E
      00000004000000000000000000FEFEFF1A1B00BA010000FF1C00000000000000
      CC914001000000000000000040020000000000007EA240030002000000040000
      00000000000000FEFEFF1A1B00BB010000FF1C00000000000000CC9140010000
      0000000000084002000000000000C1B440030015000000040000000000000000
      00FEFEFF1A1B00BC010000FF1C00000000000000CC9140010000000000000010
      4002000000000000C6B44003000100000004000000000000000000FEFEFF1A1B
      00BD010000FF1C00000000000000CC9140010000000000000014400200000000
      0000E6BD4003000300000004000000000000000000FEFEFF1A1B00BE010000FF
      1C00000000000000CC9140010000000000000018400200000000000030C24003
      000C00000004000000000000000000FEFEFF1A1B00BF010000FF1C0000000000
      0000CC914001000000000000001C40020000000000007FC64003001300000004
      000000000000000000FEFEFF1A1B00C0010000FF1C00000000000000CC914001
      00000000000000204002000000000000C2C64003000100000004000000000000
      000000FEFEFF1A1B00C1010000FF1C00000000000000D0914001000000000000
      00F03F02000000000000689E4003000300000004000000000000000000FEFEFF
      1A1B00C2010000FF1C00000000000000D0914001000000000000000040020000
      0000000090A44003000100000004000000000000000000FEFEFF1A1B00C30100
      00FF1C00000000000000D091400100000000000000084002000000000000CCB4
      4003000400000004000000000000000000FEFEFF1A1B00C4010000FF1C000000
      00000000D491400100000000000000F03F020000000000005CA2400300020000
      0004000000000000000000FEFEFF1A1B00C5010000FF1C00000000000000D491
      40010000000000000000400200000000000090A4400300020000000400000000
      0000000000FEFEFF1A1B00C6010000FF1C00000000000000D491400100000000
      00000008400200000000000014A74003000100000004000000000000000000FE
      FEFF1A1B00C7010000FF1C00000000000000D491400100000000000000104002
      000000000000FCA94003000300000004000000000000000000FEFEFF1A1B00C8
      010000FF1C00000000000000D891400100000000000000F03F02000000000000
      84944003000100000004000000000000000000FEFEFF1A1B00C9010000FF1C00
      000000000000D891400100000000000000004002000000000000089F40030002
      00000004000000000000000000FEFEFF1A1B00CA010000FF1C00000000000000
      D89140010000000000000008400200000000000014A740030004000000040000
      00000000000000FEFEFF1A1B00CB010000FF1C00000000000000D89140010000
      00000000001040020000000000000AB540030004000000040000000000000000
      00FEFEFF1A1B00CC010000FF1C00000000000000DC91400100000000000000F0
      3F02000000000000C0944003000300000004000000000000000000FEFEFF1A1B
      00CD010000FF1C00000000000000DC9140010000000000000000400200000000
      008006C84003000300000004000000000000000000FEFEFF1A1B00CE010000FF
      1C00000000000000E091400100000000000000F03F02000000000000089F4003
      000300000004000000000000000000FEFEFF1A1B00CF010000FF1C0000000000
      0000E0914001000000000000000040020000000000008CA44003000400000004
      000000000000000000FEFEFF1A1B00D0010000FF1C00000000000000E0914001
      00000000000000084002000000000000E8A94003001200000004000000000000
      000000FEFEFF1A1B00D1010000FF1C00000000000000E0914001000000000000
      00104002000000000000FCA94003000300000004000000000000000000FEFEFF
      1A1B00D2010000FF1C00000000000000E0914001000000000000001440020000
      00000000CCB44003000A00000004000000000000000000FEFEFF1A1B00D30100
      00FF1C00000000000000E091400100000000000000184002000000000000ECB4
      4003000100000004000000000000000000FEFEFF1A1B00D4010000FF1C000000
      00000000E0914001000000000000001C400200000000000030C2400300020000
      0004000000000000000000FEFEFF1A1B00D5010000FF1C00000000000000E491
      400100000000000000F03F02000000000000C094400300010000000400000000
      0000000000FEFEFF1A1B00D6010000FF1C00000000000000E491400100000000
      000000004002000000000000B8954003000400000004000000000000000000FE
      FEFF1A1B00D7010000FF1C00000000000000E491400100000000000000084002
      000000000000BCBD4003000400000004000000000000000000FEFEFF1A1B00D8
      010000FF1C00000000000000E491400100000000000000104002000000000080
      07C84003000400000004000000000000000000FEFEFF1A1B00D9010000FF1C00
      000000000000E891400100000000000000F03F02000000000000208C40030004
      00000004000000000000000000FEFEFF1A1B00DA010000FF1C00000000000000
      E891400100000000000000004002000000000000C09440030003000000040000
      00000000000000FEFEFF1A1B00DB010000FF1C00000000000000E89140010000
      0000000000084002000000000000089F40030004000000040000000000000000
      00FEFEFF1A1B00DC010000FF1C00000000000000E89140010000000000000010
      40020000000000007EA24003000100000004000000000000000000FEFEFF1A1B
      00DD010000FF1C00000000000000E89140010000000000000014400200000000
      00006AA44003001600000004000000000000000000FEFEFF1A1B00DE010000FF
      1C00000000000000E8914001000000000000001840020000000000000AB54003
      000300000004000000000000000000FEFEFF1A1B00DF010000FF1C0000000000
      0000F091400100000000000000F03F0200000000000050954003000100000004
      000000000000000000FEFEFF1A1B00E0010000FF1C00000000000000F0914001
      00000000000000004002000000000000FCA94003000200000004000000000000
      000000FEFEFF1A1B00E1010000FF1C00000000000000F0914001000000000000
      00084002000000000000ECB44003000C00000004000000000000000000FEFEFF
      1A1B00E2010000FF1C00000000000000F0914001000000000000001040020000
      0000000002B54003000600000004000000000000000000FEFEFF1A1B00E30100
      00FF1C00000000000000F09140010000000000000014400200000000000030C2
      4003000400000004000000000000000000FEFEFF1A1B00E4010000FF1C000000
      00000000F09140010000000000000018400200000000008007C8400300030000
      0004000000000000000000FEFEFF1A1B00E5010000FF1C00000000000000F491
      400100000000000000F03F02000000000000C094400300030000000400000000
      0000000000FEFEFF1A1B00E6010000FF1C00000000000000F491400100000000
      000000004002000000000000E8A94003001600000004000000000000000000FE
      FEFF1A1B00E7010000FF1C00000000000000F491400100000000000000084002
      000000000000C1B44003000400000004000000000000000000FEFEFF1A1B00E8
      010000FF1C00000000000000F491400100000000000000104002000000000000
      02B54003000400000004000000000000000000FEFEFF1A1B00E9010000FF1C00
      000000000000F491400100000000000000144002000000000000BCBD40030002
      00000004000000000000000000FEFEFF1A1B00EA010000FF1C00000000000000
      F49140010000000000000018400200000000000030C240030003000000040000
      00000000000000FEFEFF1A1B00EB010000FF1C00000000000000F49140010000
      00000000001C4002000000000000C2C640030003000000040000000000000000
      00FEFEFF1A1B00EC010000FF1C00000000000000F891400100000000000000F0
      3F0200000000000084944003000400000004000000000000000000FEFEFF1A1B
      00ED010000FF1C00000000000000F89140010000000000000000400200000000
      0000A0944003000300000004000000000000000000FEFEFF1A1B00EE010000FF
      1C00000000000000F891400100000000000000084002000000000000C8944003
      000300000004000000000000000000FEFEFF1A1B00EF010000FF1C0000000000
      0000F891400100000000000000104002000000000000FCA94003000300000004
      000000000000000000FEFEFF1A1B00F0010000FF1C00000000000000F8914001
      0000000000000014400200000000000018AA4003000A00000004000000000000
      000000FEFEFF1A1B00F1010000FF1C00000000000000F8914001000000000000
      0018400200000000000002B54003000100000004000000000000000000FEFEFF
      1A1B00F2010000FF1C00000000000000F8914001000000000000001C40020000
      00000000C3BD4003000200000004000000000000000000FEFEFF1A1B00F30100
      00FF1C00000000000000F89140010000000000000020400200000000000030C2
      4003000100000004000000000000000000FEFEFF1A1B00F4010000FF1C000000
      000000000092400100000000000000F03F02000000000000208C400300010000
      0004000000000000000000FEFEFF1A1B00F5010000FF1C000000000000000092
      400100000000000000004002000000000000808C400300020000000400000000
      0000000000FEFEFF1A1B00F6010000FF1C000000000000000092400100000000
      00000008400200000000000084944003000200000004000000000000000000FE
      FEFF1A1B00F7010000FF1C000000000000000092400100000000000000104002
      00000000000088944003000300000004000000000000000000FEFEFF1A1B00F8
      010000FF1C000000000000000092400100000000000000144002000000000000
      90944003000100000004000000000000000000FEFEFF1A1B00F9010000FF1C00
      0000000000000092400100000000000000184002000000000000A09440030002
      00000004000000000000000000FEFEFF1A1B00FA010000FF1C00000000000000
      00924001000000000000001C4002000000000000C09440030004000000040000
      00000000000000FEFEFF1A1B00FB010000FF1C00000000000000009240010000
      0000000000204002000000000000C8944003000E000000040000000000000000
      00FEFEFF1A1B00FC010000FF1C00000000000000009240010000000000000022
      400200000000000050954003000300000004000000000000000000FEFEFF1A1B
      00FD010000FF1C00000000000000009240010000000000000024400200000000
      000014A24003000400000004000000000000000000FEFEFF1A1B00FE010000FF
      1C0000000000000000924001000000000000002640020000000000004AA24003
      000100000004000000000000000000FEFEFF1A1B00FF010000FF1C0000000000
      000000924001000000000000002840020000000000004EA24003000300000004
      000000000000000000FEFEFF1A1B0000020000FF1C0000000000000000924001
      000000000000002A40020000000000005CA24003000100000004000000000000
      000000FEFEFF1A1B0001020000FF1C0000000000000000924001000000000000
      002C400200000000000068A44003000100000004000000000000000000FEFEFF
      1A1B0002020000FF1C0000000000000000924001000000000000002E40020000
      00000000B0A44003000400000004000000000000000000FEFEFF1A1B00030200
      00FF1C00000000000000009240010000000000007880400200000000000014A7
      4003000400000004000000000000000000FEFEFF1A1B0004020000FF1C000000
      000000000092400100000000000080804002000000000000FCA9400300010000
      0004000000000000000000FEFEFF1A1B0005020000FF1C000000000000000092
      40010000000000008880400200000000000018AA400300150000000400000000
      0000000000FEFEFF1A1B0006020000FF1C000000000000000092400100000000
      000090804002000000000000C1B44003000200000004000000000000000000FE
      FEFF1A1B0007020000FF1C000000000000000092400100000000000098804002
      000000000000ECB44003000400000004000000000000000000FEFEFF1A1B0008
      020000FF1C0000000000000000924001000000000000A0804002000000000000
      02B54003000200000004000000000000000000FEFEFF1A1B0009020000FF1C00
      00000000000000924001000000000000A88040020000000000000AB540030015
      00000004000000000000000000FEFEFF1A1B000A020000FF1C00000000000000
      00924001000000000000B0804002000000000000BCBD40030003000000040000
      00000000000000FEFEFF1A1B000B020000FF1C00000000000000009240010000
      00000000B8804002000000000000C3BD40030003000000040000000000000000
      00FEFEFF1A1B000C020000FF1C0000000000000000924001000000000000C080
      400200000000000030C24003000200000004000000000000000000FEFEFF1A1B
      000D020000FF1C0000000000000000924001000000000000C880400200000000
      000032C24003000400000004000000000000000000FEFEFF1A1B000E020000FF
      1C0000000000000000924001000000000000D080400200000000000045C24003
      000400000004000000000000000000FEFEFF1A1B000F020000FF1C0000000000
      000000924001000000000000D8804002000000000080EAC54003001900000004
      000000000000000000FEFEFF1A1B0010020000FF1C0000000000000000924001
      000000000000E0804002000000000000C2C64003000100000004000000000000
      000000FEFEFF1A1B0011020000FF1C0000000000000000924001000000000000
      E880400200000000008006C84003000400000004000000000000000000FEFEFF
      1A1B0012020000FF1C0000000000000000924001000000000000F08040020000
      0000008007C84003000300000004000000000000000000FEFEFF1A1B00130200
      00FF1C000000000000000492400100000000000000F03F020000000000009EA2
      4003001000000004000000000000000000FEFEFF1A1B0014020000FF1C000000
      000000000492400100000000000000004002000000000000E8A9400300010000
      0004000000000000000000FEFEFF1A1B0015020000FF1C000000000000000492
      400100000000000000084002000000000000BCBD400300030000000400000000
      0000000000FEFEFF1A1B0016020000FF1C000000000000000892400100000000
      000000F03F02000000000000C8944003000B00000004000000000000000000FE
      FEFF1A1B0017020000FF1C000000000000000892400100000000000000004002
      00000000000050954003000300000004000000000000000000FEFEFF1A1B0018
      020000FF1C000000000000000892400100000000000000084002000000000000
      ACA24003001600000004000000000000000000FEFEFF1A1B0019020000FF1C00
      000000000000089240010000000000000010400200000000000068A440030001
      00000004000000000000000000FEFEFF1A1B001A020000FF1C00000000000000
      0892400100000000000000144002000000000000C6B440030003000000040000
      00000000000000FEFEFF1A1B001B020000FF1C00000000000000089240010000
      0000000000184002000000000000CCB440030001000000040000000000000000
      00FEFEFF1A1B001C020000FF1C0000000000000008924001000000000000001C
      4002000000000000ECB44003000100000004000000000000000000FEFEFF1A1B
      001D020000FF1C000000000000000C92400100000000000000F03F0200000000
      0000808C4003000300000004000000000000000000FEFEFF1A1B001E020000FF
      1C000000000000000C924001000000000000000040020000000000004AA24003
      000400000004000000000000000000FEFEFF1A1B001F020000FF1C0000000000
      00000C924001000000000000000840020000000000004EA24003000400000004
      000000000000000000FEFEFF1A1B0020020000FF1C000000000000000C924001
      000000000000001040020000000000009EA24003000200000004000000000000
      000000FEFEFF1A1B0021020000FF1C000000000000000C924001000000000000
      0014400200000000000076A44003000100000004000000000000000000FEFEFF
      1A1B0022020000FF1C000000000000000C924001000000000000001840020000
      00000000FCA94003000100000004000000000000000000FEFEFF1A1B00230200
      00FF1C000000000000000C924001000000000000001C400200000000000045C2
      4003000100000004000000000000000000FEFEFF1A1B0024020000FF1C000000
      000000000C9240010000000000000020400200000000008006C84003000B0000
      0004000000000000000000FEFEFF1A1B0025020000FF1C000000000000001092
      400100000000000000F03F02000000000000A094400300040000000400000000
      0000000000FEFEFF1A1B0026020000FF1C000000000000001092400100000000
      000000004002000000000000C0944003000300000004000000000000000000FE
      FEFF1A1B0027020000FF1C000000000000001092400100000000000000084002
      000000000000C1B44003000200000004000000000000000000FEFEFF1A1B0028
      020000FF1C000000000000001092400100000000000000104002000000000000
      30C24003000100000004000000000000000000FEFEFF1A1B0029020000FF1C00
      000000000000109240010000000000000014400200000000000045C240030001
      00000004000000000000000000FEFEFF1A1B002A020000FF1C00000000000000
      109240010000000000000018400200000000000096C640030003000000040000
      00000000000000FEFEFF1A1B002B020000FF1C00000000000000189240010000
      0000000000F03F02000000000000B89540030001000000040000000000000000
      00FEFEFF1A1B002C020000FF1C00000000000000189240010000000000000000
      4002000000000000689E4003001300000004000000000000000000FEFEFF1A1B
      002D020000FF1C00000000000000189240010000000000000008400200000000
      00009EA24003000200000004000000000000000000FEFEFF1A1B002E020000FF
      1C000000000000001892400100000000000000104002000000000000FCA94003
      000200000004000000000000000000FEFEFF1A1B002F020000FF1C0000000000
      0000189240010000000000000014400200000000000018AA4003000200000004
      000000000000000000FEFEFF1A1B0030020000FF1C0000000000000018924001
      0000000000000018400200000000000030C24003000400000004000000000000
      000000FEFEFF1A1B0031020000FF1C0000000000000018924001000000000000
      001C400200000000000033C24003000100000004000000000000000000FEFEFF
      1A1B0032020000FF1C0000000000000018924001000000000000002040020000
      00000080B9C64003000900000004000000000000000000FEFEFF1A1B00330200
      00FF1C000000000000002092400100000000000000F03F020000000000005095
      4003000100000004000000000000000000FEFEFF1A1B0034020000FF1C000000
      000000002092400100000000000000004002000000000000B895400300020000
      0004000000000000000000FEFEFF1A1B0035020000FF1C000000000000002092
      4001000000000000000840020000000000006AA4400300020000000400000000
      0000000000FEFEFF1A1B0036020000FF1C000000000000002092400100000000
      000000104002000000000000CCB44003000400000004000000000000000000FE
      FEFF1A1B0037020000FF1C000000000000002092400100000000000000144002
      000000000000BCBD4003000300000004000000000000000000FEFEFF1A1B0038
      020000FF1C000000000000002092400100000000000000184002000000000000
      45C24003000400000004000000000000000000FEFEFF1A1B0039020000FF1C00
      0000000000002492400100000000000000F03F02000000000000808C40030001
      00000004000000000000000000FEFEFF1A1B003A020000FF1C00000000000000
      2492400100000000000000004002000000000000889440030003000000040000
      00000000000000FEFEFF1A1B003B020000FF1C00000000000000249240010000
      0000000000084002000000000000909440030001000000040000000000000000
      00FEFEFF1A1B003C020000FF1C00000000000000249240010000000000000010
      4002000000000000A0944003001400000004000000000000000000FEFEFF1A1B
      003D020000FF1C00000000000000249240010000000000000014400200000000
      000050954003000300000004000000000000000000FEFEFF1A1B003E020000FF
      1C000000000000002492400100000000000000184002000000000000B8954003
      000300000004000000000000000000FEFEFF1A1B003F020000FF1C0000000000
      000024924001000000000000001C40020000000000004EA24003000400000004
      000000000000000000FEFEFF1A1B0040020000FF1C0000000000000024924001
      000000000000002040020000000000005CA24003000300000004000000000000
      000000FEFEFF1A1B0041020000FF1C0000000000000024924001000000000000
      002240020000000000007EA24003001000000004000000000000000000FEFEFF
      1A1B0042020000FF1C0000000000000024924001000000000000002440020000
      00000000ACA24003000900000004000000000000000000FEFEFF1A1B00430200
      00FF1C00000000000000249240010000000000000026400200000000000068A4
      4003000300000004000000000000000000FEFEFF1A1B0044020000FF1C000000
      00000000249240010000000000000028400200000000000076A4400300010000
      0004000000000000000000FEFEFF1A1B0045020000FF1C000000000000002492
      4001000000000000002A4002000000000000B0A44003000E0000000400000000
      0000000000FEFEFF1A1B0046020000FF1C000000000000002492400100000000
      0000002C4002000000000000E8A94003000400000004000000000000000000FE
      FEFF1A1B0047020000FF1C0000000000000024924001000000000000002E4002
      00000000000018AA4003000300000004000000000000000000FEFEFF1A1B0048
      020000FF1C0000000000000024924001000000000000A0824002000000000000
      74AA4003000400000004000000000000000000FEFEFF1A1B0049020000FF1C00
      00000000000024924001000000000000A8824002000000000000CCB440030001
      00000004000000000000000000FEFEFF1A1B004A020000FF1C00000000000000
      24924001000000000000B0824002000000000000E5B440030001000000040000
      00000000000000FEFEFF1A1B004B020000FF1C00000000000000249240010000
      00000000B8824002000000000000ECB440030003000000040000000000000000
      00FEFEFF1A1B004C020000FF1C0000000000000024924001000000000000C082
      40020000000000000AB54003000400000004000000000000000000FEFEFF1A1B
      004D020000FF1C0000000000000024924001000000000000C882400200000000
      0000E6BD4003000300000004000000000000000000FEFEFF1A1B004E020000FF
      1C0000000000000024924001000000000000D082400200000000000030C24003
      000400000004000000000000000000FEFEFF1A1B004F020000FF1C0000000000
      000024924001000000000000D882400200000000000045C24003001300000004
      000000000000000000FEFEFF1A1B0050020000FF1C0000000000000024924001
      000000000000E0824002000000000080EAC54003000200000004000000000000
      000000FEFEFF1A1B0051020000FF1C0000000000000024924001000000000000
      E8824002000000000000F3C54003001700000004000000000000000000FEFEFF
      1A1B0052020000FF1C0000000000000024924001000000000000F08240020000
      000000007FC64003000400000004000000000000000000FEFEFF1A1B00530200
      00FF1C0000000000000024924001000000000000F882400200000000000096C6
      4003000200000004000000000000000000FEFEFF1A1B0054020000FF1C000000
      000000002492400100000000000000834002000000000000C2C6400300010000
      0004000000000000000000FEFEFF1A1B0055020000FF1C000000000000002892
      400100000000000000F03F020000000000009EA2400300020000000400000000
      0000000000FEFEFF1A1B0056020000FF1C000000000000002892400100000000
      00000000400200000000000090A44003000100000004000000000000000000FE
      FEFF1A1B0057020000FF1C000000000000002892400100000000000000084002
      000000000000B0A44003000300000004000000000000000000FEFEFF1A1B0058
      020000FF1C000000000000002892400100000000000000104002000000000000
      ECB44003001200000004000000000000000000FEFEFF1A1B0059020000FF1C00
      000000000000289240010000000000000014400200000000000032C240030003
      00000004000000000000000000FEFEFF1A1B005A020000FF1C00000000000000
      2C92400100000000000000F03F02000000000000A09440030002000000040000
      00000000000000FEFEFF1A1B005B020000FF1C00000000000000349240010000
      0000000000F03F0200000000000014A240030002000000040000000000000000
      00FEFEFF1A1B005C020000FF1C00000000000000349240010000000000000000
      4002000000000000ACA24003000100000004000000000000000000FEFEFF1A1B
      005D020000FF1C00000000000000349240010000000000000008400200000000
      000068A44003000300000004000000000000000000FEFEFF1A1B005E020000FF
      1C0000000000000034924001000000000000001040020000000000006AA44003
      000200000004000000000000000000FEFEFF1A1B005F020000FF1C0000000000
      0000349240010000000000000014400200000000000032C24003000100000004
      000000000000000000FEFEFF1A1B0060020000FF1C0000000000000034924001
      0000000000000018400200000000000045C24003000300000004000000000000
      000000FEFEFF1A1B0061020000FF1C0000000000000038924001000000000000
      00F03F02000000000000C0944003000300000004000000000000000000FEFEFF
      1A1B0062020000FF1C0000000000000038924001000000000000000040020000
      0000000050954003000100000004000000000000000000FEFEFF1A1B00630200
      00FF1C000000000000003892400100000000000000084002000000000000B895
      4003000200000004000000000000000000FEFEFF1A1B0064020000FF1C000000
      000000003892400100000000000000104002000000000000689E400300040000
      0004000000000000000000FEFEFF1A1B0065020000FF1C000000000000003892
      4001000000000000001440020000000000008CA44003000D0000000400000000
      0000000000FEFEFF1A1B0066020000FF1C000000000000003892400100000000
      00000018400200000000000014A74003001400000004000000000000000000FE
      FEFF1A1B0067020000FF1C0000000000000038924001000000000000001C4002
      000000000000CCB44003000300000004000000000000000000FEFEFF1A1B0068
      020000FF1C000000000000003892400100000000000000204002000000000000
      32C24003000F00000004000000000000000000FEFEFF1A1B0069020000FF1C00
      0000000000003892400100000000000000224002000000000000F3C540030003
      00000004000000000000000000FEFEFF1A1B006A020000FF1C00000000000000
      4092400100000000000000F03F020000000000007EA240030002000000040000
      00000000000000FEFEFF1A1B006B020000FF1C00000000000000449240010000
      0000000000F03F02000000000000808C40030003000000040000000000000000
      00FEFEFF1A1B006C020000FF1C00000000000000449240010000000000000000
      4002000000000000C8944003000400000004000000000000000000FEFEFF1A1B
      006D020000FF1C00000000000000449240010000000000000008400200000000
      0000C2A44003000900000004000000000000000000FEFEFF1A1B006E020000FF
      1C00000000000000449240010000000000000010400200000000000014A74003
      000400000004000000000000000000FEFEFF1A1B006F020000FF1C0000000000
      00004492400100000000000000144002000000000000ECB44003000200000004
      000000000000000000FEFEFF1A1B0070020000FF1C0000000000000044924001
      00000000000000184002000000000000E6BD4003000100000004000000000000
      000000FEFEFF1A1B0071020000FF1C0000000000000044924001000000000000
      001C400200000000000033C24003000100000004000000000000000000FEFEFF
      1A1B0072020000FF1C0000000000000044924001000000000000002040020000
      0000000045C24003000100000004000000000000000000FEFEFF1A1B00730200
      00FF1C000000000000004892400100000000000000F03F02000000000000689E
      4003000300000004000000000000000000FEFEFF1A1B0074020000FF1C000000
      00000000489240010000000000000000400200000000000014A2400300010000
      0004000000000000000000FEFEFF1A1B0075020000FF1C000000000000004892
      40010000000000000008400200000000000014A7400300060000000400000000
      0000000000FEFEFF1A1B0076020000FF1C000000000000004892400100000000
      000000104002000000000000C6B44003000400000004000000000000000000FE
      FEFF1A1B0077020000FF1C000000000000004892400100000000000000144002
      000000000000ECB44003000300000004000000000000000000FEFEFF1A1B0078
      020000FF1C000000000000004C92400100000000000000F03F02000000000000
      84944003000200000004000000000000000000FEFEFF1A1B0079020000FF1C00
      0000000000004C92400100000000000000004002000000000000C89440030002
      00000004000000000000000000FEFEFF1A1B007A020000FF1C00000000000000
      4C92400100000000000000084002000000000000689E40030002000000040000
      00000000000000FEFEFF1A1B007B020000FF1C000000000000004C9240010000
      0000000000104002000000000000E6BD40030002000000040000000000000000
      00FEFEFF1A1B007C020000FF1C000000000000004C9240010000000000000014
      400200000000008006C84003000100000004000000000000000000FEFEFF1A1B
      007D020000FF1C000000000000005492400100000000000000F03F0200000000
      00008CA44003000300000004000000000000000000FEFEFF1A1B007E020000FF
      1C000000000000005C92400100000000000000F03F02000000000000A0944003
      000900000004000000000000000000FEFEFF1A1B007F020000FF1C0000000000
      00005C92400100000000000000004002000000000000C3BD4003000100000004
      000000000000000000FEFEFF1A1B0080020000FF1C000000000000005C924001
      00000000000000084002000000000000E6BD4003000F00000004000000000000
      000000FEFEFF1A1B0081020000FF1C000000000000005C924001000000000000
      0010400200000000000032C24003000200000004000000000000000000FEFEFF
      1A1B0082020000FF1C000000000000005C924001000000000000001440020000
      00000080EAC54003000400000004000000000000000000FEFEFF1A1B00830200
      00FF1C000000000000005C92400100000000000000184002000000000000C2C6
      4003000300000004000000000000000000FEFEFF1A1B0084020000FF1C000000
      000000006092400100000000000000F03F0200000000000076A4400300020000
      0004000000000000000000FEFEFF1A1B0085020000FF1C000000000000006092
      400100000000000000004002000000000000B0A4400300010000000400000000
      0000000000FEFEFF1A1B0086020000FF1C000000000000006092400100000000
      00000008400200000000000032C24003000C00000004000000000000000000FE
      FEFF1A1B0087020000FF1C000000000000006092400100000000000000104002
      000000000080B9C64003000100000004000000000000000000FEFEFF1A1B0088
      020000FF1C000000000000006892400100000000000000F03F02000000000000
      208C4003000100000004000000000000000000FEFEFF1A1B0089020000FF1C00
      0000000000006892400100000000000000004002000000000000B89540030002
      00000004000000000000000000FEFEFF1A1B008A020000FF1C00000000000000
      6892400100000000000000084002000000000000CCB440030001000000040000
      00000000000000FEFEFF1A1B008B020000FF1C00000000000000689240010000
      0000000000104002000000000000BCBD40030004000000040000000000000000
      00FEFEFF1A1B008C020000FF1C00000000000000689240010000000000000014
      4002000000000000C2C64003000100000004000000000000000000FEFEFF1A1B
      008D020000FF1C00000000000000689240010000000000000018400200000000
      008006C84003000400000004000000000000000000FEFEFF1A1B008E020000FF
      1C000000000000007092400100000000000000F03F02000000000000B8954003
      001300000004000000000000000000FEFEFF1A1B008F020000FF1C0000000000
      00007092400100000000000000004002000000000000CCB44003000A00000004
      000000000000000000FEFEFF1A1B0090020000FF1C000000000000007C924001
      00000000000000F03F02000000000000808C4003000400000004000000000000
      000000FEFEFF1A1B0091020000FF1C000000000000007C924001000000000000
      000040020000000000005CA24003001900000004000000000000000000FEFEFF
      1A1B0092020000FF1C000000000000007C924001000000000000000840020000
      00000000C1B44003000400000004000000000000000000FEFEFF1A1B00930200
      00FF1C000000000000007C92400100000000000000104002000000000000BCBD
      4003000300000004000000000000000000FEFEFF1A1B0094020000FF1C000000
      000000007C924001000000000000001440020000000000007FC6400300020000
      0004000000000000000000FEFEFF1A1B0095020000FF1C00000000000000AC92
      400100000000000000F03F02000000000000208C400300010000000400000000
      0000000000FEFEFF1A1B0096020000FF1C00000000000000AC92400100000000
      00000000400200000000000090944003000300000004000000000000000000FE
      FEFF1A1B0097020000FF1C00000000000000AC92400100000000000000084002
      00000000000050954003000B00000004000000000000000000FEFEFF1A1B0098
      020000FF1C00000000000000AC92400100000000000000104002000000000000
      ACA24003000400000004000000000000000000FEFEFF1A1B0099020000FF1C00
      000000000000B092400100000000000000F03F02000000000000889440030002
      00000004000000000000000000FEFEFF1A1B009A020000FF1C00000000000000
      B092400100000000000000004002000000000000A09440030003000000040000
      00000000000000FEFEFF1A1B009B020000FF1C00000000000000B09240010000
      000000000008400200000000000074AA40030003000000040000000000000000
      00FEFEFF1A1B009C020000FF1C00000000000000B09240010000000000000010
      400200000000000032C24003000C00000004000000000000000000FEFEFF1A1B
      009D020000FF1C00000000000000B492400100000000000000F03F0200000000
      0000A0944003001400000004000000000000000000FEFEFF1A1B009E020000FF
      1C00000000000000B492400100000000000000004002000000000000089F4003
      000300000004000000000000000000FEFEFF1A1B009F020000FF1C0000000000
      0000B492400100000000000000084002000000000000ACA24003000300000004
      000000000000000000FEFEFF1A1B00A0020000FF1C00000000000000B4924001
      00000000000000104002000000000000C1B44003001600000004000000000000
      000000FEFEFF1A1B00A1020000FF1C00000000000000B4924001000000000000
      0014400200000000000033C24003000300000004000000000000000000FEFEFF
      1A1B00A2020000FF1C00000000000000B892400100000000000000F03F020000
      0000000088944003000200000004000000000000000000FEFEFF1A1B00A30200
      00FF1C00000000000000B8924001000000000000000040020000000000009094
      4003000300000004000000000000000000FEFEFF1A1B00A4020000FF1C000000
      00000000B892400100000000000000084002000000000000C094400300140000
      0004000000000000000000FEFEFF1A1B00A5020000FF1C00000000000000B892
      400100000000000000104002000000000000B895400300040000000400000000
      0000000000FEFEFF1A1B00A6020000FF1C00000000000000B892400100000000
      000000144002000000000000689E4003000100000004000000000000000000FE
      FEFF1A1B00A7020000FF1C00000000000000B892400100000000000000184002
      00000000000014A24003000300000004000000000000000000FEFEFF1A1B00A8
      020000FF1C00000000000000B8924001000000000000001C4002000000000000
      4AA24003000300000004000000000000000000FEFEFF1A1B00A9020000FF1C00
      000000000000B8924001000000000000002040020000000000004EA240030004
      00000004000000000000000000FEFEFF1A1B00AA020000FF1C00000000000000
      B8924001000000000000002240020000000000007EA240030003000000040000
      00000000000000FEFEFF1A1B00AB020000FF1C00000000000000B89240010000
      0000000000244002000000000000ACA240030001000000040000000000000000
      00FEFEFF1A1B00AC020000FF1C00000000000000B89240010000000000000026
      400200000000000068A44003000100000004000000000000000000FEFEFF1A1B
      00AD020000FF1C00000000000000B89240010000000000000028400200000000
      000076A44003001100000004000000000000000000FEFEFF1A1B00AE020000FF
      1C00000000000000B8924001000000000000002A4002000000000000C2A44003
      000200000004000000000000000000FEFEFF1A1B00AF020000FF1C0000000000
      0000B8924001000000000000002C4002000000000000E8A94003000300000004
      000000000000000000FEFEFF1A1B00B0020000FF1C00000000000000B8924001
      000000000000002E400200000000000018AA4003000300000004000000000000
      000000FEFEFF1A1B00B1020000FF1C00000000000000B8924001000000000000
      70864002000000000000E5B44003000200000004000000000000000000FEFEFF
      1A1B00B2020000FF1C00000000000000B8924001000000000000788640020000
      00000000ECB44003000200000004000000000000000000FEFEFF1A1B00B30200
      00FF1C00000000000000B89240010000000000008086400200000000000002B5
      4003001600000004000000000000000000FEFEFF1A1B00B4020000FF1C000000
      00000000B89240010000000000008886400200000000000030C2400300020000
      0004000000000000000000FEFEFF1A1B00B5020000FF1C00000000000000B892
      40010000000000009086400200000000000033C2400300040000000400000000
      0000000000FEFEFF1A1B00B6020000FF1C00000000000000B892400100000000
      000098864002000000000000F3C54003000100000004000000000000000000FE
      FEFF1A1B00B7020000FF1C00000000000000B8924001000000000000A0864002
      0000000000007FC64003001800000004000000000000000000FEFEFF1A1B00B8
      020000FF1C00000000000000B8924001000000000000A8864002000000000000
      C2C64003000400000004000000000000000000FEFEFF1A1B00B9020000FF1C00
      000000000000BC92400100000000000000F03F020000000000006AA440030004
      00000004000000000000000000FEFEFF1A1B00BA020000FF1C00000000000000
      C092400100000000000000F03F02000000000000C09440030003000000040000
      00000000000000FEFEFF1A1B00BB020000FF1C00000000000000C09240010000
      000000000000400200000000000030C240030003000000040000000000000000
      00FEFEFF1A1B00BC020000FF1C00000000000000C492400100000000000000F0
      3F0200000000000050954003000300000004000000000000000000FEFEFF1A1B
      00BD020000FF1C00000000000000C49240010000000000000000400200000000
      0000B8954003000400000004000000000000000000FEFEFF1A1B00BE020000FF
      1C00000000000000C49240010000000000000008400200000000000032C24003
      001400000004000000000000000000FEFEFF1A1B00BF020000FF1C0000000000
      0000C892400100000000000000F03F02000000000000FCA94003000C00000004
      000000000000000000FEFEFF1A1B00C0020000FF1C00000000000000C8924001
      0000000000000000400200000000000032C24003000200000004000000000000
      000000FEFEFF1A1B00C1020000FF1C00000000000000C8924001000000000000
      0008400200000000000033C24003000100000004000000000000000000FEFEFF
      1A1B00C2020000FF1C00000000000000D092400100000000000000F03F020000
      00000000808C4003000200000004000000000000000000FEFEFF1A1B00C30200
      00FF1C00000000000000D0924001000000000000000040020000000000005095
      4003000B00000004000000000000000000FEFEFF1A1B00C4020000FF1C000000
      00000000D09240010000000000000008400200000000000068A4400300040000
      0004000000000000000000FEFEFF1A1B00C5020000FF1C00000000000000D092
      400100000000000000104002000000000000C6B4400300010000000400000000
      0000000000FEFEFF1A1B00C6020000FF1C00000000000000D092400100000000
      000000144002000000000000CCB44003000100000004000000000000000000FE
      FEFF1A1B00C7020000FF1C00000000000000D092400100000000000000184002
      00000000000032C24003000400000004000000000000000000FEFEFF1A1B00C8
      020000FF1C00000000000000D0924001000000000000001C4002000000000080
      06C84003000400000004000000000000000000FEFEFF1A1B00C9020000FF1C00
      000000000000D492400100000000000000F03F02000000000000808C40030001
      00000004000000000000000000FEFEFF1A1B00CA020000FF1C00000000000000
      D4924001000000000000000040020000000000004EA240030001000000040000
      00000000000000FEFEFF1A1B00CB020000FF1C00000000000000D49240010000
      00000000000840020000000000009EA240030003000000040000000000000000
      00FEFEFF1A1B00CC020000FF1C00000000000000D49240010000000000000010
      400200000000000076A44003000100000004000000000000000000FEFEFF1A1B
      00CD020000FF1C00000000000000D49240010000000000000014400200000000
      00000AB54003000100000004000000000000000000FEFEFF1A1B00CE020000FF
      1C00000000000000D492400100000000000000184002000000000000BCBD4003
      000400000004000000000000000000FEFEFF1A1B00CF020000FF1C0000000000
      0000D4924001000000000000001C4002000000000000C3BD4003000400000004
      000000000000000000FEFEFF1A1B00D0020000FF1C00000000000000D4924001
      0000000000000020400200000000000030C24003000300000004000000000000
      000000FEFEFF1A1B00D1020000FF1C00000000000000DC924001000000000000
      00F03F02000000000000208C4003000200000004000000000000000000FEFEFF
      1A1B00D2020000FF1C00000000000000DC924001000000000000000040020000
      00000000089F4003000200000004000000000000000000FEFEFF1A1B00D30200
      00FF1C00000000000000DC92400100000000000000084002000000000000C3BD
      4003000300000004000000000000000000FEFEFF1A1B00D4020000FF1C000000
      00000000DC92400100000000000000104002000000000000E6BD400300030000
      0004000000000000000000FEFEFF1A1B00D5020000FF1C00000000000000DC92
      400100000000000000144002000000000000F3C5400300030000000400000000
      0000000000FEFEFF1A1B00D6020000FF1C00000000000000E492400100000000
      000000F03F02000000000000ACA24003001500000004000000000000000000FE
      FEFF1A1B00D7020000FF1C00000000000000E492400100000000000000004002
      000000000000E8A94003000300000004000000000000000000FEFEFF1A1B00D8
      020000FF1C00000000000000E492400100000000000000084002000000000000
      E5B44003001200000004000000000000000000FEFEFF1A1B00D9020000FF1C00
      000000000000E492400100000000000000104002000000000000E6BD40030002
      00000004000000000000000000FEFEFF1A1B00DA020000FF1C00000000000000
      E492400100000000000000144002000000000080EAC540030003000000040000
      00000000000000FEFEFF1A1B00DB020000FF1C00000000000000E49240010000
      000000000018400200000000008007C840030003000000040000000000000000
      00FEFEFF1A1B00DC020000FF1C00000000000000F092400100000000000000F0
      3F0200000000000076A44003001900000004000000000000000000FEFEFF1A1B
      00DD020000FF1C00000000000000F09240010000000000000000400200000000
      00008CA44003000200000004000000000000000000FEFEFF1A1B00DE020000FF
      1C00000000000000F092400100000000000000084002000000000000B0A44003
      000200000004000000000000000000FEFEFF1A1B00DF020000FF1C0000000000
      0000F0924001000000000000001040020000000000000AB54003000200000004
      000000000000000000FEFEFF1A1B00E0020000FF1C00000000000000F0924001
      0000000000000014400200000000000030C24003001100000004000000000000
      000000FEFEFF1A1B00E1020000FF1C00000000000000FC924001000000000000
      00F03F0200000000000076A44003000200000004000000000000000000FEFEFF
      1A1B00E2020000FF1C00000000000000FC924001000000000000000040020000
      0000000090A44003000400000004000000000000000000FEFEFF1A1B00E30200
      00FF1C00000000000000FC92400100000000000000084002000000000000B0A4
      4003000100000004000000000000000000FEFEFF1A1B00E4020000FF1C000000
      00000000FC92400100000000000000104002000000000000BCBD4003000B0000
      0004000000000000000000FEFEFF1A1B00E5020000FF1C00000000000000FC92
      400100000000000000144002000000000000C3BD400300180000000400000000
      0000000000FEFEFF1A1B00E6020000FF1C00000000000000FC92400100000000
      000000184002000000000000F3C54003000100000004000000000000000000FE
      FEFF1A1B00E7020000FF1C00000000000000FC924001000000000000001C4002
      000000000080B9C64003000400000004000000000000000000FEFEFF1A1B00E8
      020000FF1C000000000000000493400100000000000000F03F02000000000000
      208C4003001200000004000000000000000000FEFEFF1A1B00E9020000FF1C00
      0000000000000493400100000000000000004002000000000000B89540030003
      00000004000000000000000000FEFEFF1A1B00EA020000FF1C00000000000000
      0493400100000000000000084002000000000000ACA240030003000000040000
      00000000000000FEFEFF1A1B00EB020000FF1C00000000000000049340010000
      0000000000104002000000000000B0A440030010000000040000000000000000
      00FEFEFF1A1B00EC020000FF1C00000000000000049340010000000000000014
      4002000000000080EAC54003000300000004000000000000000000FEFEFF1A1B
      00ED020000FF1C00000000000000049340010000000000000018400200000000
      0000C2C64003000400000004000000000000000000FEFEFF1A1B00EE020000FF
      1C000000000000001493400100000000000000F03F0200000000000090944003
      000400000004000000000000000000FEFEFF1A1B00EF020000FF1C0000000000
      0000149340010000000000000000400200000000008007C84003000100000004
      000000000000000000FEFEFF1A1B00F0020000FF1C0000000000000088934001
      00000000000000F03F02000000000000208C4003000200000004000000000000
      000000FEFEFF1A1B00F1020000FF1C0000000000000088934001000000000000
      00004002000000000000808C4003000300000004000000000000000000FEFEFF
      1A1B00F2020000FF1C0000000000000088934001000000000000000840020000
      0000000088944003000400000004000000000000000000FEFEFF1A1B00F30200
      00FF1C0000000000000088934001000000000000001040020000000000009094
      4003000400000004000000000000000000FEFEFF1A1B00F4020000FF1C000000
      000000008893400100000000000000144002000000000000A094400300100000
      0004000000000000000000FEFEFF1A1B00F5020000FF1C000000000000008893
      400100000000000000184002000000000000C894400300040000000400000000
      0000000000FEFEFF1A1B00F6020000FF1C000000000000008893400100000000
      0000001C400200000000000050954003000200000004000000000000000000FE
      FEFF1A1B00F7020000FF1C000000000000008893400100000000000000204002
      000000000000B8954003000400000004000000000000000000FEFEFF1A1B00F8
      020000FF1C000000000000008893400100000000000000224002000000000000
      689E4003000200000004000000000000000000FEFEFF1A1B00F9020000FF1C00
      000000000000889340010000000000000024400200000000000014A240030001
      00000004000000000000000000FEFEFF1A1B00FA020000FF1C00000000000000
      88934001000000000000002640020000000000004AA240030004000000040000
      00000000000000FEFEFF1A1B00FB020000FF1C00000000000000889340010000
      00000000002840020000000000004EA240030004000000040000000000000000
      00FEFEFF1A1B00FC020000FF1C0000000000000088934001000000000000002A
      40020000000000005CA24003000100000004000000000000000000FEFEFF1A1B
      00FD020000FF1C0000000000000088934001000000000000002C400200000000
      00009EA24003000100000004000000000000000000FEFEFF1A1B00FE020000FF
      1C0000000000000088934001000000000000002E40020000000000006AA44003
      000B00000004000000000000000000FEFEFF1A1B00FF020000FF1C0000000000
      000088934001000000000000E088400200000000000076A44003000200000004
      000000000000000000FEFEFF1A1B0000030000FF1C0000000000000088934001
      000000000000E88840020000000000008CA44003000900000004000000000000
      000000FEFEFF1A1B0001030000FF1C0000000000000088934001000000000000
      F0884002000000000000C2A44003000300000004000000000000000000FEFEFF
      1A1B0002030000FF1C0000000000000088934001000000000000F88840020000
      00000000FCA94003000400000004000000000000000000FEFEFF1A1B00030300
      00FF1C00000000000000889340010000000000000089400200000000000018AA
      4003000400000004000000000000000000FEFEFF1A1B0004030000FF1C000000
      00000000889340010000000000000889400200000000000074AA400300010000
      0004000000000000000000FEFEFF1A1B0005030000FF1C000000000000008893
      400100000000000010894002000000000000C6B4400300080000000400000000
      0000000000FEFEFF1A1B0006030000FF1C000000000000008893400100000000
      000018894002000000000000CCB44003000100000004000000000000000000FE
      FEFF1A1B0007030000FF1C000000000000008893400100000000000020894002
      000000000000BCBD4003000200000004000000000000000000FEFEFF1A1B0008
      030000FF1C000000000000008893400100000000000028894002000000000000
      30C24003000200000004000000000000000000FEFEFF1A1B0009030000FF1C00
      000000000000889340010000000000003089400200000000000033C240030004
      00000004000000000000000000FEFEFF1A1B000A030000FF1C00000000000000
      889340010000000000003889400200000000000045C240030003000000040000
      00000000000000FEFEFF1A1B000B030000FF1C00000000000000889340010000
      0000000040894002000000000080EAC540030004000000040000000000000000
      00FEFEFF1A1B000C030000FF1C00000000000000889340010000000000004889
      4002000000000080B9C64003000400000004000000000000000000FEFEFF1A1B
      000D030000FF1C00000000000000889340010000000000005089400200000000
      0000C2C64003000200000004000000000000000000FEFEFF1A1B000E030000FF
      1C00000000000000889340010000000000005889400200000000008006C84003
      000800000004000000000000000000FEFEFF1A1B000F030000FF1C0000000000
      0000889340010000000000006089400200000000008007C84003000300000004
      000000000000000000FEFEFF1A1B0010030000FF1C0000000000000094934001
      00000000000000F03F02000000000000B8954003001300000004000000000000
      000000FEFEFF1A1B0011030000FF1C0000000000000094934001000000000000
      000040020000000000004AA24003000D00000004000000000000000000FEFEFF
      1A1B0012030000FF1C0000000000000094934001000000000000000840020000
      00000000E6BD4003000300000004000000000000000000FEFEFF1A1B00130300
      00FF1C000000000000009C93400100000000000000F03F02000000000000208C
      4003001900000004000000000000000000FEFEFF1A1B0014030000FF1C000000
      000000009C93400100000000000000004002000000000000A094400300020000
      0004000000000000000000FEFEFF1A1B0015030000FF1C000000000000009C93
      400100000000000000084002000000000000B895400300040000000400000000
      0000000000FEFEFF1A1B0016030000FF1C000000000000009C93400100000000
      0000001040020000000000009EA24003001500000004000000000000000000FE
      FEFF1A1B0017030000FF1C000000000000009C93400100000000000000144002
      000000000000ACA24003000400000004000000000000000000FEFEFF1A1B0018
      030000FF1C000000000000009C93400100000000000000184002000000000000
      8CA44003000300000004000000000000000000FEFEFF1A1B0019030000FF1C00
      0000000000009C934001000000000000001C4002000000000000C6B440030019
      00000004000000000000000000FEFEFF1A1B001A030000FF1C00000000000000
      9C9340010000000000000020400200000000008007C840030001000000040000
      00000000000000FEFEFF1A1B001B030000FF1C00000000000000B09340010000
      0000000000F03F02000000000000C2A440030015000000040000000000000000
      00FEFEFF1A1B001C030000FF1C00000000000000B09340010000000000000000
      400200000000000014A74003000100000004000000000000000000FEFEFF1A1B
      001D030000FF1C00000000000000B09340010000000000000008400200000000
      000018AA4003000100000004000000000000000000FEFEFF1A1B001E030000FF
      1C00000000000000B093400100000000000000104002000000000000C1B44003
      001800000004000000000000000000FEFEFF1A1B001F030000FF1C0000000000
      0000B093400100000000000000144002000000000000C6B44003000300000004
      000000000000000000FEFEFF1A1B0020030000FF1C00000000000000B4934001
      00000000000000F03F020000000000007FC64003000100000004000000000000
      000000FEFEFF1A1B0021030000FF1C00000000000000BC934001000000000000
      00F03F02000000000000808C4003000100000004000000000000000000FEFEFF
      1A1B0022030000FF1C00000000000000BC934001000000000000000040020000
      0000000084944003000100000004000000000000000000FEFEFF1A1B00230300
      00FF1C00000000000000BC934001000000000000000840020000000000008894
      4003000400000004000000000000000000FEFEFF1A1B0024030000FF1C000000
      00000000BC934001000000000000001040020000000000009094400300020000
      0004000000000000000000FEFEFF1A1B0025030000FF1C00000000000000BC93
      400100000000000000144002000000000000A094400300010000000400000000
      0000000000FEFEFF1A1B0026030000FF1C00000000000000BC93400100000000
      000000184002000000000000C0944003000100000004000000000000000000FE
      FEFF1A1B0027030000FF1C00000000000000BC934001000000000000001C4002
      000000000000C8944003000E00000004000000000000000000FEFEFF1A1B0028
      030000FF1C00000000000000BC93400100000000000000204002000000000000
      50954003000300000004000000000000000000FEFEFF1A1B0029030000FF1C00
      000000000000BC93400100000000000000224002000000000000B89540030002
      00000004000000000000000000FEFEFF1A1B002A030000FF1C00000000000000
      BC93400100000000000000244002000000000000089F40030019000000040000
      00000000000000FEFEFF1A1B002B030000FF1C00000000000000BC9340010000
      000000000026400200000000000014A24003000A000000040000000000000000
      00FEFEFF1A1B002C030000FF1C00000000000000BC9340010000000000000028
      40020000000000004AA24003000100000004000000000000000000FEFEFF1A1B
      002D030000FF1C00000000000000BC934001000000000000002A400200000000
      00005CA24003000100000004000000000000000000FEFEFF1A1B002E030000FF
      1C00000000000000BC934001000000000000002C40020000000000009EA24003
      001900000004000000000000000000FEFEFF1A1B002F030000FF1C0000000000
      0000BC934001000000000000002E4002000000000000ACA24003000100000004
      000000000000000000FEFEFF1A1B0030030000FF1C00000000000000BC934001
      000000000000688A40020000000000006AA44003000300000004000000000000
      000000FEFEFF1A1B0031030000FF1C00000000000000BC934001000000000000
      708A400200000000000090A44003000300000004000000000000000000FEFEFF
      1A1B0032030000FF1C00000000000000BC934001000000000000788A40020000
      0000000014A74003000200000004000000000000000000FEFEFF1A1B00330300
      00FF1C00000000000000BC934001000000000000808A4002000000000000E8A9
      4003001800000004000000000000000000FEFEFF1A1B0034030000FF1C000000
      00000000BC934001000000000000888A4002000000000000FCA9400300010000
      0004000000000000000000FEFEFF1A1B0035030000FF1C00000000000000BC93
      4001000000000000908A400200000000000074AA400300010000000400000000
      0000000000FEFEFF1A1B0036030000FF1C00000000000000BC93400100000000
      0000988A4002000000000000C1B44003000100000004000000000000000000FE
      FEFF1A1B0037030000FF1C00000000000000BC934001000000000000A08A4002
      000000000000C6B44003000100000004000000000000000000FEFEFF1A1B0038
      030000FF1C00000000000000BC934001000000000000A88A4002000000000000
      CCB44003000300000004000000000000000000FEFEFF1A1B0039030000FF1C00
      000000000000BC934001000000000000B08A4002000000000000E5B440030004
      00000004000000000000000000FEFEFF1A1B003A030000FF1C00000000000000
      BC934001000000000000B88A4002000000000000ECB440030001000000040000
      00000000000000FEFEFF1A1B003B030000FF1C00000000000000BC9340010000
      00000000C08A400200000000000002B540030002000000040000000000000000
      00FEFEFF1A1B003C030000FF1C00000000000000BC934001000000000000C88A
      4002000000000000BCBD4003000100000004000000000000000000FEFEFF1A1B
      003D030000FF1C00000000000000BC934001000000000000D08A400200000000
      0000C3BD4003000400000004000000000000000000FEFEFF1A1B003E030000FF
      1C00000000000000BC934001000000000000D88A400200000000000032C24003
      000400000004000000000000000000FEFEFF1A1B003F030000FF1C0000000000
      0000BC934001000000000000E08A400200000000000033C24003001000000004
      000000000000000000FEFEFF1A1B0040030000FF1C00000000000000BC934001
      000000000000E88A4002000000000000F3C54003000D00000004000000000000
      000000FEFEFF1A1B0041030000FF1C00000000000000BC934001000000000000
      F08A40020000000000007FC64003000100000004000000000000000000FEFEFF
      1A1B0042030000FF1C00000000000000BC934001000000000000F88A40020000
      0000000096C64003001600000004000000000000000000FEFEFF1A1B00430300
      00FF1C00000000000000BC934001000000000000008B4002000000000080B9C6
      4003000100000004000000000000000000FEFEFF1A1B0044030000FF1C000000
      00000000BC934001000000000000088B400200000000008006C84003000F0000
      0004000000000000000000FEFEFF1A1B0045030000FF1C00000000000000C893
      400100000000000000F03F020000000000008894400300130000000400000000
      0000000000FEFEFF1A1B0046030000FF1C00000000000000D493400100000000
      000000F03F0200000000000002B54003001400000004000000000000000000FE
      FEFF1A1B0047030000FF1C00000000000000DC93400100000000000000F03F02
      0000000000007EA24003000100000004000000000000000000FEFEFF1A1B0048
      030000FF1C00000000000000DC93400100000000000000004002000000000000
      C2A44003000E00000004000000000000000000FEFEFF1A1B0049030000FF1C00
      000000000000EC93400100000000000000F03F02000000000000A09440030003
      00000004000000000000000000FEFEFF1A1B004A030000FF1C00000000000000
      EC93400100000000000000004002000000000000C89440030002000000040000
      00000000000000FEFEFF1A1B004B030000FF1C00000000000000EC9340010000
      00000000000840020000000000007EA240030001000000040000000000000000
      00FEFEFF1A1B004C030000FF1C00000000000000EC9340010000000000000010
      4002000000000000ACA24003000200000004000000000000000000FEFEFF1A1B
      004D030000FF1C00000000000000EC9340010000000000000014400200000000
      000076A44003000200000004000000000000000000FEFEFF1A1B004E030000FF
      1C00000000000000EC934001000000000000001840020000000000008CA44003
      000400000004000000000000000000FEFEFF1A1B004F030000FF1C0000000000
      0000EC934001000000000000001C400200000000000090A44003000300000004
      000000000000000000FEFEFF1A1B0050030000FF1C00000000000000EC934001
      00000000000000204002000000000000B0A44003000300000004000000000000
      000000FEFEFF1A1B0051030000FF1C00000000000000EC934001000000000000
      00224002000000000000C2A44003000100000004000000000000000000FEFEFF
      1A1B0052030000FF1C00000000000000EC934001000000000000002440020000
      0000000018AA4003001700000004000000000000000000FEFEFF1A1B00530300
      00FF1C00000000000000EC9340010000000000000026400200000000000002B5
      4003000200000004000000000000000000FEFEFF1A1B0054030000FF1C000000
      00000000EC9340010000000000000028400200000000000030C2400300010000
      0004000000000000000000FEFEFF1A1B0055030000FF1C00000000000000EC93
      4001000000000000002A4002000000000000C2C6400300080000000400000000
      0000000000FEFEFF1A1B0056030000FF1C00000000000000EC93400100000000
      0000002C400200000000008006C84003000300000004000000000000000000FE
      FEFF1A1B0057030000FF1C00000000000000F893400100000000000000F03F02
      000000000000E8A94003000400000004000000000000000000FEFEFF1A1B0058
      030000FF1C00000000000000F893400100000000000000004002000000000000
      ECB44003000300000004000000000000000000FEFEFF1A1B0059030000FF1C00
      000000000000F89340010000000000000008400200000000000030C240030004
      00000004000000000000000000FEFEFF1A1B005A030000FF1C00000000000000
      F89340010000000000000010400200000000000033C24003000F000000040000
      00000000000000FEFEFF1A1B005B030000FF1C00000000000000F89340010000
      00000000001440020000000000007FC640030003000000040000000000000000
      00FEFEFF1A1B005C030000FF1C000000000000000094400100000000000000F0
      3F0200000000000014A74003000200000004000000000000000000FEFEFF1A1B
      005D030000FF1C00000000000000009440010000000000000000400200000000
      0000C3BD4003000200000004000000000000000000FEFEFF1A1B005E030000FF
      1C000000000000000094400100000000000000084002000000000000E6BD4003
      000300000004000000000000000000FEFEFF1A1B005F030000FF1C0000000000
      00000094400100000000000000104002000000000000F3C54003000100000004
      000000000000000000FEFEFF1A1B0060030000FF1C000000000000000C944001
      00000000000000F03F0200000000000090944003000400000004000000000000
      000000FEFEFF1A1B0061030000FF1C000000000000000C944001000000000000
      00004002000000000000C0944003000200000004000000000000000000FEFEFF
      1A1B0062030000FF1C000000000000000C944001000000000000000840020000
      0000000018AA4003000400000004000000000000000000FEFEFF1A1B00630300
      00FF1C000000000000000C94400100000000000000104002000000000000ECB4
      4003000800000004000000000000000000FEFEFF1A1B0064030000FF1C000000
      000000000C9440010000000000000014400200000000000033C24003000D0000
      0004000000000000000000FEFEFF1A1B0065030000FF1C000000000000000C94
      40010000000000000018400200000000000045C2400300010000000400000000
      0000000000FEFEFF1A1B0066030000FF1C000000000000003094400100000000
      000000F03F02000000000000C8944003000E00000004000000000000000000FE
      FEFF1A1B0067030000FF1C000000000000003094400100000000000000004002
      00000000000050954003000400000004000000000000000000FEFEFF1A1B0068
      030000FF1C000000000000003094400100000000000000084002000000000000
      68A44003000200000004000000000000000000FEFEFF1A1B0069030000FF1C00
      00000000000030944001000000000000001040020000000000008CA44003000E
      00000004000000000000000000FEFEFF1A1B006A030000FF1C00000000000000
      3094400100000000000000144002000000000000E5B440030002000000040000
      00000000000000FEFEFF1A1B006B030000FF1C00000000000000309440010000
      000000000018400200000000000002B540030002000000040000000000000000
      00FEFEFF1A1B006C030000FF1C0000000000000030944001000000000000001C
      40020000000000000AB54003000100000004000000000000000000FEFEFF1A1B
      006D030000FF1C00000000000000309440010000000000000020400200000000
      000033C24003000200000004000000000000000000FEFEFF1A1B006E030000FF
      1C00000000000000309440010000000000000022400200000000008007C84003
      000300000004000000000000000000FEFEFF1A1B006F030000FF1C0000000000
      00003894400100000000000000F03F0200000000000084944003000200000004
      000000000000000000FEFEFF1A1B0070030000FF1C0000000000000038944001
      00000000000000004002000000000000C0944003000200000004000000000000
      000000FEFEFF1A1B0071030000FF1C0000000000000038944001000000000000
      00084002000000000000C2A44003000100000004000000000000000000FEFEFF
      1A1B0072030000FF1C0000000000000038944001000000000000001040020000
      00000000C6B44003000100000004000000000000000000FEFEFF1A1B00730300
      00FF1C000000000000003894400100000000000000144002000000000000ECB4
      4003001900000004000000000000000000FEFEFF1A1B0074030000FF1C000000
      000000003894400100000000000000184002000000000000E6BD400300020000
      0004000000000000000000FEFEFF1A1B0075030000FF1C000000000000003C94
      400100000000000000F03F02000000000000C894400300040000000400000000
      0000000000FEFEFF1A1B0076030000FF1C000000000000003C94400100000000
      0000000040020000000000004EA24003000100000004000000000000000000FE
      FEFF1A1B0077030000FF1C000000000000003C94400100000000000000084002
      00000000000014A74003000400000004000000000000000000FEFEFF1A1B0078
      030000FF1C000000000000003C94400100000000000000104002000000000000
      E8A94003000600000004000000000000000000FEFEFF1A1B0079030000FF1C00
      0000000000003C94400100000000000000144002000000000000F3C540030004
      00000004000000000000000000FEFEFF1A1B007A030000FF1C00000000000000
      3C9440010000000000000018400200000000008007C840030002000000040000
      00000000000000FEFEFF1A1B007B030000FF1C00000000000000409440010000
      0000000000F03F02000000000000C09440030003000000040000000000000000
      00FEFEFF1A1B007C030000FF1C00000000000000409440010000000000000000
      4002000000000000C8944003000300000004000000000000000000FEFEFF1A1B
      007D030000FF1C00000000000000409440010000000000000008400200000000
      000076A44003000300000004000000000000000000FEFEFF1A1B007E030000FF
      1C0000000000000040944001000000000000001040020000000000000AB54003
      001800000004000000000000000000FEFEFF1A1B007F030000FF1C0000000000
      00004094400100000000000000144002000000000000C3BD4003000A00000004
      000000000000000000FEFEFF1A1B0080030000FF1C0000000000000040944001
      0000000000000018400200000000000030C24003000100000004000000000000
      000000FEFEFF1A1B0081030000FF1C0000000000000040944001000000000000
      001C400200000000000032C24003000100000004000000000000000000FEFEFF
      1A1B0082030000FF1C0000000000000040944001000000000000002040020000
      0000000033C24003000600000004000000000000000000FEFEFF1A1B00830300
      00FF1C000000000000004894400100000000000000F03F0200000000000096C6
      4003000300000004000000000000000000FEFEFF1A1B0084030000FF1C000000
      000000005094400100000000000000F03F0200000000000090A4400300040000
      0004000000000000000000FEFEFF1A1B0085030000FF1C000000000000005094
      400100000000000000004002000000000000C6B44003000E0000000400000000
      0000000000FEFEFF1A1B0086030000FF1C000000000000005094400100000000
      000000084002000000000000E6BD4003000100000004000000000000000000FE
      FEFF1A1B0087030000FF1C000000000000005094400100000000000000104002
      00000000000033C24003000200000004000000000000000000FEFEFF1A1B0088
      030000FF1C000000000000005094400100000000000000144002000000000000
      45C24003000300000004000000000000000000FEFEFF1A1B0089030000FF1C00
      00000000000050944001000000000000001840020000000000007FC640030018
      00000004000000000000000000FEFEFF1A1B008A030000FF1C00000000000000
      50944001000000000000001C400200000000008007C840030003000000040000
      00000000000000FEFEFF1A1B008B030000FF1C00000000000000589440010000
      0000000000F03F02000000000000808C40030002000000040000000000000000
      00FEFEFF1A1B008C030000FF1C00000000000000589440010000000000000000
      400200000000000088944003000200000004000000000000000000FEFEFF1A1B
      008D030000FF1C00000000000000589440010000000000000008400200000000
      0000C8944003000100000004000000000000000000FEFEFF1A1B008E030000FF
      1C0000000000000058944001000000000000001040020000000000004AA24003
      000200000004000000000000000000FEFEFF1A1B008F030000FF1C0000000000
      000058944001000000000000001440020000000000008CA44003000200000004
      000000000000000000FEFEFF1A1B0090030000FF1C0000000000000058944001
      00000000000000184002000000000000F3C54003000400000004000000000000
      000000FEFEFF1A1B0091030000FF1C0000000000000058944001000000000000
      001C400200000000000096C64003000300000004000000000000000000FEFEFF
      1A1B0092030000FF1C000000000000006494400100000000000000F03F020000
      0000000088944003000100000004000000000000000000FEFEFF1A1B00930300
      00FF1C0000000000000064944001000000000000000040020000000000004AA2
      4003001600000004000000000000000000FEFEFF1A1B0094030000FF1C000000
      00000000649440010000000000000008400200000000000033C2400300020000
      0004000000000000000000FEFEFF1A1B0095030000FF1C000000000000007494
      400100000000000000F03F020000000000008CA44003000F0000000400000000
      0000000000FEFEFF1A1B0096030000FF1C000000000000007494400100000000
      00000000400200000000000033C24003000100000004000000000000000000FE
      FEFF1A1B0097030000FF1C000000000000008C94400100000000000000F03F02
      0000000000004AA24003000400000004000000000000000000FEFEFF1A1B0098
      030000FF1C000000000000008C94400100000000000000004002000000000000
      4EA24003000300000004000000000000000000FEFEFF1A1B0099030000FF1C00
      0000000000008C944001000000000000000840020000000000005CA240030002
      00000004000000000000000000FEFEFF1A1B009A030000FF1C00000000000000
      8C944001000000000000001040020000000000007EA240030004000000040000
      00000000000000FEFEFF1A1B009B030000FF1C000000000000008C9440010000
      0000000000144002000000000000C6B440030012000000040000000000000000
      00FEFEFF1A1B009C030000FF1C000000000000008C9440010000000000000018
      4002000000000000CCB44003000300000004000000000000000000FEFEFF1A1B
      009D030000FF1C000000000000008C944001000000000000001C400200000000
      0000F3C54003000100000004000000000000000000FEFEFF1A1B009E030000FF
      1C000000000000009494400100000000000000F03F0200000000000014A24003
      001000000004000000000000000000FEFEFF1A1B009F030000FF1C0000000000
      000094944001000000000000000040020000000000004EA24003000400000004
      000000000000000000FEFEFF1A1B00A0030000FF1C0000000000000094944001
      000000000000000840020000000000008CA44003000400000004000000000000
      000000FEFEFF1A1B00A1030000FF1C0000000000000094944001000000000000
      001040020000000000000AB54003000400000004000000000000000000FEFEFF
      1A1B00A2030000FF1C000000000000001895400100000000000000F03F020000
      0000000090944003001100000004000000000000000000FEFEFF1A1B00A30300
      00FF1C000000000000001895400100000000000000004002000000000000C094
      4003000100000004000000000000000000FEFEFF1A1B00A4030000FF1C000000
      0000000018954001000000000000000840020000000000005095400300030000
      0004000000000000000000FEFEFF1A1B00A5030000FF1C000000000000001895
      4001000000000000001040020000000000004EA2400300030000000400000000
      0000000000FEFEFF1A1B00A6030000FF1C000000000000001895400100000000
      000000144002000000000000C1B44003000100000004000000000000000000FE
      FEFF1A1B00A7030000FF1C000000000000001895400100000000000000184002
      000000000000C6B44003000100000004000000000000000000FEFEFF1A1B00A8
      030000FF1C0000000000000018954001000000000000001C4002000000000000
      E5B44003000400000004000000000000000000FEFEFF1A1B00A9030000FF1C00
      0000000000001895400100000000000000204002000000000080B9C640030007
      00000004000000000000000000FEFEFF1A1B00AA030000FF1C00000000000000
      2C95400100000000000000F03F02000000000000C09440030002000000040000
      00000000000000FEFEFF1A1B00AB030000FF1C000000000000002C9540010000
      000000000000400200000000000014A740030001000000040000000000000000
      00FEFEFF1A1B00AC030000FF1C000000000000002C9540010000000000000008
      4002000000000000E8A94003000100000004000000000000000000FEFEFF1A1B
      00AD030000FF1C000000000000002C9540010000000000000010400200000000
      000030C24003000100000004000000000000000000FEFEFF1A1B00AE030000FF
      1C000000000000002C95400100000000000000144002000000000000F3C54003
      000400000004000000000000000000FEFEFF1A1B00AF030000FF1C0000000000
      00002C9540010000000000000018400200000000008006C84003000300000004
      000000000000000000FEFEFF1A1B00B0030000FF1C00000000000000109D4001
      00000000000000F03F02000000000000E5B44003000100000004000000000000
      000000FEFEFEFEFEFF1DFEFF1E1F007E040000FF20FEFEFE0E004D0061006E00
      61006700650072001E0055007000640061007400650073005200650067006900
      730074007200790012005400610062006C0065004C006900730074000A005400
      610062006C00650008004E0061006D006500140053006F007500720063006500
      4E0061006D0065000A0054006100620049004400240045006E0066006F007200
      6300650043006F006E00730074007200610069006E00740073001E004D006900
      6E0069006D0075006D0043006100700061006300690074007900180043006800
      650063006B004E006F0074004E0075006C006C00140043006F006C0075006D00
      6E004C006900730074000C0043006F006C0075006D006E00100053006F007500
      7200630065004900440010006400740044006F00750062006C00650010004400
      6100740061005400790070006500140053006500610072006300680061006200
      6C006500120041006C006C006F0077004E0075006C006C000800420061007300
      650014004F0041006C006C006F0077004E0075006C006C0012004F0049006E00
      55007000640061007400650010004F0049006E00570068006500720065001A00
      4F0072006900670069006E0043006F006C004E0061006D0065000E0064007400
      49006E007400330032001C0043006F006E00730074007200610069006E007400
      4C00690073007400100056006900650077004C006900730074000E0052006F00
      77004C00690073007400060052006F0077000A0052006F007700490044001000
      4F0072006900670069006E0061006C001800520065006C006100740069006F00
      6E004C006900730074001C0055007000640061007400650073004A006F007500
      72006E0061006C001200530061007600650050006F0069006E0074000E004300
      680061006E00670065007300}
  end
  object frxDBItems: TfrxDBDataset
    UserName = 'Items'
    CloseDataSource = False
    DataSet = memItems
    BCDToCurrency = False
    Left = 472
    Top = 336
  end
  object memParts: TFDMemTable
    Active = True
    IndexFieldNames = 'PartNo'
    MasterSource = dtsItems
    MasterFields = 'PartNo'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 288
    Content = {
      414442530F003137B01E0000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B04000C0000
      0050006100720074004E006F0005000C00000050006100720074004E006F000C
      00010000000E000D000F000110000111000112000113000114000115000C0000
      0050006100720074004E006F00FEFF0B040010000000560065006E0064006F00
      72004E006F00050010000000560065006E0064006F0072004E006F000C000200
      00000E000D000F00011000011100011200011300011400011500100000005600
      65006E0064006F0072004E006F00FEFF0B040016000000440065007300630072
      0069007000740069006F006E0005001600000044006500730063007200690070
      00740069006F006E000C00030000000E00160017001E0000000F000110000111
      0001120001130001140001150016000000440065007300630072006900700074
      0069006F006E0018001E000000FEFF0B04000C0000004F006E00480061006E00
      640005000C0000004F006E00480061006E0064000C00040000000E000D000F00
      0110000111000112000113000114000115000C0000004F006E00480061006E00
      6400FEFF0B04000E0000004F006E004F00720064006500720005000E0000004F
      006E004F0072006400650072000C00050000000E000D000F0001100001110001
      12000113000114000115000E0000004F006E004F007200640065007200FEFF0B
      04000800000043006F007300740005000800000043006F00730074000C000600
      00000E000D000F00011000011100011200011300011400011500080000004300
      6F0073007400FEFF0B0400120000004C00690073007400500072006900630065
      000500120000004C00690073007400500072006900630065000C00070000000E
      000D000F00011000011100011200011300011400011500120000004C00690073
      00740050007200690063006500FEFEFF19FEFF1AFEFF1BFF1C1D0000000000FF
      1E00000000000000208C4001000000000000D8AD400200140000004400690076
      00650020006B006100790061006B000300000000000000384004000000000000
      00304005000000000000339540060066666666E63FAF40FEFEFF1C1D00010000
      00FF1E00000000000000808C4001000000000000D8AD4002003000000055006E
      0064006500720077006100740065007200200044006900760065007200200056
      0065006800690063006C00650003000000000000001440040000000000000008
      4005000000000000807F4006000000000000409A40FEFEFF1C1D0002000000FF
      1E00000000000000849440010000000000006EAB400200200000005200650067
      0075006C00610074006F0072002000530079007300740065006D000300000000
      0000A0644004000000000000006B4005000000000000605D4006000000000000
      406F40FEFEFF1C1D0003000000FF1E0000000000000088944001000000000000
      09B64002002C0000005300650063006F006E0064002000530074006100670065
      00200052006500670075006C00610074006F0072000300000000000080584004
      00000000000000564005006666666666065F4006000000000000D07640FEFEFF
      1C1D0004000000FF1E00000000000000909440010000000000006EAB40020020
      00000052006500670075006C00610074006F0072002000530079007300740065
      006D0003000000000000C052400400000000000080514005006666666666D65D
      4006000000000000507540FEFEFF1C1D0005000000FF1E00000000000000A094
      40010000000000006EAB4002002C0000005300650063006F006E006400200053
      007400610067006500200052006500670075006C00610074006F007200030000
      0000000080424004000000000000804140050052B81E85EB6152400600000000
      0000606540FEFEFF1C1D0006000000FF1E00000000000000C094400100000000
      00006EAB4002002000000052006500670075006C00610074006F007200200053
      0079007300740065006D0003000000000000C064400400000000000000594005
      009A9999999959634006000000000000E07A40FEFEFF1C1D0007000000FF1E00
      000000000000C89440010000000000006EAB4002003A00000041006C00740065
      0072006E00610074006500200049006E0066006C006100740069006F006E0020
      0052006500670075006C00610074006F00720003000000000000804740040000
      000000008045400500333333333373554006000000000000407040FEFEFF1C1D
      0008000000FF1E00000000000000509540010000000000006EAB4002002C0000
      005300650063006F006E00640020005300740061006700650020005200650067
      0075006C00610074006F0072000300000000000000604004000000000000E060
      4005009A99999999F9584006000000000000E07040FEFEFF1C1D0009000000FF
      1E00000000000000B89540010000000000006EAB4002002A0000004600690072
      0073007400200053007400610067006500200052006500670075006C00610074
      006F007200030000000000004062400400000000000080614005006666666666
      26504006000000000000406540FEFEFF1C1D000A000000FF1E00000000000000
      689E4001000000000000BCB94002002C0000005300650063006F006E00640020
      0053007400610067006500200052006500670075006C00610074006F00720003
      000000000000002A40040000000000000024400500C3F5285C8FF25740060000
      00000000507340FEFEFF1C1D000B000000FF1E00000000000000089F40010000
      00000000BCB940020038000000440065007000740068002F0050007200650073
      007300750072006500200047006100750067006500200043006F006E0073006F
      006C0065000300000000000000394004000000000000003840050014AE47E17A
      54524006000000000000806740FEFEFF1C1D000C000000FF1E00000000000000
      14A240010000000000006EAB4002002400000045006C0065006300740072006F
      006E0069006300200043006F006E0073006F006C00650003000000000000002A
      400400000000000000284005009A99999999395E4006000000000000607840FE
      FEFF1C1D000D000000FF1E000000000000004AA240010000000000006EAB4002
      0028000000440065007000740068002F00500072006500730073007500720065
      0020004700610075006700650003000000000000406C4004000000000000206C
      400500666666666626484006000000000000405A40FEFEFF1C1D000E000000FF
      1E000000000000004EA240010000000000006EAB400200260000005000650072
      0073006F006E0061006C0020004400690076006500200053006F006E00610072
      0003000000000000004740040000000000008046400500666666666636524006
      000000000000606D40FEFEFF1C1D000F000000FF1E000000000000005CA24001
      0000000000006EAB4002002A00000043006F006D007000610073007300200043
      006F006E0073006F006C00650020004D006F0075006E00740003000000000000
      606A4004000000000000C072400500CDCCCCCCCC4C244006000000000000003D
      40FEFEFF1C1D0010000000FF1E000000000000007EA240010000000000006EAB
      4002002800000043006F006D007000610073007300200028006D006500740065
      00720020006F006E006C00790029000300000000000000654004000000000000
      E066400500F6285C8FC2F5384006000000000000004A40FEFEFF1C1D00110000
      00FF1E000000000000009EA240010000000000006EAB40020028000000440065
      007000740068002F005000720065007300730075007200650020004700610075
      00670065000300000000000000604004000000000000005E400500AE47E17A14
      0E534006000000000000C06940FEFEFF1C1D0012000000FF1E00000000000000
      ACA240010000000000006EAB4002003A00000045006C0065006300740072006F
      006E0069006300200043006F006E0073006F006C006500200077002F0020006F
      007000740069006F006E00730003000000000000003840040000000000000037
      4005000000000000A0674006000000000000407A40FEFEFF1C1D0013000000FF
      1E0000000000000068A44001000000000000789F4002002E0000004400690072
      0065006300740020005300690067006800740069006E006700200043006F006D
      00700061007300730003000000000000002E4004000000000000002840050044
      8B6CE7FB29294006009A99999999794140FEFEFF1C1D0014000000FF1E000000
      000000006AA44001000000000000789F4002001A000000440069007600650020
      0043006F006D0070007500740065007200030000000000000014400400000000
      00000000400500AE47E17A143E534006000000000000606640FEFEFF1C1D0015
      000000FF1E0000000000000076A44001000000000000789F400200240000004E
      0061007600690067006100740069006F006E00200043006F006D007000610073
      00730003000000000000002040040000000000000034400500B4C876BE9F5A22
      4006003333333333F33340FEFEFF1C1D0016000000FF1E000000000000008CA4
      4001000000000000789F40020034000000570072006900730074002000420061
      006E006400200054006800650072006D006F006D006500740065007200200028
      004600290003000000000000001840040000000000000008400500AE47E17A14
      AE1F4006000000000000003240FEFEFF1C1D0017000000FF1E00000000000000
      90A44001000000000000789F4002003C000000440065007000740068002F0050
      0072006500730073007500720065002000470061007500670065002000280044
      00690067006900740061006C0029000300000000000000284004000000000000
      002440050052B81E85EBD14A4006000000000000A06240FEFEFF1C1D00180000
      00FF1E00000000000000B0A44001000000000000789F4002003A000000440065
      007000740068002F005000720065007300730075007200650020004700610075
      00670065002000280041006E0061006C006F0067002900030000000000000030
      4004000000000000002E400500C3F5285C8FA2434006000000000000C05D40FE
      FEFF1C1D0019000000FF1E00000000000000C2A44001000000000000789F4002
      0034000000570072006900730074002000420061006E00640020005400680065
      0072006D006F006D006500740065007200200028004300290003000000000000
      002840040000000000000024400500EC51B81E85EB1940060000000000000032
      40FEFEFF1C1D001A000000FF1E0000000000000014A74001000000000000BCB9
      4002001A0000004400690076006500200043006F006D00700075007400650072
      00030000000000008046400400000000000080454005000000000000B06F4006
      000000000000508440FEFEFF1C1D001B000000FF1E00000000000000E8A94001
      0000000000006EAB40020020000000530074006100620069006C0069007A0069
      006E0067002000560065007300740003000000000000004C4004000000000000
      C050400500666666666646624006000000000000E07A40FEFEFF1C1D001C0000
      00FF1E00000000000000FCA940010000000000006EAB40020036000000460072
      006F006E007400200043006C00690070002000530074006100620069006C0069
      007A0069006E0067002000560065007300740003000000000000804640040000
      00000000004C4005009A9999999919604006000000000000807140FEFEFF1C1D
      001D000000FF1E0000000000000018AA40010000000000006EAB400200320000
      005400720069006D0020004600690074002000530074006100620069006C0069
      007A0069006E0067002000560065007300740003000000000000804F40040000
      00000000804E400500000000000048614006000000000000B07840FEFEFF1C1D
      001E000000FF1E0000000000000074AA40010000000000006EAB400200380000
      00570065006C0064006500640020005300650061006D00200053007400610062
      0069006C0069007A0069006E0067002000560065007300740003000000000000
      004F4004000000000000004E400500CDCCCCCCCC4C5B40060000000000008071
      40FEFEFF1C1D001F000000FF1E00000000000000C1B440010000000000006EAB
      4002001800000053006100660065007400790020004B006E0069006600650003
      00000000000000304004000000000000003E4005003D0AD7A3703D2A40060000
      00000000804440FEFEFF1C1D0020000000FF1E00000000000000C6B440010000
      0000000009B64002002A0000004D0065006400690075006D0020005400690074
      0061006E00690075006D0020004B006E00690066006500030000000000000010
      400400000000000000084005004E62105839C43A4006009A99999999794C40FE
      FEFF1C1D0021000000FF1E00000000000000CCB440010000000000006EAB4002
      0024000000430068006900730065006C00200050006F0069006E00740020004B
      006E0069006600650003000000000000002C4004000000000000804140050033
      33333333B32C4006000000000000804440FEFEFF1C1D0022000000FF1E000000
      00000000E5B440010000000000006EAB4002001400000046006C006100730068
      006C00690067006800740003000000000000003C4004000000000000003B4005
      000000000000403D4006000000000000405040FEFEFF1C1D0023000000FF1E00
      000000000000ECB440010000000000006EAB400200380000004D006500640069
      0075006D00200053007400610069006E006C0065007300730020005300740065
      0065006C0020004B006E0069006600650003000000000000003E400400000000
      00000037400500666666666626414006000000000000805140FEFEFF1C1D0024
      000000FF1E0000000000000002B540010000000000006EAB4002002E00000044
      006900760065007200730020004B006E00690066006500200061006E00640020
      0053006800650061007400680003000000000000003840040000000000000037
      400500CDCCCCCCCC4C3B4006000000000000805140FEFEFF1C1D0025000000FF
      1E000000000000000AB540010000000000006EAB400200360000004C00610072
      0067006500200053007400610069006E006C0065007300730020005300740065
      0065006C0020004B006E00690066006500030000000000000030400400000000
      0000002E400500CDCCCCCCCCCC424006000000000000005440FEFEFF1C1D0026
      000000FF1E00000000000000BCBD4001000000000000D6BC400200240000004B
      0072007900700074006F006E00200046006C006100730068006C006900670068
      007400030000000000000047400400000000000000534005005A643BDF4FAD34
      4006009A99999999794640FEFEFF1C1D0027000000FF1E00000000000000C3BD
      4001000000000000D6BC4002003200000046006C006100730068006C00690067
      00680074002000280052006500630068006100720067006500610062006C0065
      00290003000000000000003040040000000000000042400500AE47E17A147E49
      40060066666666663E6540FEFEFF1C1D0028000000FF1E00000000000000E6BD
      4001000000000000D6BC40020024000000480061006C006F00670065006E0020
      0046006C006100730068006C0069006700680074000300000000000000334004
      0000000000000032400500C976BE9F1A2F334006009A99999999F94D40FEFEFF
      1C1D0029000000FF1E0000000000000030C240010000000000006EAB4002001E
      000000360030002E0036002000630075002000660074002000540061006E006B
      0003000000000000002040040000000000000010400500A4703D0AD7A34C4006
      000000000000606640FEFEFF1C1D002A000000FF1E0000000000000032C24001
      0000000000006EAB4002001E000000390035002E003100200063007500200066
      0074002000540061006E006B000300000000000000304004000000000000002C
      400500000000000040604006000000000000507440FEFEFF1C1D002B000000FF
      1E0000000000000033C240010000000000006EAB4002001E000000370031002E
      0034002000630075002000660074002000540061006E006B0003000000000000
      8059400400000000000000594005000000000000404D40060000000000006068
      40FEFEFF1C1D002C000000FF1E0000000000000045C240010000000000006EAB
      4002001E000000370035002E0038002000630075002000660074002000540061
      006E006B000300000000000000434004000000000000003F4005006666666666
      16584006000000000000606D40FEFEFF1C1D002D000000FF1E00000000000080
      EAC54001000000000000E4A44002003C000000520065006D006F00740065006C
      00790020004F007000650072006100740065006400200056006900640065006F
      002000530079007300740065006D0003000000000000002A4004000000000000
      00284005009A999999993586400600000000000082A240FEFEFF1C1D002E0000
      00FF1E00000000000000F3C54001000000000000D6BC4002003C0000004D0061
      00720069006E0065002000530075007000650072002000560048005300200056
      006900640065006F0020005000610063006B0061006700650003000000000000
      0008400400000000000000F03F050066666666669091400600000000000084A3
      40FEFEFF1C1D002F000000FF1E000000000000007FC640010000000000002CB2
      4002003400000054006F007700610062006C006500200056006900640065006F
      002000430061006D006500720061002000280042002600570029000300000000
      0000002840040000000000000035400500C3F5285C8FDC8A4006000000000000
      3C9F40FEFEFF1C1D0030000000FF1E0000000000000096C64001000000000000
      2CB24002003800000054006F007700610062006C006500200056006900640065
      006F002000430061006D006500720061002000280043006F006C006F00720029
      0003000000000000003040040000000000008043400500333333333332974006
      000000000000C6A940FEFEFF1C1D0031000000FF1E00000000000080B9C64001
      000000000000D6BC4002001E000000430061006D00650072006100200061006E
      0064002000430061007300650003000000000000002C40040000000000000028
      400500DD24068195634A400600CDCCCCCCCCFC5D40FEFEFF1C1D0032000000FF
      1E00000000000000C2C64001000000000000D6BC400200160000005600690064
      0065006F0020004C006900670068007400030000000000000014400400000000
      000000F03F0500068195438B726240060033333333337F7640FEFEFF1C1D0033
      000000FF1E0000000000008006C84001000000000000E4A44002003600000042
      006F0061007400200054006F007700610062006C00650020004D006500740061
      006C0020004400650074006500630074006F00720003000000000000002A4004
      000000000000002840050085EB51B81E75694006000000000000B88240FEFEFF
      1C1D0034000000FF1E0000000000008007C84001000000000000E4A440020036
      00000042006F0061007400200054006F007700610062006C00650020004D0065
      00740061006C0020004400650074006500630074006F00720003000000000000
      002C40040000000000000026400500CDCCCCCCCCC0734006000000000000F886
      40FEFEFF1C1D0035000000FF1E0000000000000009C84001000000000000E4A4
      4002002800000055006E0064006500720077006100740065007200200041006C
      00740069006D0065007400650072000300000000000000434004000000000000
      00414005000000000000F0614006000000000000E07540FEFEFF1C1D00360000
      00FF1E000000000000000BC84001000000000000E4A44002001800000053006F
      006E00610072002000530079007300740065006D000300000000000000084004
      000000000000005E400500EC51B81E85E36A4006000000000000707B40FEFEFF
      1C1D0037000000FF1E000000000000000EC84001000000000000E4A440020026
      0000004D006100720069006E00650020004D00610067006E00650074006F006D
      00650074006500720003000000000000004C4004000000000000804B40050071
      3D0AD7A30C8140060000000000004C9440FEFEFF1C1D0038000000FF1E000000
      000000800EC84001000000000000E4A44002003200000055006E006400650072
      007700610074006500720020004D006500740061006C00200044006500740065
      00630074006F00720003000000000000003D400400000000000000384005005C
      8FC2F528887B4006000000000000188C40FEFEFF1C1D0039000000FF1E000000
      0000000031C84001000000000000E4A44002003200000055006E006400650072
      007700610074006500720020004D006500740061006C00200044006500740065
      00630074006F00720003000000000000804640040000000000008044400500CD
      CCCCCCCC24754006000000000000188F40FEFEFF1C1D003A000000FF1E000000
      0000008074CA40010000000000004AB24002001C000000410069007200200043
      006F006D00700072006500730073006F00720003000000000000001440040000
      000000000000400500CDCCCCCCCCD68E4006000000000000EEA140FEFEFEFEFE
      FF1FFEFF202100B9040000FF22FEFEFE0E004D0061006E006100670065007200
      1E00550070006400610074006500730052006500670069007300740072007900
      12005400610062006C0065004C006900730074000A005400610062006C006500
      08004E0061006D006500140053006F0075007200630065004E0061006D006500
      0A0054006100620049004400240045006E0066006F0072006300650043006F00
      6E00730074007200610069006E00740073001E004D0069006E0069006D007500
      6D0043006100700061006300690074007900180043006800650063006B004E00
      6F0074004E0075006C006C00140043006F006C0075006D006E004C0069007300
      74000C0043006F006C0075006D006E00100053006F0075007200630065004900
      440010006400740044006F00750062006C006500100044006100740061005400
      7900700065001400530065006100720063006800610062006C00650012004100
      6C006C006F0077004E0075006C006C000800420061007300650014004F004100
      6C006C006F0077004E0075006C006C0012004F0049006E005500700064006100
      7400650010004F0049006E00570068006500720065001A004F00720069006700
      69006E0043006F006C004E0061006D0065001800640074005700690064006500
      53007400720069006E0067000800530069007A006500140053006F0075007200
      63006500530069007A0065001C0043006F006E00730074007200610069006E00
      74004C00690073007400100056006900650077004C006900730074000E005200
      6F0077004C00690073007400060052006F0077000A0052006F00770049004400
      10004F0072006900670069006E0061006C001800520065006C00610074006900
      6F006E004C006900730074001C0055007000640061007400650073004A006F00
      750072006E0061006C001200530061007600650050006F0069006E0074000E00
      4300680061006E00670065007300}
  end
  object dtsItems: TDataSource
    DataSet = memItems
    Left = 472
    Top = 240
  end
  object frxDBParts: TfrxDBDataset
    UserName = 'Parts'
    CloseDataSource = False
    DataSet = memParts
    BCDToCurrency = False
    Left = 528
    Top = 336
  end
  object dtsParts: TDataSource
    DataSet = memParts
    Left = 528
    Top = 240
  end
  object memVendors: TFDMemTable
    Active = True
    IndexFieldNames = 'VendorNo'
    MasterSource = dtsParts
    MasterFields = 'VendorNo'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 584
    Top = 288
    Content = {
      414442530F003137DE180000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B0400100000
      00560065006E0064006F0072004E006F00050010000000560065006E0064006F
      0072004E006F000C00010000000E000D000F0001100001110001120001130001
      140001150010000000560065006E0064006F0072004E006F00FEFF0B04001400
      0000560065006E0064006F0072004E0061006D00650005001400000056006500
      6E0064006F0072004E0061006D0065000C00020000000E00160017001E000000
      0F0001100001110001120001130001140001150014000000560065006E006400
      6F0072004E0061006D00650018001E000000FEFF0B0400100000004100640064
      0072006500730073003100050010000000410064006400720065007300730031
      000C00030000000E00160017001E0000000F0001100001110001120001130001
      1400011500100000004100640064007200650073007300310018001E000000FE
      FF0B040010000000410064006400720065007300730032000500100000004100
      64006400720065007300730032000C00040000000E00160017001E0000000F00
      0110000111000112000113000114000115001000000041006400640072006500
      73007300320018001E000000FEFF0B0400080000004300690074007900050008
      00000043006900740079000C00050000000E0016001700140000000F00011000
      0111000112000113000114000115000800000043006900740079001800140000
      00FEFF0B04000A0000005300740061007400650005000A000000530074006100
      740065000C00060000000E0016001700140000000F0001100001110001120001
      13000114000115000A00000053007400610074006500180014000000FEFF0B04
      00060000005A00690070000500060000005A00690070000C00070000000E0016
      0017000A0000000F00011000011100011200011300011400011500060000005A
      006900700018000A000000FEFF0B04000E00000043006F0075006E0074007200
      790005000E00000043006F0075006E007400720079000C00080000000E001600
      17000F0000000F000110000111000112000113000114000115000E0000004300
      6F0075006E0074007200790018000F000000FEFF0B04000A000000500068006F
      006E00650005000A000000500068006F006E0065000C00090000000E00160017
      000F0000000F000110000111000112000113000114000115000A000000500068
      006F006E00650018000F000000FEFF0B04000600000046004100580005000600
      00004600410058000C000A0000000E00160017000F0000000F00011000011100
      0112000113000114000115000600000046004100580018000F000000FEFF0B04
      0012000000500072006500660065007200720065006400050012000000500072
      0065006600650072007200650064000C000B0000000E0019000F000110000111
      0001120001130001140001150012000000500072006500660065007200720065
      006400FEFEFF1AFEFF1BFEFF1CFF1D1E0000000000FF1F00000000000000789F
      400100220000004300610063006F007200200043006F00720070006F00720061
      00740069006F006E00020022000000310036003100200053006F007500740068
      006600690065006C00640020005200640004001400000053006F007500740068
      006600690065006C0064000500040000004F00480006000A0000003600300030
      003900330007000C00000055002E0053002E0041002E00080018000000370030
      0038002D003500350035002D0039003500350035000900180000003700300038
      002D003500350035002D0037003500340037000A00FFFFFEFEFF1D1E00010000
      00FF1F00000000000000A2A44001001400000055006E00640065007200770061
      0074006500720002001E0000003500300020004E002000330072006400200053
      007400720065006500740004001800000049006E006400690061006E00610070
      006F006C006900730005000400000049004E0006000A00000034003600320030
      00380007000C00000055002E0053002E0041002E000800180000003300310037
      002D003500350035002D0034003500320033000A00FFFFFEFEFF1D1E00020000
      00FF1F00000000000000E4A4400100240000004A002E0057002E00200020004C
      0075007300630068006500720020004D00660067002E00020020000000360035
      00200041006400640061006D007300200053007400720065006500740004000E
      0000004200650072006B0065006C0079000500040000004D00410006000A0000
      003000320037003700390007000C00000055002E0053002E0041002E00080018
      0000003800300030002D003500350035002D0034003700340034000900180000
      003500300038002D003500350035002D0038003900340039000A000000FEFEFF
      1D1E0003000000FF1F000000000000006EAB4001002600000053006300750062
      0061002000500072006F00660065007300730069006F006E0061006C00730002
      001E000000330031003000350020004500610073007400200042007200610063
      006500040020000000520061006E00630068006F00200044006F006D0069006E
      006700750065007A000500040000004300410006000A00000039003000320032
      00310007000C00000055002E0053002E0041002E000800180000003200310033
      002D003500350035002D0037003800350030000A00FFFFFEFEFF1D1E00040000
      00FF1F00000000000000D6AD4001002800000044006900760065007200730027
      002000200053007500700070006C0079002000530068006F0070000200240000
      003500320030003800200055006E006900760065007200730069007400790020
      004400720004000A0000004D00610063006F006E000500040000004700410006
      000A0000003200300038003600350007000C00000055002E0053002E0041002E
      000800180000003900310032002D003500350035002D00360037003900300009
      00180000003900310032002D003500350035002D0038003400370034000A0000
      00FEFEFF1D1E0005000000FF1F00000000000000D8AD40010014000000540065
      00630068006E006900710075006500730002002000000035003200200044006F
      006C007000680069006E00200044007200690076006500040018000000520065
      00640077006F006F006400200043006900740079000500040000004300410006
      0014000000390034003000360035002D00310030003800360007000C00000055
      002E0053002E0041002E000800180000003400310035002D003500350035002D
      0031003400310030000900180000003400310035002D003500350035002D0031
      003200370036000A000000FEFEFF1D1E0006000000FF1F00000000000000A9B1
      400100160000005000650072007200790020005300630075006200610002001C
      000000330034003400330020004A0061006D0065007300200041007600650004
      00120000004800610070006500760069006C006C006500050004000000470041
      0006000A0000003300300033003500340007000C00000055002E0053002E0041
      002E000800180000003800300030002D003500350035002D0036003200320030
      000900180000003400300034002D003500350035002D0038003200380030000A
      00FFFFFEFEFF1D1E0007000000FF1F0000000000000022B24001001C00000042
      0065006100750063006800610074002C00200049006E0063002E000200200000
      0034003500390030003000200053005700200032006E00640020004100760065
      0004001A0000004600740020004C0061007500640065007200640061006C0065
      0005000400000046004C0006000A0000003300330033003100350007000C0000
      0055002E0053002E0041002E000800180000003300300035002D003500350035
      002D0037003200340032000900180000003300300035002D003500350035002D
      0036003700330039000A00FFFFFEFEFF1D1E0008000000FF1F00000000000000
      2BB24001001200000041006D006F007200200041007100750061000200260000
      0034003200200057006500730074002000320039007400680020005300740072
      006500650074000400100000004E0065007700200059006F0072006B00050004
      0000004E00590006000A0000003100300030003100310007000C00000055002E
      0053002E0041002E000800180000003800300030002D003500350035002D0036
      003800380030000900180000003200310032002D003500350035002D00370032
      00380036000A00FFFFFEFEFF1D1E0009000000FF1F000000000000002CB24001
      0026000000410071007500610020005200650073006500610072006300680020
      0043006F00720070002E0002001800000050002E004F002E00200042006F0078
      00200039003900380004000E00000043006F0072006E00690073006800050004
      0000004E00480006000A0000003000330037003400350007000C00000055002E
      0053002E0041002E000800180000003600300033002D003500350035002D0032
      003200350034000A00FFFFFEFEFF1D1E000A000000FF1F000000000000002FB2
      40010024000000420026004B00200055006E0064006500720073006500610020
      00500068006F0074006F00020020000000310031003600200057002000370074
      00680020005300740072006500650074000400100000004E0065007700200059
      006F0072006B000500040000004E00590006000A000000310030003000310031
      0007000C00000055002E0053002E0041002E000800180000003800300030002D
      003500350035002D0035003600360032000900180000003200310032002D0035
      00350035002D0037003400370034000A000000FEFEFF1D1E000B000000FF1F00
      00000000000049B24001003C00000044006900760069006E006700200049006E
      007400650072006E006100740069006F006E0061006C00200055006E006C0069
      006D006900740065006400020020000000310031003400380020004400610076
      0069006400200044007200690076006500040012000000530061006E00200044
      006900650067006F000500040000004400410006000A00000039003200310030
      00320007000C00000055002E0053002E0041002E000800180000003800300030
      002D003500350035002D0038003400330039000A00FFFFFEFEFF1D1E000C0000
      00FF1F000000000000004AB2400100280000004E006100750074006900630061
      006C00200043006F006D00700072006500730073006F00720073000200200000
      003600350020004E005700200031003600370020005300740072006500650074
      0004000A0000004D00690061006D00690005000400000046004C0006000A0000
      003300330030003100350007000C00000055002E0053002E0041002E00080018
      0000003300300035002D003500350035002D0035003500350034000900180000
      003300300035002D003500350035002D0030003200360038000A00FFFFFEFEFF
      1D1E000D000000FF1F0000000000000009B54001002C00000047006C0065006E
      0020005300700065006300690061006C0074006900650073002C00200049006E
      0063002E00020026000000310037003600360033002000430061006D00700062
      0065006C006C0020004C0061006E006500040020000000480075006E00740069
      006E00670074006F006E00200042006500610063006800050004000000430041
      0006000A0000003900320036003400370007000C00000055002E0053002E0041
      002E000800180000003700310034002D003500350035002D0035003100300030
      000900180000003700310034002D003500350035002D0036003500330039000A
      00FFFFFEFEFF1D1E000E000000FF1F0000000000000009B64001001200000044
      006900760065002000540069006D00650002001C0000003200300020004D0069
      00720061006D006100720020004100760065000400140000004C006F006E0067
      002000420065006100630068000500040000004300410006000A000000390030
      0038003100350007000C00000055002E0053002E0041002E0008001800000032
      00310033002D003500350035002D003300370030003800090018000000320031
      0033002D003500350035002D0031003300390030000A00FFFFFEFEFF1D1E000F
      000000FF1F000000000000000FB94001002C00000055006E0064006500720073
      00650061002000530079007300740065006D0073002C00200049006E0063002E
      0002002600000031003800310031003200200047006F007400680061006D0020
      00530074007200650065007400040020000000480075006E00740069006E0067
      0074006F006E002000420065006100630068000500040000004300410006000A
      0000003900320036003400380007000C00000055002E0053002E0041002E0008
      00180000003800300030002D003500350035002D0033003400380033000A00FF
      FFFEFEFF1D1E0010000000FF1F0000000000000033B940010018000000460065
      006C0069007800200044006900760069006E0067000200240000003300310030
      002000530020004D006900630068006900670061006E00200041007600650004
      000E0000004300680069006300610067006F0005000400000049004C0006000A
      0000003600300036003000370007000C00000055002E0053002E0041002E0008
      00180000003800300030002D003500350035002D003300350034003900090018
      0000003300310032002D003500350035002D0031003500380036000A000000FE
      FEFF1D1E0011000000FF1F0000000000000034B940010034000000430065006E
      007400720061006C002000560061006C006C0065007900200053006B0069006E
      00200044006900760065007200730002002000000031003600300020004A0061
      006D006500730074006F006E00200041007600650004000E0000004A0061006D
      0061006900630061000500040000004E00590006000A00000031003100340033
      00320007000C00000055002E0053002E0041002E000800180000003700310038
      002D003500350035002D0035003700370032000A000000FEFEFF1D1E00120000
      00FF1F0000000000000051B9400100220000005000610072006B007700610079
      00200044006900760065002000530068006F0070000200200000003200340031
      0020004B0065006C006C00790020005300740072006500650074000400160000
      0053006F00750074006800200041006D0062006F0079000500040000004E004A
      0006000A0000003000380038003700390007000C00000055002E0053002E0041
      002E000800180000003900300038002D003500350035002D0035003300300030
      000A00FFFFFEFEFF1D1E0013000000FF1F0000000000000052B9400100280000
      004D006100720069006E0065002000430061006D006500720061002000260020
      004400690076006500020026000000310031003700200053006F007500740068
      002000560061006C006C0065007900200052006400040012000000530061006E
      00200044006900650067006F000500040000004300410006000A000000390032
      0031003200310007000C00000055002E0053002E0041002E0008001800000036
      00310039002D003500350035002D003000360030003400090018000000360031
      0039002D003500350035002D0036003400390039000A00FFFFFEFEFF1D1E0014
      000000FF1F00000000000000BCB9400100160000004400690076006500200043
      0061006E0061006400610002001E0000003200370035002000570020004E0069
      006E00740068002000410076006500040012000000560061006E0063006F0075
      007600650072000500200000004200720069007400690073006800200043006F
      006C0075006D0062006900610006000E000000560036004B0020003100500039
      0007000C000000430061006E006100640061000800180000003600300034002D
      003500350035002D0032003600380031000900180000003600300034002D0035
      00350035002D0033003700340039000A00FFFFFEFEFF1D1E0015000000FF1F00
      000000000000D6BC400100160000004400690076006500200026002000530075
      007200660002001C00000050002E004F002E00200042006F0078002000320030
      0032003100300004001800000049006E006400690061006E00610070006F006C
      006900730005000400000049004E0006000A0000003400360032003000380007
      000C00000055002E0053002E0041002E000800180000003300310037002D0035
      00350035002D0034003500320033000A000000FEFEFF1D1E0016000000FF1F00
      00000000000005BE400100240000004600690073006800200052006500730065
      00610072006300680020004C0061006200730002002C00000032003900200057
      0069006C006B0069006E007300200052006400200044006500700074002E0020
      00530044000400120000004C006F0073002000420061006E006F007300050004
      0000004300410006000A0000003900330036003300350007000C00000055002E
      0053002E0041002E000800180000003200300039002D003500350035002D0033
      003200390032000900180000003200300033002D003500350035002D00300034
      00310036000A00FFFFFEFEFEFEFEFF20FEFF212200D0040000FF23FEFEFE0E00
      4D0061006E0061006700650072001E0055007000640061007400650073005200
      650067006900730074007200790012005400610062006C0065004C0069007300
      74000A005400610062006C00650008004E0061006D006500140053006F007500
      7200630065004E0061006D0065000A0054006100620049004400240045006E00
      66006F0072006300650043006F006E00730074007200610069006E0074007300
      1E004D0069006E0069006D0075006D0043006100700061006300690074007900
      180043006800650063006B004E006F0074004E0075006C006C00140043006F00
      6C0075006D006E004C006900730074000C0043006F006C0075006D006E001000
      53006F0075007200630065004900440010006400740044006F00750062006C00
      6500100044006100740061005400790070006500140053006500610072006300
      6800610062006C006500120041006C006C006F0077004E0075006C006C000800
      420061007300650014004F0041006C006C006F0077004E0075006C006C001200
      4F0049006E0055007000640061007400650010004F0049006E00570068006500
      720065001A004F0072006900670069006E0043006F006C004E0061006D006500
      180064007400570069006400650053007400720069006E006700080053006900
      7A006500140053006F007500720063006500530069007A006500120064007400
      42006F006F006C00650061006E001C0043006F006E0073007400720061006900
      6E0074004C00690073007400100056006900650077004C006900730074000E00
      52006F0077004C00690073007400060052006F0077000A0052006F0077004900
      440010004F0072006900670069006E0061006C001800520065006C0061007400
      69006F006E004C006900730074001C0055007000640061007400650073004A00
      6F00750072006E0061006C001200530061007600650050006F0069006E007400
      0E004300680061006E00670065007300}
  end
  object frxDBVendors: TfrxDBDataset
    UserName = 'Vendors'
    CloseDataSource = False
    DataSet = memVendors
    BCDToCurrency = False
    Left = 584
    Top = 336
  end
  object frxReportSubReport: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42931.576378206000000000
    ReportOptions.LastChange = 42931.576378206000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure btnGerarOnClick(Sender: TfrxComponent);'
      'begin'
      '  if (edtFiltro.text <> '#39#39') and (chkFiltroAtivo.Checked) then'
      '  begin              '
      
        '    MasterDataCountry.Filter := '#39'[<Country."Name">] = '#39' + '#39#39#39#39' +' +
        ' edtFiltro.text + '#39#39#39#39';'
      '  end          '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 416
    Top = 97
    Datasets = <
      item
        DataSet = frxDBCountry2
        DataSetName = 'Country2'
      end
      item
        DataSet = frxDBCustomer
        DataSetName = 'Customer'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 264.567100000000000000
          Top = 71.811070000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sub - Report')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 15.118120000000000000
          Top = 7.559059999999999000
          Width = 226.771800000000000000
          Height = 139.842610000000000000
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000007300
            00004508060000007960D956000000017352474200AECE1CE90000000467414D
            410000B18F0BFC61050000000970485973000017110000171101CA26F33F0000
            001F74455874536F667477617265004D6163726F6D656469612046697265776F
            726B732038B568D2780000145B4944415478DAED5D099855C5953EEFF5BEB3EF
            348B048CA841C40583A889A268D0000A5156050770144D30A8A3E3129C314840
            1008E0C222A2321924239BE84411CD28A208B2B4610011688466699ADEB7F7F2
            FFB7CEEDBE3CDEEB6E7A79B7E1E37C5F75F5BDB7EADEAAFAAB4E9D73EA543D8F
            DFEF97B3853AB5EF108DA83DC25508BD112ED1EB86087C56809085B00B612BC2
            A7081B11F6ECDAFB7DA9DBE5AF6BF29C0D6002C40B10DD8AD007E15A849433C8
            9E89F009C25A843500F507B7EB535754AFC104885D103D8AD00FA1792DBCF220
            C25F11A602D43D6ED7AFB6A95E8209101B219AA021E6B40428B3C7EF13292D11
            8F0FDC93FFB31E1E0F8257FC1191E2F74658FF5BF74EA71C842908D3006A8EDB
            F5AD2DAA776002C85F209A897091A39800AB54BC85F9D6952F3A4E7CF14952DC
            ACBD14376923BEB864F145C688B7B840BC79D912756C9F4465EC136FFE49F116
            E55BF97D31F1C180DD84F01000FD3FB7EB5D1B54AFC00490E3C58C9868E77D6F
            611EFEFAA5A06D57C9BFF01AC9EB7AAD14A45E0C801244300AC5EB35A39023D4
            C7115B2CDE825C89DDFBADC4EF582FF1699F4B4CFA0EA48B444788B7DEE520BE
            FC4100BAC0EDFAD794EA0D9800F239444F9F52B89222F114174A7EA72B24EBFA
            A1927BE92FC4D7A8A5481184D69262C35A2D72D641471F476124FA44748C441C
            4B97F8CD1F48834F9648EC9ECDE28F8A117F647460111E03A02FBADD0E35A17A
            01E6694002086FDE49294D692AC7FB3E2059BDEF167F7213281E184400F88C09
            E00958B327EB8834FC789134583B4F22724F882F36490246E944003AC5EDF6A8
            2EB90E26801C83686EF91DBF35EFE577EA2147863E2F851895529063093B35A6
            882891D804894DFBBB345DF294C5867DF1C9CE146C8C2100F46D571BA59AE42A
            9800F21A447F4388B5EF71C46477EF2B87474E014B6D85192DABF63F9CD04022
            0E7F2F2D164C9084AD1F49694243E7D36C845E00F45BD71AA69AE41A980012D2
            8B7C2EC68A635104586B76B73E7278CC2CB0C044CC8DF975570048B7DEECE3D2
            72DE3849D8BE5E4AE3531C73B0FC1DE126005A8705A87D7213CCA7104DB2AFBD
            F9D952D0B19BA48F5F24BEE4A60032AF8E4B807AC7244AE4D17DD26AFA088939
            B8131D28C199603CC09CE94AE354935C011340A622DA8E9068DD802AE1879A91
            3E7EA11476BE4A04FA61D828B181C47EFBB1B49E791FA467942332CA7E7204A1
            2B003D12F606AA26B905E63444BFB5AF29B91EBDF309C9BC6302E6C81352A65E
            848550FFF806D278E973D268E52C1588CADAE45980F95CD81BA89A1476300164
            5B441B105AF2DA0B49B5A0FDA592FEDB25E24BC0BC05BD32EC44EB51F61169FB
            E220893ABADFA9837E8F701900AD0329ACF6C90D3047205A683EEE134F61BE64
            0C992459B74043C939E1522B801360443658F1B2345BFA070843D43F2DEEC0C6
            B91B602E75A76067580D17C0E4AAC51DD6C78B0BA4B849AAEC7F7C99F8121B1A
            AB8E5B04E936F2D01E69336D88441E4F177F749CFDE40D841100D4BDB25591C2
            0A2680E43A24D713ADF548DA5CB37A0D968CD1D3559F0CE75C19D8120871C9D2
            62F61849DAB05C7C7149F693B386D5861BCC1B107D54F671A81F3F8E9D2BB997
            DF5AB73A655509BA6DF2C78BA4D95BCF58CB688E5596EE00F31BB78B5719851B
            CC4710BD645D708523224A7E786AA594346F6F8CE76E13049F28E89BA92FF42F
            5F1F35340C60BEE976F12AA37083F96744E3AC0F436A2D6C73A1A43FF286FBF3
            A54DDE084BBA4E9D749B44661D31A3D3D0F300F3DFDD2E5E65146E309723FA35
            FFF716E64ACECF6E9243F7BF6C2D49D58A21BDA604303D2585D26AC64889DBBD
            C994CBD00280799FDBC5AB8CC20DE687886EE4FF34DF9DEC39500E8F7CD12C2C
            FBEA81F31C17B94B4BA5D5DC7112BF6D9D53A2FD0BC01CE476F12AA37083B95E
            8C779D01B3D720393C7CB279581FC064A7826AD9F2D5F192B8E97DE36A626825
            C0ECE776F12A2D7E98C17C1FD1CDFCDF02F3EAFE72F8DE3FA1141100B37EB059
            CEDDADE68C91F8B44FC166CB46E6BB0073A0DBC5AB8CC20DE67F21BA8BFF53C7
            CCBDF83AF971CC6CC3CEEACB9C595C20ADA70D93D87D5B9D66BD5701E6BFB85D
            BCCA28DC609619D8E9DF53DCAC9DEC7FF41DF1D125A4B81AEE20B54DDE48708C
            2C69F74C1F8900E7B0DC350D9D1506F770833916D11C73E5178FCF27FB9E5A21
            45ADBBD40F3D13D26BCC9E4DD266EA106D9D323D7310C0FC8BDBC5AB8CC20DE6
            E588BE2AFB38586DC688C972B2F73D228575BD185D05A2B17DE50C69F2EE14C3
            620D98EC65ED01E661943F1E713D2868700A37989428B8A9A715AF396F6677BF
            450E3D345F243FDBE59680241B152B2D670C97C42DFFEBB4CDE68A716FE1423A
            CB9FAD75E04ACA5A80EBBE7BA35D0517564D5E476429E054D04B131BCB81096F
            4971ABCEEEDA67E393247AE746693363A4780B4E6264C65425D73A8409007493
            7B052F2737C0A4BEF69EB9F25B4E5C47EF9820C7EF7AD2AC9CB8E193C451191B
            2F4DDE7A561AAD992DA5090DCA1F41FFF5703EB738AEC7B229FB23A29CD621FA
            B80C07A0FF13FE820754C30530D952DCDBF153AB0050054A529ACB81DFBF2325
            CD3AB8333AA11A45A57F276DA70CB658BFD974E45110BD52D8EE62296CF353F1
            C520DDD10312BB778B441E4B77B2628AE2D701D02FC25FF87272CB0788BBBBFE
            644AE0116F6E96B5FD20E3BE69C6E1399C65A2092F2A4E5ACC192B491BDF332E
            9E1881DEA23C296ED8528E0E982839578099C4259A7D2C781675204D1ABF375D
            92BEFCABD9BB6204A5AF11AE01A0AEE9586E81C916A3775EAA7503ACCC5B5A22
            3F8E7A49727A0D86C8C175E030948B2024A648F2070BA4F9E2C7C40701C8B202
            A13C96B7E003F3A4F0D2DE284F8EE54158B678CE1189F2B678ED6149FAFCBF75
            9B8345F4867F2BEC0D6A57C745BFD9BB1195559C6A4A694A33491F3F5F8A2EE8
            51379EEC81949022B1DBD65BE63B7A08DAF3A017DF3E7AE79392D97F82E958C1
            DA08AC39E2F841693B79A0449EC8B05D349702CCDFB8D2A0E22E98ECE6F407BA
            DD94C4636DC32B6AD1510E3EF89A14638E923C6A0175503E8EC8B86489DEFD35
            801C6B79E4590ED0DCC45B5284B930450E3CB2089DAA7B689589C58A4B9066F3
            2748CA674B6DA3FC66317367181D7F1DD57279AF09D92C0F9148D5E258A3A208
            6ACAA151D3A4B04B4F007AD27825D45A8D3D66447EFBB1B458F8A84465FCE014
            642C01A8B0ED45920EDDB7B4618B8A5D3F313A1B7CF08A345DFA079D6B65BF98
            7D2AFBDC68CFFAB00BEC3A446BC428E46523B424A9B11C1DF8B8645FFB1BA33A
            14E6D64C30B2D40F8C3EE8B6C9EBDE9426CBA7422DCA0208F1A7BCD702B37517
            B0FB0552DAB875C5664648B70D57CF9626CB5EC0C8B4C0DC2B06CC7437DAD275
            3049007400A22562EF06A35A6099F73C927D653FC9ECFB801475F89931C65747
            75E10E6B48ADD1BB3749A3D5B32469D3FBE2E7D907D6E2F3A9F5F7F84AF02CC2
            02B3E092EB55180B4190645BCC1E2D499B3F84546B159D96A21BDD32F9D50B30
            490094EE248B10CA374CA26CDE826CE8A1CD24A7473FC9EED95F0ADA7733EA84
            D7B1EDDDAA0383C7B051D513AD67002776F737903A9749D257AB2422E7B86189
            A79E6FF023C27F8AD9821F4B6128EBFA6192C1B556E8C1A748B236C5A748CCCE
            2FA4F5F4E1461F35FE427301E438B7DAB0DE804902A03CA889E6BE4E8E225A86
            053A80F9121B4941EA4592D7F53A29E87819406E6A01E38F8AB6469365AD011B
            259B8ECC3C24717BBE91F8ED9F48CCFE34E8B299D6483466BA53EABC0D612840
            D882EFD332D5CF12844A8B2463F0D372F2E631962B49199BE786DD8404894CDF
            2D2DE78E93587C43E74B526FBCE753B7DAAF5E81494283D2084F83C2DDA73E61
            03975A23CDA323A524B9A9944048F113508C0CEEE2F214E448D48943129175C4
            1A7D96879D75944C64B0CFB1E33C0E008EEAB72171597EBDB17C17F36761CE3E
            F9F3419650C425326FE6416B3F67C3B5AF48CC8134E7567A57D51252BD03D326
            65BB5C10BE3464E14B1558CB32A36CD6EB35B6D388C88A5ECF23D89E41E3AF09
            F2DDDF237AD1E208EC3814C61A34975204BE93EE2E5147F6595CC05667C41840
            7EC9653237DBACDE824942C3D2C36A14C2503167E5D594B8E59E7B471657B474
            85EF3E86E88FE6CA6F46BCBAB5F8B5B348B91702CD78F7E07D3BDD6EAF7A0DA6
            4D685C4E743D106ED3D051EC8DBAA18915E3E95BBBC5ACD2AC42F8BAAA0722E2
            9BBF147302CAD512702E911237E1D2A97B9A5B4682403A2BC00C2434743B44D0
            55E42708D0EC2D606982A1DE4293CD01310BC85BD0D0076AF8AD2B11DD24E6F4
            4CDAEC8E8B198DABF1EE4CB7DBC249672598E729389D07F31CA2F3609E43741E
            CC7388CE83790ED17930CF01A20B2B4F130B092612B441D41A81E6954D67A09F
            5D81E86284A608D4AC29CAF308ED7578477190F45C6EB844BFC3E73B91AE2020
            0DF5BCAE083422946A9ABC20EFA2B3D8856274CC1D4853A9332EF2F0DBDC99D6
            588C8F6C1AC2FB9518156ED0F23441E08227D59FCF90E7FB10E999F6B4836E95
            58A75CE4DDAE47D075D176739EBFEAD3741E471EFA1AFD43D3D3A0B22B2898F4
            DC46B442CCAF14F045FF8A8F2DAEA451A8643F8140BD2C29E0313FB205611EDE
            3337201FBDF436681AEA6DB720CD7701695235BF5D89BE48F3559032F0DD43F5
            7226D23C5149995F40C4ADF9EC50A5DA88247AD9F140E1AF03D2D360F1470592
            0DCBCE671FE945C301B730F0DCDA638E3C8C78A8627BFD46E0291CFCE636E4E9
            A91EFF6BB43C0E1BE56931DB81E7ECF495F25F91C80F05267FA96095E3160F67
            E8810F065DF247FADF89593EF24AE5C4E33F47D9870CEAC8B04F90E4BD2BF16C
            5BC0FBD910CE5E4F2FB8CF03D2D02AF49DA371B910D919E9324294596DB0C2B3
            0A9E44E082323B31EB32518C017EA6233DD33CAFE5784181B3473E8F201FA781
            A3E576DBBCA7EE3179DA8693B57CCE76E2FF9948BF56CFA6E7A88F54E08AF49A
            27644F15E39511A38092237CA4DFA601E5582830CD52503911C45F85304CDFA9
            1573D26708EBF5833494DFEE6864D2CB78D7C39A9F2C79ABDE676FE34AFDF60A
            C0A491F4DA401F551D658F079423E861C0CAB609721A474490E79D9DB6565C0F
            1363D3E536FE11A1D8B79E2FBF4A3B464F9EBBA72393D3C61BD5D91688FC6CBB
            77116E45FE0F42A449C0B3DCD3C0D4C6652F0A5C76E00BEF74CE25CA8E398A3A
            E82DDA4259606E1B2F71A4A35D956CFA42C7FBAE429A2F6B034C3D5F88EF681B
            50668ED46E485B18F03E1EF5C69FC5988C67811D20B03D78182DEDBB649D9757
            6687457A6E21E3689F84B44F2B98E438EFE0FADE6A80C9EDF7E466032AF39A0F
            0666D9892062E6B2CBC4189A291CB0B76D75A41D2EC63BC0A63178FE4A884271
            9EE18FC534D65BD6A10FB504263BD03CBD64474CD5EF043D2E0DE9E9CD40C1EC
            0B7D5745C28E7DDC4DC8BA05C9C3BD272C731B0A6AB826984BF0FFE8B081A912
            2C01E40231276B0A4074A7E8A3495EC20B7FE748CFBD9663F5722F42878A8E25
            437AF658DDFC680934DDC44863B6C073C660E219D93759FAD5FA7C80FE3F51AF
            3F44DA3E41CA424E416189BBB99F469A7F842833592BA79C54A4395845006C8F
            FD9FF3673670CD39739998E53CA7542A7A5D104A5BA809989C6867E8E5DF90F9
            C65337C85AACE627F66A019E91F5F6D767959EC881F40F8AF9CD125170382AC9
            F276D5004CE7A95F3CCA8D9D83421505247BAAA050B531E09DFC0523FEFC455F
            BDC5B96E351BDD5E64461AE6E7A9D0ED70AF455580D47C3C1B903EC1F722DF42
            5CD3059312FEFFCBA9B2836819B950BEACD6C054A180ECA1AB361833AFC07D8A
            CE14063A6A9E47717FAAE6E1CB6FD7FB6FE2FEB04A2AE96487F42DA5704476B8
            5BEF652A983B02F271C96B6F0830D90803F4D973B8FFACDEA7B0768BDE5F84FB
            23839487A3822A15B7180ED4866687E5214ED375D4935335C3759B3300932ACC
            4A84FB91EF355C1F1223F9AED56F384726C15C10CA77A8BA60DABD89C4499E47
            6ED36B8DC39F2BEFDDF419D923E7CE7CE4E17C395CEF6FC4BD2B431468A0568E
            8BBDFFA6B7A99C7364D279CB66711C99543BD202F2B755F049C50AE606D551A9
            0BDA3E933C33817326A5EFC1A2A7676A435E52D18FBAE15D1C39F720F0242E1A
            4BC622FD3CDCA704C91F06684E89B18A60929DBE26460358A573263BFBFD55EC
            0F3506B3ECC0A54AC867BFD8A1ABD98DCC51F5A5A3208C38C77224F3D818DEE8
            A28FF98B79B7EA8FB7D9732647DD55819B5791A6BB82466247E35CB40DF7A7EA
            FB45CA15EA5054366A2B693C72208EFA1CA4EF88EBFF10D3016F0EA51A047907
            5535AA6C2D91E79082F976754EF93A6330D504474933AE2A1F1063EEEAAB15E7
            48B55D3808C21DCED57DA4A1C5840241A0AA43BF99B775EEE2686AA9F7E7E0FE
            0301155A8868845E721453D521FB0FA68E8422B2F22BAAE21D80EF51A7E49441
            4B0C3B2039053D0B6EAB425E2AF19CF39723FD00BD173ED524E0CC740A23B474
            048AEB643563F47F3EA3CEF50DF2D2AA31D1918E76D8F96236D452BF237BE6E8
            75FE3401EDB4376861399A1638C022BDCACA8B1969647DCE1EFD3A457CE41BAD
            E9481CAD648F814749534599E4B8B64EA7548E41893D0FD7A71D3F8DE7EBC4E8
            C41D55B5B0D535FE08DCAC0A1A9EB661E625FBE754B429AC7AE605EDDA53B8A0
            E4678F8C5056139A9AB66A2390E623DD2875B662C3FF3A200B59265972306728
            F6F4A1363BC53BA8CB52BD480CC84F728E68363CD50E8E4E7204DB0D932CEC9E
            108DC14E655B793620DDD5B8D749F3537A7DD8563954E07948CCB440756592DE
            A77184F2047D81D831673B3707693E966B969669349EBFAECF6C735E58C0A4AA
            F0A05ED319B857053A9753AFA4D24D917FB7AE7CF0774AC81E1B86F81647E9A7
            DAB00498E700BCE37837A5CAD9523EA7061259D7384A7DEA53BB5CEFD37E49CB
            D48A1065E688FAB35E92A350C2A5B9718A96974211A7184B481263B85EACDFCA
            75BC871D8DF327D5B7435A177AE811C8CE08DC00C54E4A697FB5235F58C19CA4
            8DCB9056919543AD38363BE4FCBA3840E061AFA422FE2B31730D47D541ADF842
            31AC97927174B0150DE4B7A44831C2836EF3B354120A14731CFA1F8F6CEB2566
            F4B2534D0BF5EB4048DB540188D33A92C5BFABCFD82928C45DA3C93945D0F1FA
            8D50C60FF5D6E3FBEE9272AEB34B3BCC62DB3BDE915EB4136CAECEC150BA1031
            44CBB4A3A2B4FF04AB072658FA4D7E260000000049454E44AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo6: TfrxMemoView
          Left = 264.567100000000000000
          Top = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[edtFiltro.text]')
        end
      end
      object MasterDataCountry: TfrxMasterData
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = frxDBCountry2
        DataSetName = 'Country2'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pa'#237's: [Country2."Name"]')
          ParentFont = False
        end
        object Subreport1: TfrxSubreport
          Align = baBottom
          Top = 22.677180000000020000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Page = frxReportSubReport.SubRepCustomer
        end
      end
    end
    object SubRepCustomer: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 230.551330000000000000
          Top = 26.456710000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'N'#227'o pode ter t'#237'tulo no sub-report')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Left = 41.574830000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Header sub-Report')
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        DataSet = frxDBCustomer
        DataSetName = 'Customer'
        Filter = '<Country2."Name"> = <Customer."Country">'
        RowCount = 0
        object CustomerCustNo: TfrxMemoView
          Left = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CustNo'
          DataSet = frxDBCustomer
          DataSetName = 'Customer'
          Memo.UTF8W = (
            '[Customer."CustNo"]')
        end
        object CustomerCompany: TfrxMemoView
          Left = 124.724490000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'Company'
          DataSet = frxDBCustomer
          DataSetName = 'Customer'
          Memo.UTF8W = (
            '[Customer."Company"]')
        end
        object CustomerCountry: TfrxMemoView
          Left = 555.590910000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'Country'
          DataSet = frxDBCustomer
          DataSetName = 'Customer'
          Memo.UTF8W = (
            '[Customer."Country"]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 60.472480000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 11.338590000000000000
          Top = 11.338590000000010000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total de clientes: [COUNT(MasterData2)]')
          ParentFont = False
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Height = 200.000000000000000000
      ClientHeight = 161.000000000000000000
      Left = 265.000000000000000000
      Top = 150.000000000000000000
      Width = 300.000000000000000000
      ClientWidth = 284.000000000000000000
      object Label1: TfrxLabelControl
        Left = 20.000000000000000000
        Top = 60.000000000000000000
        Width = 76.000000000000000000
        Height = 13.000000000000000000
        ShowHint = True
        Caption = 'Informe o filtro:'
        Color = clBtnFace
      end
      object edtFiltro: TfrxEditControl
        Left = 116.000000000000000000
        Top = 56.000000000000000000
        Width = 121.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        Color = clWindow
        MaxLength = 0
        PasswordChar = #0
      end
      object btnGerar: TfrxButtonControl
        Left = 116.000000000000000000
        Top = 116.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'Gerar'
        ModalResult = 1
        OnClick = 'btnGerarOnClick'
      end
      object btnCancelar: TfrxButtonControl
        Left = 196.000000000000000000
        Top = 116.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = 'Cancelar'
        ModalResult = 2
      end
      object chkFiltroAtivo: TfrxCheckBoxControl
        Left = 116.000000000000000000
        Top = 84.000000000000000000
        Width = 97.000000000000000000
        Height = 17.000000000000000000
        ShowHint = True
        Caption = 'Filtro Ativo'
        Color = clBtnFace
      end
    end
  end
  object memCountry: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 280
    Top = 448
    Content = {
      414442530F0031375C4A0000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B0400080000
      0043006F006400650005000800000043006F00640065000C00010000000E000D
      000F00011000011100011200011300FFFFFFFF1400FFFFFFFF15000116000117
      000118000800000043006F0064006500FEFF0B0400080000004E0061006D0065
      000500080000004E0061006D0065000C00020000000E0019001A00FF0000000F
      00011000011200011500011600011700011800080000004E0061006D0065001B
      00FF000000FEFF0B04000E0000004300610070006900740061006C0005000E00
      00004300610070006900740061006C000C00030000000E0019001A00FF000000
      0F000110000112000115000116000117000118000E0000004300610070006900
      740061006C001B00FF000000FEFF0B0400080000004100720065006100050008
      00000041007200650061000C00040000000E000D000F00011000011200011500
      011600011700011800080000004100720065006100FEFF0B0400140000005000
      6F00700075006C006100740069006F006E0005001400000050006F0070007500
      6C006100740069006F006E000C00050000000E000D000F000110000112000115
      000116000117000118001400000050006F00700075006C006100740069006F00
      6E00FEFF0B04001200000043006F006E00740069006E0065006E007400050012
      00000043006F006E00740069006E0065006E0074000C00060000000E0019001A
      00FF0000000F000110000112000115000116000117000118001200000043006F
      006E00740069006E0065006E0074001B00FF000000FEFEFF1CFEFF1DFEFF1EFF
      1F200000000000FF21000001000000010016000000410066006700680061006E
      0069007300740061006E0002000A0000004B006100620075006C0003004CE109
      0004001BAEC8010500080000004100730069006100FEFEFF1F200001000000FF
      2100000200000001000E00000041006C00620061006E006900610002000C0000
      0054006900720061006E00650003004C7000000400685E360005000C00000045
      00750072006F0070006500FEFEFF1F200002000000FF2100000300000001000E
      00000041006C006700650072006900610002000E00000041006C006700690065
      00720073000300AC57240004008D65F00105000C000000410066007200690063
      006100FEFEFF1F200003000000FF2100000400000001000E00000041006E0064
      006F0072007200610002002000000041006E0064006F0072007200610020006C
      0061002000560065006C006C0061000300D401000004009513010005000C0000
      004500750072006F0070006500FEFEFF1F200004000000FF2100000500000001
      000C00000041006E0067006F006C00610002000C0000004C00750061006E0064
      0061000300EC051300040002C2AA0005000C0000004100660072006900630061
      00FEFEFF1F200005000000FF2100000600000001002600000041006E00740069
      00670075006100200061006E0064002000420061007200620075006400610002
      00120000005300740020004A006F0068006E00270073000300BB010000040072
      0C010005001E000000430065006E007400720061006C00200041006D00650072
      00690063006100FEFEFF1F200006000000FF2100000700000001001200000041
      007200670065006E00740069006E0061000200180000004200750065006E006F
      00730020004100690072006500730003002A382A000400174D5B0205001A0000
      0053006F00750074006800200041006D0065007200690063006100FEFEFF1F20
      0007000000FF2100000800000001000E000000410072006D0065006E00690061
      0002000E0000005900650072006500760061006E000300687400000400F8832D
      0005000C0000004500750072006F0070006500FEFEFF1F200008000000FF2100
      00090000000100120000004100750073007400720061006C0069006100020010
      000000430061006E00620065007200720061000300C24A75000400458E320105
      00120000004100750073007400720061006C0069006100FEFEFF1F2000090000
      00FF2100000A00000001000E000000410075007300740072006900610002000C
      0000005600690065006E006E006100030092470100040073E37C0005000C0000
      004500750072006F0070006500FEFEFF1F20000A000000FF2100000B00000001
      001400000041007A00650072006200610069006A0061006E0002000800000042
      0061006B007500030048520100040026BA780005000C0000004500750072006F
      0070006500FEFEFF1F20000B000000FF2100000C000000010016000000420061
      00680061006D0061007300200054006800650002000C0000004E006100730073
      00610075000300743600000400DE9A040005001E000000430065006E00740072
      0061006C00200041006D0065007200690063006100FEFEFF1F20000C000000FF
      2100000D00000001000E0000004200610068007200610069006E000200140000
      0041006C002D004D0061006E0061006D00610068000300990200000400D9800A
      000500080000004100730069006100FEFEFF1F20000D000000FF2100000E0000
      00010014000000420061006E0067006C006100640065007300680002000A0000
      004400680061006B00610003008032020004008C249A08050008000000410073
      0069006100FEFEFF1F20000E000000FF2100000F000000010010000000420061
      0072006200610064006F00730002001400000042007200690064006700650074
      006F0077006E000300AF0100000400D642040005001E000000430065006E0074
      00720061006C00200041006D0065007200690063006100FEFEFF1F20000F0000
      00FF2100001000000001000E000000420065006C00610072007500730002001A
      0000004D0065006E0073006B00200028004D0069006E0073006B0029000300F0
      2A03000400432C9D0005000C0000004500750072006F0070006500FEFEFF1F20
      0010000000FF2100001100000001000E000000420065006C006700690075006D
      000200100000004200720075007300730065006C00730003002E7700000400E4
      259E0005000C0000004500750072006F0070006500FEFEFF1F200011000000FF
      2100001200000001000C000000420065006C0069007A00650002001000000042
      0065006C006D006F00700061006E000300B65900000400A143040005001E0000
      00430065006E007400720061006C00200041006D0065007200690063006100FE
      FEFF1F200012000000FF2100001300000001000A000000420065006E0069006E
      0002001400000050006F00720074006F002D004E006F0076006F000300ECB701
      000400B9D4710005000C000000410066007200690063006100FEFEFF1F200013
      000000FF2100001400000001000C000000420068007500740061006E0002000E
      0000005400680069006D00700068007500030098B700000400E30F2200050008
      0000004100730069006100FEFEFF1F200014000000FF2100001500000001000E
      00000042006F006C00690076006900610002000C0000004C0061002000500061
      007A00030054C3100004000E29870005001A00000053006F0075007400680020
      0041006D0065007200690063006100FEFEFF1F200015000000FF210000160000
      0001002C00000042006F0073006E0069006100200061006E0064002000480065
      0072007A00650067006F00760069006E00610002001000000053006100720061
      006A00650076006F000300B9C700000400846C3D0005000C0000004500750072
      006F0070006500FEFEFF1F200016000000FF2100001700000001001000000042
      006F0074007300770061006E0061000200100000004700610062006F0072006F
      006E0065000300322909000400B306190005000C000000410066007200690063
      006100FEFEFF1F200017000000FF2100001800000001000C0000004200720061
      007A0069006C00020010000000420072006100730069006C00690061000300DD
      E1810004001ADB170B05001A00000053006F00750074006800200041006D0065
      007200690063006100FEFEFF1F200018000000FF2100001900000001000C0000
      004200720075006E0065006900020026000000420061006E0064006100720020
      00530065007200690020004200650067006100770061006E0003008A16000004
      0089AE05000500080000004100730069006100FEFEFF1F200019000000FF2100
      001A000000010010000000420075006C006700610072006900610002000A0000
      0053006F0066006900610003003EB101000400EDAE710005000C000000450075
      0072006F0070006500FEFEFF1F20001A000000FF2100001B0000000100180000
      004200750072006B0069006E00610020004600610073006F000200160000004F
      00750061006700610064006F00750067006F0075000300182F04000400C17BD4
      0005000C000000410066007200690063006100FEFEFF1F20001B000000FF2100
      001C00000001000E00000042007500720075006E006400690002001200000042
      0075006A0075006D0062007500720061000300B66C000004003135610005000C
      000000410066007200690063006100FEFEFF1F20001C000000FF2100001D0000
      00010010000000430061006D0062006F00640069006100020014000000500068
      006E006F006D002000500065006E006800030030C3020004009DA0CF00050008
      0000004100730069006100FEFEFF1F20001D000000FF2100001E000000010010
      000000430061006D00650072006F006F006E0002000E000000590061006F0075
      006E0064006500030030410700040065F0F90005000C00000041006600720069
      0063006100FEFEFF1F20001E000000FF2100001F00000001000C000000430061
      006E0061006400610002000C0000004F007400740061007700610003009E5A98
      000400B190F40105001A0000004E006F00720074006800200041006D00650072
      00690063006100FEFEFF1F20001F000000FF2100002000000001001400000043
      0061007000650020005600650072006400650002000A00000050007200610069
      0061000300C10F00000400B061060005000C0000004100660072006900630061
      00FEFEFF1F200020000000FF21000021000000010030000000430065006E0074
      00720061006C0020004100660072006900630061006E00200052006500700075
      0062006C006900630002000C000000420061006E006700750069000300888109
      00040059FB390005000C000000410066007200690063006100FEFEFF1F200021
      000000FF2100002200000001000800000043006800610064000200120000004E
      00270044006A0061006D0065006E0061000300A0971300040073F0950005000C
      000000410066007200690063006100FEFEFF1F200022000000FF210000230000
      0001000A0000004300680069006C006500020010000000530061006E00740069
      00610067006F000300D68C0B00040070D9F30005001A00000053006F00750074
      006800200041006D0065007200690063006100FEFEFF1F200023000000FF2100
      002400000001000A0000004300680069006E00610002000E0000004200650069
      006A0069006E006700030020709200040054C4DC4D0500080000004100730069
      006100FEFEFF1F200024000000FF2100002500000001001000000043006F006C
      006F006D0062006900610002000C00000042006F0067006100740061000300DE
      6011000400276E8F0205001A00000053006F00750074006800200041006D0065
      007200690063006100FEFEFF1F200025000000FF2100002600000001000E0000
      0043006F006D006F0072006F00730002000C0000004D006F0072006F006E0069
      0003007A08000004000F3E0A0005000C000000410066007200690063006100FE
      FEFF1F200026000000FF2100002700000001001C00000043006F006E0067006F
      002000520065007000750062006C00690063000200160000004200720061007A
      007A006100760069006C006C0065000300F03705000400965F2E0005000C0000
      00410066007200690063006100FEFEFF1F200027000000FF2100002800000001
      003200000043006F006E0067006F002000440065006D006F0063007200610074
      00690063002000520065007000750062006C00690063000200100000004B0069
      006E00730068006100730061000300C2C9230004000CD3940305000C00000041
      0066007200690063006100FEFEFF1F200028000000FF21000029000000010014
      00000043006F0073007400610020005200690063006100020010000000530061
      006E0020004A006F007300650003009CC7000004002D483D0005001E00000043
      0065006E007400720061006C00200041006D0065007200690063006100FEFEFF
      1F200029000000FF2100002A00000001001A00000043006F0074006500200064
      002700490076006F00690072006500020018000000590061006D006F00750073
      0073006F0075006B0072006F0003009CEB0400040078F2070105000C00000041
      0066007200690063006100FEFEFF1F20002A000000FF2100002B00000001000E
      000000430072006F00610074006900610002000C0000005A0061006700720065
      0062000300DEDC00000400209A440005000C0000004500750072006F00700065
      00FEFEFF1F20002B000000FF2100002C00000001000800000043007500620061
      0002000C00000048006100760061006E00610003000CB101000400EE22AD0005
      001A0000004E006F00720074006800200041006D0065007200690063006100FE
      FEFF1F20002C000000FF2100002D00000001000C000000430079007000720075
      00730002000E0000004E00690063006F00730069006100030022240000040065
      E70B0005000C0000004500750072006F0070006500FEFEFF1F20002D000000FF
      2100002E00000001001C00000043007A00650063006800200052006500700075
      0062006C006900630002000C0000005000720061006700750065000300123401
      00040072449C0005000C0000004500750072006F0070006500FEFEFF1F20002E
      000000FF2100002F00000001000E000000440065006E006D00610072006B0002
      001400000043006F00700065006E0068006100670065006E00030056A8000004
      000FE4520005000C0000004500750072006F0070006500FEFEFF1F20002F0000
      00FF2100003000000001001000000044006A00690062006F0075007400690002
      001000000044006A00690062006F007500740069000300D859000004001F4607
      0005000C000000410066007200690063006100FEFEFF1F200030000000FF2100
      003100000001001000000044006F006D0069006E0069006300610002000C0000
      0052006F0073006500610075000300F20200000400A50D010005001E00000043
      0065006E007400720061006C00200041006D0065007200690063006100FEFEFF
      1F200031000000FF2100003200000001002400000044006F006D0069006E0069
      00630061006E002000520065007000750062006C006900630002001A00000053
      0061006E0074006F00200044006F006D0069006E0067006F0003005ABE000004
      001291880005001E000000430065006E007400720061006C00200041006D0065
      007200690063006100FEFEFF1F200032000000FF210000330000000100140000
      0045006100730074002000540069006D006F007200020008000000440069006C
      00690003009F3A00000400F0E10F000500080000004100730069006100FEFEFF
      1F200033000000FF2100003400000001000E000000450063007500610064006F
      00720002000A00000051007500690074006F000300A8530400040089E9CB0005
      001A00000053006F00750074006800200041006D0065007200690063006100FE
      FEFF1F200034000000FF2100003500000001000A000000450067007900700074
      0002000A00000043006100690072006F000300EA470F000400DCA49E0405000C
      000000410066007200690063006100FEFEFF1F200035000000FF210000360000
      0001001600000045006C002000530061006C007600610064006F007200020018
      000000530061006E002000530061006C007600610064006F0072000300305200
      000400244F660005001A0000004E006F00720074006800200041006D00650072
      00690063006100FEFEFF1F200036000000FF2100003700000001002200000045
      0071007500610074006F007200690061006C0020004700750069006E00650061
      0002000C0000004D0061006C00610062006F000300936D00000400492D080005
      000C000000410066007200690063006100FEFEFF1F200037000000FF21000038
      00000001000E000000450072006900740072006500610002000C000000410073
      006D006100720061000300E8D901000400BF9A450005000C0000004100660072
      00690063006100FEFEFF1F200038000000FF2100003900000001000E00000045
      00730074006F006E006900610002000E000000540061006C006C0069006E006E
      000300AAB0000004009D56140005000C0000004500750072006F0070006500FE
      FEFF1F200039000000FF2100003A00000001001000000045007400680069006F
      0070006900610002001600000041006400640069007300200041006200610062
      0061000300D7321100040066B45A0405000C0000004100660072006900630061
      00FEFEFF1F20003A000000FF2100003B000000010008000000460069006A0069
      00020008000000530075007600610003005E4700000400AAA10D0005000E0000
      004F006300650061006E0069006100FEFEFF1F20003B000000FF2100003C0000
      0001000E000000460069006E006C0061006E006400020010000000480065006C
      00730069006E006B006900030086240500040012B44F0005000C000000450075
      0072006F0070006500FEFEFF1F20003C000000FF2100003D00000001000C0000
      004600720061006E006300650002000A000000500061007200690073000300D6
      5808000400328A9D0305000C0000004500750072006F0070006500FEFEFF1F20
      003D000000FF2100003E00000001000A0000004700610062006F006E00020014
      0000004C006900620072006500760069006C006C006500030093150400040091
      32150005000C000000410066007200690063006100FEFEFF1F20003E000000FF
      2100003F000000010014000000470061006D0062006900610020005400680065
      0002000C000000420061006E006A0075006C000300242C00000400A84F180005
      000C000000410066007200690063006100FEFEFF1F20003F000000FF21000040
      00000001000E000000470065006F00720067006900610002000E000000540062
      0069006C006900730069000300441001000400195F470005000C000000450075
      0072006F0070006500FEFEFF1F200040000000FF2100004100000001000E0000
      004700650072006D0061006E00790002000C0000004200650072006C0069006E
      0003009D72050004009ECDE90405000C0000004500750072006F0070006500FE
      FEFF1F200041000000FF2100004200000001000A0000004700680061006E0061
      0002000A00000041006300630072006100030064A703000400DDE3400105000C
      000000410066007200690063006100FEFEFF1F200042000000FF210000430000
      0001000C00000047007200650065006300650002000C00000041007400680065
      006E007300030064030200040042C9A20005000C0000004500750072006F0070
      006500FEFEFF1F200043000000FF2100004400000001000E0000004700720065
      006E00610064006100020016000000530074002000470065006F007200670065
      002700730003005801000004009E5D010005001E000000430065006E00740072
      0061006C00200041006D0065007200690063006100FEFEFF1F200044000000FF
      21000045000000010012000000470075006100740065006D0061006C00610002
      001C000000470075006100740065006D0061006C006100200043006900740079
      0003005AA901000400D59EDF0005001E000000430065006E007400720061006C
      00200041006D0065007200690063006100FEFEFF1F200045000000FF21000046
      00000001000C0000004700750069006E006500610002000E00000043006F006E
      0061006B0072007900030061C003000400DA77900005000C0000004100660072
      00690063006100FEFEFF1F200046000000FF2100004700000001001A00000047
      00750069006E00650061002D0042006900730073006100750002000C00000042
      00690073007300610075000300188D000004005B9B150005000C000000410066
      007200690063006100FEFEFF1F200047000000FF2100004800000001000C0000
      0047007500790061006E006100020014000000470065006F0072006700650074
      006F0077006E000300BA470300040063AD0B0005001A00000053006F00750074
      006800200041006D0065007200690063006100FEFEFF1F200048000000FF2100
      004900000001000A0000004800610069007400690002001C00000050006F0072
      0074002D00610075002D005000720069006E00630065000300666C0000040016
      ED7B0005001E000000430065006E007400720061006C00200041006D00650072
      00690063006100FEFEFF1F200049000000FF2100004A00000001001000000048
      006F006E00640075007200610073000200160000005400650067007500630069
      00670061006C00700061000300DAB501000400E46E6A0005001E000000430065
      006E007400720061006C00200041006D0065007200690063006100FEFEFF1F20
      004A000000FF2100004B00000001000E000000480075006E0067006100720079
      00020010000000420075006400610070006500730074000300666B0100040033
      B1980005000C0000004500750072006F0070006500FEFEFF1F20004B000000FF
      2100004C00000001000E0000004900630065006C0061006E0064000200120000
      005200650079006B006A006100760069006B0003005892010004002187040005
      000C0000004500750072006F0070006500FEFEFF1F20004C000000FF2100004D
      00000001000A00000049006E006400690061000200120000004E006500770020
      00440065006C00680069000300262A32000400C4866340050008000000410073
      0069006100FEFEFF1F20004D000000FF2100004E00000001001200000049006E
      0064006F006E00650073006900610002000E0000004A0061006B006100720074
      0061000300D0491D000400773A6C0E0500080000004100730069006100FEFEFF
      1F20004E000000FF2100004F0000000100080000004900720061006E0002000C
      000000540065006800720061006E000300802519000400C4DE0D040500080000
      004100730069006100FEFEFF1F20004F000000FF210000500000000100080000
      00490072006100710002000E0000004200610067006800640061006400030050
      AB060004001ADF8D010500080000004100730069006100FEFEFF1F2000500000
      00FF2100005100000001000E0000004900720065006C0061006E00640002000C
      0000004400750062006C0069006E0003008812010004003C463D0005000C0000
      004500750072006F0070006500FEFEFF1F200051000000FF2100005200000001
      000C000000490073007200610065006C000200120000004A0065007200750073
      0061006C0065006D00030022510000040013C75F000500080000004100730069
      006100FEFEFF1F200052000000FF2100005300000001000A0000004900740061
      006C00790002000800000052006F006D0065000300AE9804000400F994760305
      000C0000004500750072006F0070006500FEFEFF1F200053000000FF21000054
      00000001000E0000004A0061006D0061006900630061000200100000004B0069
      006E006700730074006F006E000300EF2A0000040038AF290005001A0000004E
      006F00720074006800200041006D0065007200690063006100FEFEFF1F200054
      000000FF2100005500000001000A0000004A006100700061006E0002000A0000
      0054006F006B0079006F000300EBC3050004009C3B9807050008000000410073
      0069006100FEFEFF1F200055000000FF2100005600000001000C0000004A006F
      007200640061006E0002000A00000041006D006D0061006E0003008C68010004
      00F4E257000500080000004100730069006100FEFEFF1F200056000000FF2100
      00570000000100140000004B0061007A0061006B0068007300740061006E0002
      000C00000041006C006D006100740079000300747629000400B4B7E700050008
      0000004100730069006100FEFEFF1F200057000000FF2100005800000001000A
      0000004B0065006E007900610002000E0000004E006100690072006F00620069
      000300FAE308000400D632040205000C000000410066007200690063006100FE
      FEFF1F200058000000FF210000590000000100100000004B0069007200690062
      0061007400690002000C00000054006100720061007700610003002B03000004
      00B492010005000E0000004F006300650061006E0069006100FEFEFF1F200059
      000000FF2100005A0000000100160000004B006F0072006500610020004E006F
      00720074006800020012000000500079006F006E006700790061006E00670003
      00DCD601000400B19C5D010500080000004100730069006100FEFEFF1F20005A
      000000FF2100005B0000000100160000004B006F00720065006100200053006F
      0075007400680002000A000000530065006F0075006C000300B08001000400F4
      DEE2020500080000004100730069006100FEFEFF1F20005B000000FF2100005C
      00000001000C0000004B00750077006100690074000200160000004B00750077
      006100690074002000430069007400790003009C4500000400A0A32300050008
      0000004100730069006100FEFEFF1F20005C000000FF2100005D000000010014
      0000004B0079007200670079007A007300740061006E0002000E000000420069
      00730068006B0065006B000300640703000400A9864E00050008000000410073
      0069006100FEFEFF1F20005D000000FF2100005E0000000100080000004C0061
      006F0073000200120000005600690065006E007400690061006E006500030000
      9D03000400B5DD5E000500080000004100730069006100FEFEFF1F20005E0000
      00FF2100005F00000001000C0000004C00610074007600690061000200080000
      00520069006700610003004DFC000004003DF2220005000C0000004500750072
      006F0070006500FEFEFF1F20005F000000FF2100006000000001000E0000004C
      006500620061006E006F006E0002000C00000042006500690072007500740003
      00A0280000040062613A000500080000004100730069006100FEFEFF1F200060
      000000FF2100006100000001000E0000004C00650073006F00740068006F0002
      000C0000004D006100730065007200750003009376000004001B7D1C0005000C
      000000410066007200690063006100FEFEFF1F200061000000FF210000620000
      0001000E0000004C006900620065007200690061000200100000004D006F006E
      0072006F0076006900610003000AB3010004006322350005000C000000410066
      007200690063006100FEFEFF1F200062000000FF2100006300000001000A0000
      004C00690062007900610002000E00000054007200690070006F006C00690003
      0034D91A000400BBF9570005000C000000410066007200690063006100FEFEFF
      1F200063000000FF2100006400000001001A0000004C00690065006300680074
      0065006E0073007400650069006E0002000A00000056006100640075007A0003
      00A00000000400B583000005000C0000004500750072006F0070006500FEFEFF
      1F200064000000FF210000650000000100120000004C00690074006800750061
      006E006900610002000E000000560069006C006E006900750073000300B0FE00
      00040049E1360005000C0000004500750072006F0070006500FEFEFF1F200065
      000000FF210000660000000100140000004C007500780065006D0062006F0075
      00720067000200140000004C007500780065006D0062006F0075007200670003
      001A0A000004005B26070005000C0000004500750072006F0070006500FEFEFF
      1F200066000000FF210000670000000100120000004D0061006300650064006F
      006E006900610002000C00000053006B006F0070006A0065000300F562000004
      004E351F0005000C0000004500750072006F0070006500FEFEFF1F2000670000
      00FF210000680000000100140000004D00610064006100670061007300630061
      00720002001800000041006E00740061006E0061006E0061007200690076006F
      00030020F5080004001546130105000C000000410066007200690063006100FE
      FEFF1F200068000000FF2100006900000001000C0000004D0061006C00610077
      0069000200100000004C0069006C006F006E006700770065000300D0CE010004
      00CC87B90005000C000000410066007200690063006100FEFEFF1F2000690000
      00FF2100006A0000000100100000004D0061006C006100790073006900610002
      00180000004B00750061006C00610020004C0075006D00700075007200030016
      0805000400F07E6D010500080000004100730069006100FEFEFF1F20006A0000
      00FF2100006B0000000100100000004D0061006C006400690076006500730002
      00080000004D0061006C00650003002C0100000400B253050005000800000041
      00730069006100FEFEFF1F20006B000000FF2100006C0000000100080000004D
      0061006C00690002000C000000420061006D0061006B006F000300C0EB120004
      00C98DBB0005000C000000410066007200690063006100FEFEFF1F20006C0000
      00FF2100006D00000001000A0000004D0061006C007400610002001000000056
      0061006C006C00650074007400610003003C0100000400C614060005000C0000
      004500750072006F0070006500FEFEFF1F20006D000000FF2100006E00000001
      00200000004D00610072007300680061006C006C002000490073006C0061006E
      006400730002000C0000004D0061006A00750072006F000300150700000400BF
      E6000005000E0000004F006300650061006E0069006100FEFEFF1F20006E0000
      00FF2100006F0000000100140000004D006100750072006900740061006E0069
      0061000200140000004E006F00750061006B00630068006F007400740003002C
      BA0F0004000B1A2F0005000C000000410066007200690063006100FEFEFF1F20
      006F000000FF210000700000000100120000004D006100750072006900740069
      007500730002001400000050006F007200740020004C006F0075006900730003
      00F807000004000AC7120005000C000000410066007200690063006100FEFEFF
      1F200070000000FF2100007100000001000C0000004D0065007800690063006F
      000200160000004D0065007800690063006F0020004300690074007900030046
      191E0004001787540605001A0000004E006F00720074006800200041006D0065
      007200690063006100FEFEFF1F200071000000FF210000720000000100140000
      004D006900630072006F006E00650073006900610002000E000000500061006C
      0069006B00690072000300BE020000040049A6010005000E0000004F00630065
      0061006E0069006100FEFEFF1F200072000000FF2100007300000001000E0000
      004D006F006C0064006F0076006100020010000000430068006900730069006E
      00610075000300338400000400FDFB430005000C0000004500750072006F0070
      006500FEFEFF1F200073000000FF2100007400000001000C0000004D006F006E
      00610063006F0002000C0000004D006F006E00610063006F000300C300000004
      00997E000005000C0000004500750072006F0070006500FEFEFF1F2000740000
      00FF210000750000000100100000004D006F006E0067006F006C006900610002
      001400000055006C0061006E0020004200610074006F007200030048E1170004
      0068972A000500080000004100730069006100FEFEFF1F200075000000FF2100
      007600000001000E0000004D006F0072006F00630063006F0002000A00000052
      006100620061007400030056D006000400575BF30105000C0000004100660072
      00690063006100FEFEFF1F200076000000FF210000770000000100140000004D
      006F007A0061006D006200690071007500650002000C0000004D006100700075
      0074006F000300363B0C0004006F1F280105000C000000410066007200690063
      006100FEFEFF1F200077000000FF2100007800000001001E0000004D00790061
      006E006D0061007200200028004200750072006D006100290002000E00000052
      0061006E0067006F006F006E000300645A0A00040018BF8E0205000800000041
      00730069006100FEFEFF1F200078000000FF2100007900000001000E0000004E
      0061006D006900620069006100020010000000570069006E00640068006F0065
      006B0003004A980C00040064FC1E0005000C0000004100660072006900630061
      00FEFEFF1F200079000000FF2100007A00000001000A0000004E006100750072
      00750002000A00000059006100720065006E000300150000000400F832000005
      000E0000004F006300650061006E0069006100FEFEFF1F20007A000000FF2100
      007B00000001000A0000004E006500700061006C000200120000004B00610074
      0068006D0061006E00640075000300002602000400834FA60105000800000041
      00730069006100FEFEFF1F20007B000000FF2100007C0000000100160000004E
      00650074006800650072006C0061006E006400730002001200000041006D0073
      00740065007200640061006D00030036A200000400C35BFA0005000C00000045
      00750072006F0070006500FEFEFF1F20007C000000FF2100007D000000010016
      0000004E006500770020005A00650061006C0061006E00640002001400000057
      0065006C006C0069006E00670074006F006E00030088190400040085933D0005
      000E0000004F006300650061006E0069006100FEFEFF1F20007D000000FF2100
      007E0000000100120000004E006900630061007200610067007500610002000E
      0000004D0061006E0061006700750061000300D6F9010004000C64530005001A
      0000004E006F00720074006800200041006D0065007200690063006100FEFEFF
      1F20007E000000FF2100007F00000001000A0000004E00690067006500720002
      000C0000004E00690061006D006500790003003855130004001102B20005000C
      000000410066007200690063006100FEFEFF1F20007F000000FF210000800000
      0001000E0000004E0069006700650072006900610002000A0000004100620075
      006A006100030078180E00040094E7AC0705000C000000410066007200690063
      006100FEFEFF1F200080000000FF2100008100000001000C0000004E006F0072
      007700610079000200080000004F0073006C006F0003007CF204000400911546
      0005000C0000004500750072006F0070006500FEFEFF1F200081000000FF2100
      00820000000100080000004F006D0061006E0002000C0000004D007500730063
      00610074000300EC3D03000400EFCC2D000500080000004100730069006100FE
      FEFF1F200082000000FF21000083000000010010000000500061006B00690073
      00740061006E00020012000000490073006C0061006D00610062006100640003
      0064440C000400EA54AE090500080000004100730069006100FEFEFF1F200083
      000000FF2100008400000001000A000000500061006C006100750002000A0000
      004B006F0072006F0072000300CA01000004004F4F000005000E0000004F0063
      00650061006E0069006100FEFEFF1F200084000000FF2100008500000001000C
      000000500061006E0061006D006100020016000000500061006E0061006D0061
      00200043006900740079000300783101000400AE5F2E0005001E000000430065
      006E007400720061006C00200041006D0065007200690063006100FEFEFF1F20
      0085000000FF210000860000000100200000005000610070007500610020004E
      006500770020004700750069006E006500610002001800000050006F00720074
      0020004D006F00720065007300620079000300F80F07000400349D540005000E
      0000004F006300650061006E0069006100FEFEFF1F200086000000FF21000087
      0000000100100000005000610072006100670075006100790002001000000041
      00730075006E00630069006F006E000300DE34060004006CDC600005001A0000
      0053006F00750074006800200041006D0065007200690063006100FEFEFF1F20
      0087000000FF2100008800000001000800000050006500720075000200080000
      004C0069006D0061000300649C130004007C1CAA0105001A00000053006F0075
      0074006800200041006D0065007200690063006100FEFEFF1F200088000000FF
      210000890000000100160000005000680069006C0069007000700069006E0065
      00730002000C0000004D0061006E0069006C0061000300E0930400040041993C
      050500080000004100730069006100FEFEFF1F200089000000FF2100008A0000
      0001000C00000050006F006C0061006E00640002000C00000057006100720073
      006100770003006DC50400040088864D0205000C0000004500750072006F0070
      006500FEFEFF1F20008A000000FF2100008B00000001001000000050006F0072
      0074007500670061006C0002000C0000004C006900730062006F006E000300E7
      6801000400443AA10005000C0000004500750072006F0070006500FEFEFF1F20
      008B000000FF2100008C00000001000A00000051006100740061007200020008
      00000044006F00680061000300AD2C000004004B2B0D00050008000000410073
      0069006100FEFEFF1F20008C000000FF2100008D00000001000E00000052006F
      006D0061006E0069006100020012000000420075006300680061007200650073
      0074000300BC9F0300040079BA540105000C0000004500750072006F00700065
      00FEFEFF1F20008D000000FF2100008E00000001000C00000052007500730073
      006900610002000C0000004D006F00730063006F0077000300008C0401040095
      6B8C0805000C0000004500750072006F0070006500FEFEFF1F20008E000000FF
      2100008F00000001000C0000005200770061006E006400610002000C0000004B
      006900670061006C0069000300E26600000400F4CB800005000C000000410066
      007200690063006100FEFEFF1F20008F000000FF210000900000000100240000
      005300740020004B006900740074007300200061006E00640020004E00650076
      0069007300020014000000420061007300730065007400650072007200650003
      000501000004002E98000005001E000000430065006E007400720061006C0020
      0041006D0065007200690063006100FEFEFF1F200090000000FF210000910000
      000100100000005300740020004C007500630069006100020010000000430061
      007300740072006900650073000300680200000400A889020005001E00000043
      0065006E007400720061006C00200041006D0065007200690063006100FEFEFF
      1F200091000000FF2100009200000001003A000000530074002000560069006E
      00630065006E007400200061006E006400200074006800650020004700720065
      006E006100640069006E00650073000200120000004B0069006E006700730074
      006F0077006E0003008501000004001ECB010005001E000000430065006E0074
      00720061006C00200041006D0065007200690063006100FEFEFF1F2000920000
      00FF2100009300000001000A000000530061006D006F00610002000800000041
      007000690061000300800B0000040087B4020005000E0000004F006300650061
      006E0069006100FEFEFF1F200093000000FF2100009400000001001400000053
      0061006E0020004D006100720069006E006F00020014000000530061006E0020
      004D006100720069006E006F000300640200000400D070000005000C00000045
      00750072006F0070006500FEFEFF1F200094000000FF2100009500000001002A
      000000530061006F00200054006F006D006500200061006E0064002000500072
      0069006E006300690070006500020010000000530061006F00200054006F006D
      0065000300E9030000040012DC020005000C0000004100660072006900630061
      00FEFEFF1F200095000000FF2100009600000001001800000053006100750064
      006900200041007200610062006900610002000C000000520069007900610064
      006800030086EA1D000400BF1993010500080000004100730069006100FEFEFF
      1F200096000000FF2100009700000001000E000000530065006E006500670061
      006C0002000A000000440061006B006100720003005EFE0200040030C8A90005
      000C000000410066007200690063006100FEFEFF1F200097000000FF21000098
      00000001002A000000530065007200620069006100200061006E00640020004D
      006F006E00740065006E006500670072006F00020010000000420065006C0067
      0072006100640065000300CE8F01000400773DA50005000C0000004500750072
      006F0070006500FEFEFF1F200098000000FF2100009900000001001400000053
      00650079006300680065006C006C006500730002001000000056006900630074
      006F007200690061000300C70100000400243D010005000C0000004100660072
      00690063006100FEFEFF1F200099000000FF2100009A00000001001800000053
      006900650072007200610020004C0065006F006E006500020010000000460072
      006500650074006F0077006E0003003C18010004006BD25B0005000C00000041
      0066007200690063006100FEFEFF1F20009A000000FF2100009B000000010012
      000000530069006E006700610070006F0072006500020012000000530069006E
      006700610070006F007200650003000F1B00000400F887430005000800000041
      00730069006100FEFEFF1F20009B000000FF2100009C00000001001000000053
      006C006F00760061006B00690061000200140000004200720061007400690073
      006C006100760061000300CDBE0000040043E0520005000C0000004500750072
      006F0070006500FEFEFF1F20009C000000FF2100009D00000001001000000053
      006C006F00760065006E00690061000200120000004C006A00750062006C006A
      0061006E0061000300314F00000400BEAF1E0005000C0000004500750072006F
      0070006500FEFEFF1F20009D000000FF2100009E00000001001E00000053006F
      006C006F006D006F006E002000490073006C0061006E006400730002000E0000
      0048006F006E0069006100720061000300226F00000400B035080005000E0000
      004F006300650061006E0069006100FEFEFF1F20009E000000FF2100009F0000
      0001000E00000053006F006D0061006C00690061000200120000004D006F0067
      006100640069007300680075000300D9BA090004000D19830005000C00000041
      0066007200690063006100FEFEFF1F20009F000000FF210000A0000000010018
      00000053006F0075007400680020004100660072006900630061000200100000
      0050007200650074006F007200690061000300489D1200040048A3A40205000C
      000000410066007200690063006100FEFEFF1F2000A0000000FF210000A10000
      0001000A00000053007000610069006E0002000C0000004D0061006400720069
      0064000300CEB307000400D68F670205000C0000004500750072006F00700065
      00FEFEFF1F2000A1000000FF210000A200000001001200000053007200690020
      004C0061006E006B00610002000E00000043006F006C006F006D0062006F0003
      004A0001000400082A32010500080000004100730069006100FEFEFF1F2000A2
      000000FF210000A300000001000A00000053007500640061006E000200100000
      004B0068006100720074006F0075006D000300523C260004005E36650205000C
      000000410066007200690063006100FEFEFF1F2000A3000000FF210000A40000
      0001001000000053007500720069006E0061006D006500020014000000500061
      00720061006D0061007200690062006F000300C67D0200040080AF060005001A
      00000053006F00750074006800200041006D0065007200690063006100FEFEFF
      1F2000A4000000FF210000A50000000100120000005300770061007A0069006C
      0061006E00640002000E0000004D0062006100620061006E0065000300D34300
      0004008CE9110005000C000000410066007200690063006100FEFEFF1F2000A5
      000000FF210000A600000001000C000000530077006500640065006E00020012
      000000530074006F0063006B0068006F006C006D000300ACDD060004002E5B89
      0005000C0000004500750072006F0070006500FEFEFF1F2000A6000000FF2100
      00A700000001001600000053007700690074007A00650072006C0061006E0064
      000200080000004200650072006E0003004AA1000004005A47720005000C0000
      004500750072006F0070006500FEFEFF1F2000A7000000FF210000A800000001
      000A00000053007900720069006100020010000000440061006D006100730063
      007500730003005CD302000400708119010500080000004100730069006100FE
      FEFF1F2000A8000000FF210000A900000001000C000000540061006900770061
      006E0002000C00000054006100690070006500690003008C8C0000040030575D
      010500080000004100730069006100FEFEFF1F2000A9000000FF210000AA0000
      00010014000000540061006A0069006B0069007300740061006E000200100000
      00440075007300680061006E00620065000300FC2E02000400724E6D00050008
      0000004100730069006100FEFEFF1F2000AA000000FF210000AB000000010010
      000000540061006E007A0061006E006900610002001A00000044006100720020
      00650073002000530061006C00610061006D000300BF6B0E0004009402310205
      000C000000410066007200690063006100FEFEFF1F2000AB000000FF210000AC
      00000001001000000054006800610069006C0061006E00640002000E00000042
      0061006E0067006B006F006B000300D0D707000400139AE60305000800000041
      00730069006100FEFEFF1F2000AC000000FF210000AD00000001000800000054
      006F0067006F000200080000004C006F006D0065000300D1DD000004006FB156
      0005000C000000410066007200690063006100FEFEFF1F2000AD000000FF2100
      00AE00000001000A00000054006F006E00670061000200140000004E0075006B
      007500270061006C006F00660061000300EC020000040026B7010005000E0000
      004F006300650061006E0069006100FEFEFF1F2000AE000000FF210000AF0000
      000100260000005400720069006E006900640061006400200061006E00640020
      0054006F006200610067006F0002001A00000050006F00720074002D006F0066
      002D0053007000610069006E000300081400000400849C100005001E00000043
      0065006E007400720061006C00200041006D0065007200690063006100FEFEFF
      1F2000AF000000FF210000B000000001000E000000540075006E006900730069
      00610002000A000000540075006E006900730003001A7F0200040047BB990005
      000C000000410066007200690063006100FEFEFF1F2000B0000000FF210000B1
      00000001000C0000005400750072006B006500790002000C00000041006E006B
      00610072006100030024E90B0004008FEF260405000C0000004500750072006F
      0070006500FEFEFF1F2000B1000000FF210000B2000000010018000000540075
      0072006B006D0065006E0069007300740061006E000200100000004100730068
      00670061006200610074000300A4720700040011904B00050008000000410073
      0069006100FEFEFF1F2000B2000000FF210000B300000001000C000000540075
      00760061006C007500020010000000460075006E006100660075007400690003
      001A0000000400742D000005000E0000004F006300650061006E0069006100FE
      FEFF1F2000B3000000FF210000B400000001000C0000005500670061006E0064
      00610002000E0000004B0061006D00700061006C0061000300089A030004006A
      19A00105000C000000410066007200690063006100FEFEFF1F2000B4000000FF
      210000B500000001000E00000055006B007200610069006E0065000200160000
      004B00790069007600200028004B006900650076002900030034360900040038
      A7D30205000C0000004500750072006F0070006500FEFEFF1F2000B5000000FF
      210000B600000001002800000055006E00690074006500640020004100720061
      006200200045006D006900720061007400650073000200120000004100620075
      002000440068006100620069000300C043010004008C1C270005000800000041
      00730069006100FEFEFF1F2000B6000000FF210000B700000001001C00000055
      006E00690074006500640020004B0069006E00670064006F006D0002000C0000
      004C006F006E0064006F006E00030054BC0300040071439A0305000C00000045
      00750072006F0070006500FEFEFF1F2000B7000000FF210000B800000001001A
      00000055006E006900740065006400200053007400610074006500730002001A
      000000570061007300680069006E00670074006F006E002000440043000300A3
      ED92000400768BA01105001A0000004E006F00720074006800200041006D0065
      007200690063006100FEFEFF1F2000B8000000FF210000B900000001000E0000
      0055007200750067007500610079000200140000004D006F006E007400650076
      006900640065006F0003005CB002000400701F340005001A00000053006F0075
      0074006800200041006D0065007200690063006100FEFEFF1F2000B9000000FF
      210000BA00000001001400000055007A00620065006B0069007300740061006E
      0002001000000054006100730068006B0065006E0074000300A8D3060004007B
      B799010500080000004100730069006100FEFEFF1F2000BA000000FF210000BB
      00000001000E000000560061006E007500610074007500020008000000560069
      006C0061000300A82F00000400BA23030005000E0000004F006300650061006E
      0069006100FEFEFF1F2000BB000000FF210000BC000000010018000000560061
      0074006900630061006E00200043006900740079000200020000002D0003002C
      00000004009903000005000C0000004500750072006F0070006500FEFEFF1F20
      00BC000000FF210000BD000000010012000000560065006E0065007A00750065
      006C00610002000E00000043006100720061006300610073000300B2EA0D0004
      003132830105001A00000053006F00750074006800200041006D006500720069
      0063006100FEFEFF1F2000BD000000FF210000BE00000001000E000000560069
      00650074006E0061006D0002000A000000480061006E006F0069000300580705
      000400D8A6FA040500080000004100730069006100FEFEFF1F2000BE000000FF
      210000BF00000001001C0000005700650073007400650072006E002000530061
      0068006100720061000200020000002D000300100F04000400702A040005000C
      000000410066007200690063006100FEFEFF1F2000BF000000FF210000C00000
      0001000A000000590065006D0065006E0002000A000000530061006E00610061
      000300620E0800040017453C010500080000004100730069006100FEFEFF1F20
      00C0000000FF210000C100000001000C0000005A0061006D0062006900610002
      000C0000004C007500730061006B0061000300E67B0B00040063D7AB0005000C
      000000410066007200690063006100FEFEFF1F2000C1000000FF210000C20000
      000100100000005A0069006D006200610062007700650002000C000000480061
      0072006100720065000300B4F505000400EE80C20005000C0000004100660072
      00690063006100FEFEFEFEFEFF22FEFF23240092050000FF25FEFEFE0E004D00
      61006E0061006700650072001E00550070006400610074006500730052006500
      67006900730074007200790012005400610062006C0065004C00690073007400
      0A005400610062006C00650008004E0061006D006500140053006F0075007200
      630065004E0061006D0065000A0054006100620049004400240045006E006600
      6F0072006300650043006F006E00730074007200610069006E00740073001E00
      4D0069006E0069006D0075006D00430061007000610063006900740079001800
      43006800650063006B004E006F0074004E0075006C006C00140043006F006C00
      75006D006E004C006900730074000C0043006F006C0075006D006E0010005300
      6F007500720063006500490044000E006400740049006E007400330032001000
      4400610074006100540079007000650014005300650061007200630068006100
      62006C006500120041006C006C006F0077004E0075006C006C00100052006500
      610064004F006E006C0079000800420061007300650022004100750074006F00
      49006E006300720065006D0065006E0074005300650065006400220041007500
      74006F0049006E006300720065006D0065006E00740053007400650070001400
      4F0041006C006C006F0077004E0075006C006C0012004F0049006E0055007000
      640061007400650010004F0049006E00570068006500720065001A004F007200
      6900670069006E0043006F006C004E0061006D00650018006400740057006900
      6400650053007400720069006E0067000800530069007A006500140053006F00
      7500720063006500530069007A0065001C0043006F006E007300740072006100
      69006E0074004C00690073007400100056006900650077004C00690073007400
      0E0052006F0077004C00690073007400060052006F0077000A0052006F007700
      4900440010004F0072006900670069006E0061006C001800520065006C006100
      740069006F006E004C006900730074001C005500700064006100740065007300
      4A006F00750072006E0061006C001200530061007600650050006F0069006E00
      74000E004300680061006E00670065007300}
  end
  object frxDBCountry: TfrxDBDataset
    UserName = 'Country'
    CloseDataSource = False
    DataSet = memCountry
    BCDToCurrency = False
    Left = 280
    Top = 496
  end
  object dtsCountry: TDataSource
    DataSet = memCountry
    Left = 280
    Top = 400
  end
  object frxReportImagem: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42931.610632453700000000
    ReportOptions.LastChange = 42931.610632453700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 640
    Top = 208
    Datasets = <
      item
        DataSet = frxDBBiolife
        DataSetName = 'BioLife'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 219.212740000000000000
          Top = 26.456710000000000000
          Width = 86.929190000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Biolife')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 120.944960000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxDBBiolife
        DataSetName = 'BioLife'
        RowCount = 0
        object BioLifeSpeciesName: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779529999999994000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'Species Name'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Species Name"]')
        end
        object BioLifeGraphic: TfrxMemoView
          Left = 589.606680000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'Graphic'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Graphic"]')
        end
        object Picture1: TfrxPictureView
          Left = 589.606680000000000000
          Top = 26.456709999999990000
          Width = 113.385900000000000000
          Height = 60.472480000000000000
          DataField = 'Graphic'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object BioLifeCommon_Name: TfrxMemoView
          Left = 11.338590000000000000
          Top = 30.236240000000010000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'Common_Name'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Common_Name"]')
        end
        object BioLifeLengthcm: TfrxMemoView
          Left = 11.338590000000000000
          Top = 56.692949999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Length (cm)'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Length (cm)"]')
        end
        object BioLifeLength_In: TfrxMemoView
          Left = 109.606370000000000000
          Top = 56.692949999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Length_In'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Length_In"]')
        end
        object BioLifeNotes: TfrxMemoView
          Left = 287.244280000000000000
          Top = 30.236240000000010000
          Width = 264.567100000000000000
          Height = 60.472480000000000000
          DataField = 'Notes'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Notes"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Condition = 'BioLife."Category"'
        object BioLifeCategory: TfrxMemoView
          Left = 11.338590000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'Category'
          DataSet = frxDBBiolife
          DataSetName = 'BioLife'
          Memo.UTF8W = (
            '[BioLife."Category"]')
        end
      end
    end
  end
  object memBioLife: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 136
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = memBioLife
    Left = 136
    Top = 152
  end
  object frxDBBiolife: TfrxDBDataset
    UserName = 'BioLife'
    CloseDataSource = False
    DataSet = qryBioLife
    BCDToCurrency = False
    Left = 680
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = qryBioLife
    Left = 680
    Top = 40
  end
  object qryBioLife: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from biolife')
    Left = 680
    Top = 88
  end
  object frxReport1: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 37871.995957488400000000
    ReportOptions.Description.Strings = (
      'This report demonstrates how to use URLs and anchors.'
      ''
      
        'To assign an URL to an object, just fill in its URL property. If' +
        ' first symbol of this property is '#39'#'#39', this is an anchor (it sho' +
        'uld be added in the script by Engine.AddAnchor method). First '#39'@' +
        #39' symbol means a page number. Otherwise it is treated as an URL ' +
        '(for example, http://www.someurl.com).')
    ReportOptions.LastChange = 40197.606399016200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Band4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Engine.AddAnchor(<Sales."Company">);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 208
    Top = 440
    Datasets = <
      item
        DataSetName = 'Sales'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        Condition = 'Sales."Cust No"'
        object Memo29: TfrxMemoView
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Hyperlink.Kind = hkAnchor
          Hyperlink.Value = '[Sales."Company"]'
          DataField = 'Company'
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            '[Sales."Company"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 536.693260000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Engine.GetAnchorPage(<Sales."Company">)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSetName = 'Sales'
        RowCount = 0
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          Top = 37.795300000000000000
          Width = 699.213050000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Table of contents')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 453.543600000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'This report is created in the FastReport')
        end
        object Memo33: TfrxMemoView
          Left = 453.543600000000000000
          Top = 18.897650000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Hyperlink.Value = 'http://www.fast-report.com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            'http://www.fast-report.com')
          ParentFont = False
        end
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 210.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object Band1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 755.906000000000000000
        object Memo5: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779530000000022000
          Width = 604.724800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Top = 3.779530000000022000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Hyperlink.Kind = hkPageNumber
          Hyperlink.Value = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          Memo.UTF8W = (
            '<< back to first page')
          ParentFont = False
        end
      end
      object Band2: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo6: TfrxMemoView
          Top = 3.779530000000001000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Customers')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band4: TfrxGroupHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 105.826840000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'Band4OnBeforePrint'
        Condition = 'Sales."Cust No"'
        object Gradient1: TfrxGradientView
          Width = 714.331170000000000000
          Height = 45.354360000000000000
          EndColor = clMaroon
          Style = gsVertical
          Color = 8421568
        end
        object Memo17: TfrxMemoView
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Company')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Top = 18.897650000000000000
          Width = 306.141930000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Color = clSilver
          Memo.UTF8W = (
            '[Sales."Company"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 302.362400000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Phone')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 464.882190000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = [ftRight, ftTop]
          Memo.UTF8W = (
            'Fax')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Color = clSilver
          Memo.UTF8W = (
            '[Sales."Phone"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 464.882190000000000000
          Top = 18.897650000000000000
          Width = 249.448980000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          Memo.UTF8W = (
            '[Sales."FAX"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band5: TfrxGroupHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 173.858380000000000000
        Width = 755.906000000000000000
        Condition = 'Sales."Order No"'
        object Memo3: TfrxMemoView
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'Order No [Sales."Order No"]')
        end
        object Memo9: TfrxMemoView
          Left = 124.724490000000000000
          Width = 589.606680000000000000
          Height = 18.897650000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'Date [Sales."Sale Date"]')
        end
        object Memo10: TfrxMemoView
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Part')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 230.551330000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Description')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 355.275820000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Price')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 442.205010000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Qty')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          ParentFont = False
        end
      end
      object Band6: TfrxMasterData
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 234.330860000000000000
        Width = 755.906000000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSetName = 'Sales'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 45.354360000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'Part No'
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            '[Sales."Part No"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 113.385900000000000000
          Width = 230.551330000000000000
          Height = 15.118120000000000000
          DataField = 'Description'
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Memo.UTF8W = (
            '[Sales."Description"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 355.275820000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'List Price'
          DataSetName = 'Sales'
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haRight
          Memo.UTF8W = (
            '[Sales."List Price"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 442.205010000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'Qty'
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            '[Sales."Qty"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 510.236550000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          HAlign = haRight
          Memo.UTF8W = (
            '[<Sales."Qty">*<Sales."List Price">]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 589.606680000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          ParentFont = False
        end
      end
      object Band7: TfrxGroupFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 317.480520000000000000
        Width = 755.906000000000000000
        object Memo28: TfrxMemoView
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            
              'Total sales this customer: [Sum(<Sales."Qty">*<Sales."List Price' +
              '">)]')
        end
      end
      object Band8: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 45.354360000000000000
          Width = 544.252320000000100000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            'Total this order: [Sum(<Sales."Qty">*<Sales."List Price">)]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 589.606680000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'Customer2'
    CloseDataSource = False
    DataSet = FDMemTable1
    BCDToCurrency = False
    Left = 352
    Top = 496
  end
  object DataSource3: TDataSource
    DataSet = FDMemTable1
    Left = 352
    Top = 400
  end
  object FDMemTable1: TFDMemTable
    Active = True
    IndexFieldNames = 'Country'
    MasterFields = 'Name'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 352
    Top = 448
    Content = {
      414442530F00313770400000FF00010001FF02FF0304001A0000006D0065006D
      004500780070006F0072007400610064006F00720005000A0000005400610062
      006C006500060000000000070000080032000000090000FF0AFF0B04000C0000
      0043007500730074004E006F0005000C00000043007500730074004E006F000C
      00010000000E000D000F000110000111000112000113000114000115000C0000
      0043007500730074004E006F00FEFF0B04000E00000043006F006D0070006100
      6E00790005000E00000043006F006D00700061006E0079000C00020000000E00
      160017001E0000000F000110000111000112000113000114000115000E000000
      43006F006D00700061006E00790018001E000000FEFF0B04000A000000410064
      0064007200310005000A000000410064006400720031000C00030000000E0016
      0017001E0000000F000110000111000112000113000114000115000A00000041
      00640064007200310018001E000000FEFF0B04000A0000004100640064007200
      320005000A000000410064006400720032000C00040000000E00160017001E00
      00000F000110000111000112000113000114000115000A000000410064006400
      7200320018001E000000FEFF0B04000800000043006900740079000500080000
      0043006900740079000C00050000000E00160017000F0000000F000110000111
      0001120001130001140001150008000000430069007400790018000F000000FE
      FF0B04000A0000005300740061007400650005000A0000005300740061007400
      65000C00060000000E0016001700140000000F00011000011100011200011300
      0114000115000A00000053007400610074006500180014000000FEFF0B040006
      0000005A00690070000500060000005A00690070000C00070000000E00160017
      000A0000000F00011000011100011200011300011400011500060000005A0069
      00700018000A000000FEFF0B04000E00000043006F0075006E00740072007900
      05000E00000043006F0075006E007400720079000C00080000000E0016001700
      140000000F000110000111000112000113000114000115000E00000043006F00
      75006E00740072007900180014000000FEFF0B04000A000000500068006F006E
      00650005000A000000500068006F006E0065000C00090000000E00160017000F
      0000000F000110000111000112000113000114000115000A000000500068006F
      006E00650018000F000000FEFF0B040006000000460041005800050006000000
      4600410058000C000A0000000E00160017000F0000000F000110000111000112
      000113000114000115000600000046004100580018000F000000FEFF0B04000E
      000000540061007800520061007400650005000E000000540061007800520061
      00740065000C000B0000000E000D000F00011000011100011200011300011400
      0115000E0000005400610078005200610074006500FEFF0B04000E0000004300
      6F006E00740061006300740005000E00000043006F006E007400610063007400
      0C000C0000000E0016001700140000000F000110000111000112000113000114
      000115000E00000043006F006E007400610063007400180014000000FEFF0B04
      001E0000004C0061007300740049006E0076006F006900630065004400610074
      00650005001E0000004C0061007300740049006E0076006F0069006300650044
      006100740065000C000D0000000E0019000F0001100001110001120001130001
      14000115001E0000004C0061007300740049006E0076006F0069006300650044
      00610074006500FEFEFF1AFEFF1BFEFF1CFF1D1E0000000000FF1F0000000000
      00001493400100220000004B0061007500610069002000440069007600650020
      00530068006F0070007000650002002600000034002D00390037003600200053
      0075006700610072006C006F0061006600200048007700790003001200000053
      00750069007400650020003100300033000400160000004B0061007000610061
      0020004B00610075006100690005000400000048004900060014000000390034
      003700360036002D003100320033003400070004000000550053000800180000
      003800300038002D003500350035002D00300032003600390009001800000038
      00300038002D003500350035002D0030003200370038000A0000000000000021
      400B00180000004500720069006300610020004E006F0072006D0061006E000C
      00000014A9B59DCC42FEFEFF1D1E0001000000FF1F000000000000003C934001
      000C00000055006E006900730063006F0002001800000050004F00200042006F
      00780020005A002D00350034003700040010000000460072006500650070006F
      007200740007000E00000042006100680061006D006100730008001800000038
      00300039002D003500350035002D003300390031003500090018000000380030
      0039002D003500350035002D0034003900350038000A0000000000000000000B
      001E000000470065006F00720067006500200057006500610074006800650072
      0073000C0000003E64EF9CCC42FEFEFF1D1E0002000000FF1F00000000000000
      1C95400100160000005300690067006800740020004400690076006500720002
      001C000000310020004E0065007000740075006E00650020004C0061006E0065
      000400160000004B00610074006F00200050006100700068006F00730007000C
      0000004300790070007200750073000800180000003300350037002D0036002D
      003800370036003700300038000900180000003300350037002D0036002D0038
      00370030003900340033000A0000000000000000000B001E0000005000680079
      006C006C00690073002000530070006F006F006E00650072000C000000DA24A2
      9CCC42FEFEFF1D1E0003000000FF1F0000000000000028954001003A00000043
      00610079006D0061006E002000440069007600650072007300200057006F0072
      006C006400200055006E006C0069006D00690074006500640002001400000050
      004F00200042006F00780020003500340031000400180000004700720061006E
      00640020004300610079006D0061006E00070026000000420072006900740069
      007300680020005700650073007400200049006E006400690065007300080018
      0000003000310031002D0035002D003600390037003000340034000900180000
      003000310031002D0035002D003600390037003000360034000A000000000000
      0000000B00140000004A006F00650020004200610069006C00650079000C0000
      009AD2A792CC42FEFEFF1D1E0004000000FF1F00000000000000309540010030
      00000054006F006D002000530061007700790065007200200044006900760069
      006E0067002000430065006E0074007200650002002A0000003600330032002D
      0031002000540068006900720064002000460072007900640065006E0068006F
      006A0004001A000000430068007200690073007400690061006E007300740065
      006400050012000000530074002E002000430072006F006900780006000A0000
      0030003000380032003000070022000000550053002000560069007200670069
      006E002000490073006C0061006E00640073000800180000003500300034002D
      003700390038002D0033003000320032000900180000003500300034002D0037
      00390038002D0037003700370032000A0000000000000000000B001800000043
      0068007200690073002000540068006F006D00610073000C00000096912893CC
      42FEFEFF1D1E0005000000FF1F0000000000000090954001002A00000042006C
      007500650020004A00610063006B00200041007100750061002000430065006E
      0074006500720002002C000000320033002D0037003300380020005000610064
      00640069006E00670074006F006E0020004C0061006E00650003001200000053
      007500690074006500200033003100300004000E000000570061006900700061
      00680075000500040000004800490006000A0000003900390037003700360007
      0004000000550053000800180000003400300031002D003600300039002D0037
      003600320033000900180000003400300031002D003600300039002D00390034
      00300033000A0000000000000000000B001C000000450072006E006500730074
      00200042006100720072006100740074000C000000A037D89CCC42FEFEFF1D1E
      0006000000FF1F00000000000000A0954001001E000000560049005000200044
      0069007600650072007300200043006C00750062000200160000003300320020
      004D00610069006E002000530074002E0004001A000000430068007200690073
      007400690061006E007300740065006400050012000000530074002E00200043
      0072006F006900780006000A0000003000320038003000300007002200000055
      0053002000560069007200670069006E002000490073006C0061006E00640073
      000800180000003800300039002D003400350033002D00350039003700360009
      00180000003800300039002D003400350033002D0035003900330032000A0000
      000000000000000B0026000000520075007300730065006C006C002000430068
      0072006900730074006F0070006800650072000C000000E615B39DCC42FEFEFF
      1D1E0007000000FF1F0000000000000098974001001C0000004F006300650061
      006E0020005000610072006100640069007300650002001600000050004F0020
      0042006F007800200038003700340035000400160000004B00610069006C0075
      0061002D004B006F006E0061000500040000004800490006000A000000390034
      00370035003600070004000000550053000800180000003800300038002D0035
      00350035002D0038003200330031000900180000003800300038002D00350035
      0035002D0038003400350030000A0000000000000000000B0018000000500061
      0075006C00200047006100720064006E00650072000C000000CECADA9CCC42FE
      FEFF1D1E0008000000FF1F00000000000000A49740010028000000460061006E
      0074006100730074006900710075006500200041007100750061007400690063
      0061000200280000005A00330032002000390039003900200023003100320041
      002D0037003700200041002E0041002E0004000C00000042006F0067006F0074
      00610007001000000043006F006C0075006D0062006900610008001800000030
      00350037002D0031002D00370037003300340033003400090018000000300035
      0037002D0031002D003700370033003400320031000A0000000000000000000B
      001400000053007500730061006E00200057006F006E0067000C0000005240B5
      9BCC42FEFEFF1D1E0009000000FF1F000000000000003C98400100240000004D
      00610072006D006F0074002000440069007600650072007300200043006C0075
      00620002001A000000380037003200200051007500650065006E002000530074
      002E000400120000004B00690074006300680065006E006500720005000E0000
      004F006E0074006100720069006F0006000E000000470033004E002000320045
      00310007000C000000430061006E006100640061000800180000003400310036
      002D003600390038002D0030003300390039000900180000003400320036002D
      003600390038002D0030003300390039000A0000000000000000000B00160000
      004A006F0079006300650020004D0061007200730068000C000000D2F7E68CCC
      42FEFEFF1D1E000A000000FF1F00000000000000609840010020000000540068
      006500200044006500700074006800200043006800610072006700650002002A
      00000031003500320034003300200055006E0064006500720077006100740065
      00720020004600770079002E000400100000004D00610072006100740068006F
      006E0005000400000046004C0006000A00000033003500300030003300070004
      000000550053000800180000003800300030002D003500350035002D00330037
      00390038000900180000003800300030002D003500350035002D003000330035
      0033000A0000000000000000000B001E000000530061006D0020005700690074
      00680065007200730070006F006F006E000C0000005AC2B39ACC42FEFEFF1D1E
      000B000000FF1F000000000000006C984001001600000042006C007500650020
      00530070006F0072007400730002002A00000032003000330020003100320074
      00680020004100760065002E00200042006F0078002000370034003600040012
      0000004700690072006900620061006C00640069000500040000004F00520006
      000A000000390031003100380037000700040000005500530008001800000036
      00310030002D003700370032002D003600370030003400090018000000360031
      0030002D003700370032002D0036003800390038000A0000000000000000000B
      001A000000540068006500720065007300610020004B0075006E00650063000C
      000000CEE4FA8FCC42FEFEFF1D1E000C000000FF1F0000000000000060994001
      00200000004D0061006B0061006900200053004300550042004100200043006C
      007500620002001600000050004F00200042006F007800200038003500330034
      000400160000004B00610069006C00750061002D004B006F006E006100050004
      0000004800490006000A00000039003400370035003600070004000000550053
      000800180000003300310037002D003600340039002D00390030003900380009
      00180000003300310037002D003600340039002D0036003700380037000A0000
      000000000000000B001600000044006F006E006E006100200053006900610075
      0073000C00000068B6729DCC42FEFEFF1D1E000D000000FF1F00000000000000
      B4994001001600000041006300740069006F006E00200043006C007500620002
      001A00000050004F00200042006F007800200035003400350031002D00460004
      0010000000530061007200610073006F007400610005000400000046004C0006
      000A000000330032003200370034000700040000005500530008001800000038
      00310033002D003800370030002D003000320033003900090018000000380031
      0033002D003800370030002D0030003200380032000A0000000000000000000B
      00200000004D00690063006800610065006C00200053007000750072006C0069
      006E0067000C000000444CF698CC42FEFEFF1D1E000E000000FF1F0000000000
      0000CC99400100280000004A0061006D00610069006300610020005300430055
      00420041002000430065006E0074007200650002001200000050004F00200042
      006F00780020003600380004000C0000004E0065006700720069006C0005000E
      0000004A0061006D006100690063006100070016000000570065007300740020
      0049006E0064006900650073000800180000003000310031002D0033002D0036
      00390037003000340033000900180000003000310031002D0033002D00360039
      0037003000340033000A0000000000000000000B001C00000042006100720062
      0061007200610020004800610072007600650079000C000000FA67BF94CC42FE
      FEFF1D1E000F000000FF1F00000000000000409A4001001C000000490073006C
      0061006E0064002000460069006E00640065007200730002002A000000360031
      0033003300200031002F0033002000530074006F006E00650020004100760065
      006E007500650004001C000000530074002000530069006D006F006E00730020
      00490073006C0065000500040000004700410006000A00000033003200350032
      003100070004000000550053000800180000003700310033002D003400320033
      002D0035003600370035000900180000003700310033002D003400320033002D
      0035003600370036000A0000000000000000000B001C0000004400650073006D
      006F006E00640020004F00720074006500670061000C00000082D6659DCC42FE
      FEFF1D1E0010000000FF1F00000000000000009F400100240000004100640076
      0065006E007400750072006500200055006E0064006500720073006500610002
      001400000050004F00200042006F007800200037003400340004001600000042
      0065006C0069007A0065002000430069007400790007000C000000420065006C
      0069007A0065000800180000003000310031002D00330034002D003000390030
      00350034000900180000003000310031002D00330034002D0030003900300036
      0034000A0000000000000000000B001E00000047006C006F0072006900610020
      0047006F006E007A0061006C00650073000C0000004411D39CCC42FEFEFF1D1E
      0011000000FF1F000000000000008CA04001002000000042006C007500650020
      00530070006F00720074007300200043006C007500620002002C000000360033
      0033003600350020004E0065007A002000500065007200630065002000530074
      00720065006500740004000A0000004C006100720067006F0005000400000046
      004C0006000A0000003300340036003800340007000400000055005300080018
      0000003600310032002D003800390037002D0030003300340032000900180000
      003600310032002D003800390037002D0030003300340038000A000000000000
      0000000B001C000000480061007200720079002000420061007400680062006F
      006E0065000C0000009C4B9C8CCC42FEFEFF1D1E0012000000FF1F0000000000
      0000AEA04001002A0000004600720061006E006B002700730020004400690076
      00650072007300200053007500700070006C0079000200260000003100340035
      00350020004E006F00720074006800200034003400740068002000530074002E
      0004000C00000045007500670065006E0065000500040000004F00520006000A
      0000003900300034003200370007000400000055005300080018000000350030
      0033002D003500350035002D0032003700370038000900180000003500300033
      002D003500350035002D0032003700360039000A0000000000000000000B001A
      0000004C006C006F00790064002000460065006C006C006F00770073000C0000
      00E6A51989CC42FEFEFF1D1E0013000000FF1F00000000000000D8A040010024
      000000440061007600790020004A006F006E0065007300270020004C006F0063
      006B0065007200020028000000320034003600200053006F0075007400680020
      003100360074006800200050006C00610063006500040012000000560061006E
      0063006F0075007600650072000500040000004200430006000E0000004B0038
      005600200039005000310007000C000000430061006E00610064006100080018
      0000003800300033002D003500300039002D0030003100310032000900180000
      003800300033002D003500300039002D0030003500350033000A000000000000
      0000000B0018000000540061006E007900610020005700610067006E00650072
      000C0000002661CA91CC42FEFEFF1D1E0014000000FF1F00000000000000E6A0
      40010018000000530043005500420041002000480065006100760065006E0002
      001A00000050004F00200042006F007800200051002D00380038003700340004
      000C0000004E006100730073006100750007000E00000042006100680061006D
      00610073000800180000003000310031002D00330032002D0030003900340038
      0035000900180000003000310031002D00330032002D00300039003400380035
      000A0000000000000000000B002000000052006F00620065007200740020004D
      0069006300680065006C0069006E0064000C0000005EB49C8ECC42FEFEFF1D1E
      0015000000FF1F00000000000000EAA0400100300000005300680061006E0067
      00720069002D004C0061002000530070006F007200740073002000430065006E
      0074006500720002001A00000050004F00200042006F007800200044002D0035
      00340039003500040010000000460072006500650070006F007200740007000E
      00000042006100680061006D00610073000800180000003000310031002D0033
      0032002D00300038003500370034000900180000003000310031002D00330032
      002D00340034003900330038000A0000000000000000000B001C000000460072
      0061006E006B002000500061006E00690061006700750061000C00000084D230
      89CC42FEFEFF1D1E0016000000FF1F0000000000000016A24001002A00000044
      006900760065007200730020006F006600200043006F007200660075002C0020
      0049006E0063002E000200220000004D00610072006D006F0073006500740020
      0050006C0061006300650020003500340004001E0000004100790069006F0073
      0020004D006100740074006800610069006F00730005000A00000043006F0072
      006600750007000C000000470072006500650063006500080018000000330030
      002D003600360031002D0038003800330036003400090018000000330030002D
      003600360031002D00300035003900340033000A0000000000000000000B001A
      00000043006800610072006C006500730020004C006F00700065007A000C0000
      0008215B9BCC42FEFEFF1D1E0017000000FF1F0000000000000064A240010020
      0000004B00690072006B00200045006E00740065007200700072006900730065
      007300020018000000340032002000410071007500610020004C0061006E0065
      0004000E00000048006F007500730074006F006E000500040000005400580006
      000A000000370037003000370039000700040000005500530008001800000037
      00310033002D003500350036002D003600340033003700090018000000370031
      0033002D003500350036002D0031003000370033000A0000000000000000000B
      001A0000005200750064006F006C0070006800200043006C006100750073000C
      0000009243199ACC42FEFEFF1D1E0018000000FF1F000000000000003EA74001
      0022000000470065006F0072006700650020004200650061006E002000260020
      0043006F002E0002002600000023003700330020004B0069006E006700200053
      0061006C006D006F006E00200057006100790004000C0000004C00750067006F
      00660066000500040000004E00430006000A0000003200390030003700380007
      0004000000550053000800180000003800300033002D003400330038002D0032
      003700370031000900180000003800300033002D003400330038002D00330030
      00300033000A0000000000000000000B0014000000420069006C006C00200057
      0079006500720073000C000000D008AC9ACC42FEFEFF1D1E0019000000FF1F00
      00000000000050A740010032000000500072006F00660065007300730069006F
      006E0061006C0020004400690076006500720073002C0020004C00740064002E
      00020020000000340037003300340020004D0065006C0069006E006400610020
      00530074002E0004000C00000048006F006F0076006500720005000400000041
      004C0006000A0000003300320031003400350007000400000055005300080018
      0000003200300035002D003500350035002D0038003300330033000900180000
      003200300035002D003500350035002D0034003000350034000A000000000000
      0000000B001E00000053006800690072006C006500790020004D006100740068
      006500720073000C00000006B5F69ACC42FEFEFF1D1E001A000000FF1F000000
      00000000C2A74001002800000044006900760065007200730020006F00660020
      0042006C00750065002D0067007200650065006E000200200000003600330034
      00200043006F006D0070006C006500780020004100760065002E0004000C0000
      00500065006C00680061006D0005000400000041004C0006000A000000330032
      00310034003500070004000000550053000800180000003200300035002D0035
      00350035002D0037003100380034000900180000003200300035002D00350035
      0035002D0036003000350039000A0000000000000000000B00140000004E0061
      006E006300790020004200650061006E000C0000002AC34C9ACC42FEFEFF1D1E
      001B000000FF1F00000000000000C4A74001002200000047006F006C00640020
      0043006F00610073007400200053007500700070006C00790002002600000032
      00320033002D004200200048006F007500730074006F006E00200050006C0061
      006300650004000C0000004D006F00620069006C00650005000400000041004C
      0006000A00000033003000360039003600070004000000550053000800180000
      003200300035002D003500350035002D00320036003400300009001800000032
      00300035002D003500350035002D0034003000390034000A0000000000000000
      000B001800000045006C00610069006E0065002000460061006C006C0073000C
      0000003ECDA59BCC42FEFEFF1D1E001C000000FF1F00000000000000D6A74001
      002A000000530061006E0020005000610062006C006F00200044006900760065
      002000430065006E0074006500720002002200000031003700300031002D0044
      0020004E002000420072006F0061006400770061007900040016000000530061
      006E007400610020004D0061007200690061000500040000004300410006000A
      0000003900350034003400330007000400000055005300080018000000380032
      0033002D003000340034002D0032003900310030000900180000003800320033
      002D003000340034002D0032003900390030000A0000000000000000000B0020
      0000005000610074007200690063006900610020004F00270042007200690065
      006E000C000000DCF9BC9BCC42FEFEFF1D1E001D000000FF1F00000000000000
      D8A74001002A00000055006E0064006500720077006100740065007200200053
      0070006F00720074007300200043006F002E000200240000003300350031002D
      0041002000530061007200610073006F00740061002000530074002E00040010
      000000530061006E0020004A006F00730065000500040000004300410006000A
      0000003900320031003900350007000400000055005300080018000000340030
      0038002D003800360037002D0030003500390034000900180000003400300038
      002D003800360037002D0030003000390034000A0000000000000000000B0018
      00000044006100760065002000570061006C006C0069006E0067000C0000008A
      58649CCC42FEFEFF1D1E001E000000FF1F00000000000000DAA74001002A0000
      0041006D00650072006900630061006E00200053004300550042004100200053
      007500700070006C00790002002800000031003700330039002000410074006C
      0061006E0074006900630020004100760065006E007500650004000C0000004C
      006F006D006900740061000500040000004300410006000A0000003900310037
      0037003000070004000000550053000800180000003200310033002D00360035
      0034002D0030003000390032000900180000003200310033002D003600350034
      002D0030003000390035000A0000000000000000000B00200000004C0079006E
      006E002000430069006E006300690072006900700069006E0069000C000000DE
      FC6A9DCC42FEFEFF1D1E001F000000FF1F00000000000000DCA7400100260000
      0043006100740061006D006100720061006E0020004400690076006500200043
      006C007500620002002C00000042006F0078002000320036003400200050006C
      00650061007300750072006500200050006F0069006E00740004001E00000043
      006100740061006C0069006E0061002000490073006C0061006E006400050004
      0000004300410006000A00000039003000370034003000070004000000550053
      000800180000003200310033002D003200320033002D00300039003400310009
      00180000003200310033002D003200320033002D0032003300320034000A0000
      000000000000000B001A0000004E00690063006F006C00650020004400750070
      006F006E0074000C000000364BA79CCC42FEFEFF1D1E0020000000FF1F000000
      00000000DEA74001001C00000044006900760065007200270073002000470072
      006F00740074006F0002002800000032003400360030003100200055006E0069
      00760065007200730061006C0020004C0061006E00650004000C00000044006F
      0077006E00650079000500040000004300410006000A00000039003400320032
      003000070004000000550053000800180000003200310033002D003400330032
      002D0030003000390033000900180000003200310033002D003400330032002D
      0034003800320031000A0000000000000000000B001400000050006500740065
      00720020004F00770065006E000C000000DC90069DCC42FEFEFF1D1E00210000
      00FF1F000000000000009EA84001001E0000004600690073006800650072006D
      0061006E0027007300200045007900650002001600000050004F00200042006F
      007800200037003500340032000400180000004700720061006E006400200043
      00610079006D0061006E00070026000000420072006900740069007300680020
      005700650073007400200049006E006400690065007300080018000000380030
      0039002D003500350035002D0034003600380030000900180000003800300039
      002D003500350035002D0034003600380039000A0000000000000000000B0018
      000000420065007400680061006E0020004C0065007700690073000C000000D6
      4CD99BCC42FEFEFF1D1E0022000000FF1F00000000000000ACA8400100260000
      0041006300740069006F006E0020004400690076006500720020005300750070
      0070006C00790002002000000042006C00750065002000530070006100720020
      0042006F007800200023003300040014000000530074002E002000540068006F
      006D006100730006000A00000030003000380032003000070022000000550053
      002000560069007200670069006E002000490073006C0061006E006400730008
      0018000000320032002D00340034002D00350030003000320031003100090018
      000000320032002D00340034002D003500300030003500390036000A00000000
      00000000000B001C0000004D0061007200690061006E006E00650020004D0069
      006C00650073000C000000488D7598CC42FEFEFF1D1E0023000000FF1F000000
      000000003EAC400100260000004D006100720069006E00610020005300430055
      00420041002000430065006E0074006500720002002C00000050004F00200042
      006F00780020003800320034003300380020005A0075006C0075002000370038
      003300310004000E000000430061007200610063006100730007001200000056
      0065006E0065007A00750065006C006100080016000000350038002D00330033
      002D0036003600320032003200090016000000350038002D00330033002D0036
      0036003000340039000A0000000000000000000B001C00000053007400650070
      00680065006E00200042007200790061006E0074000C000000844F5A97CC42FE
      FEFF1D1E0024000000FF1F0000000000000020AF4001002800000042006C0075
      006500200047006C006100730073002000480061007000700069006E00650073
      0073000200240000003600330034003500200057002E002000530068006F0072
      00650020004C0061006E006500040018000000530061006E007400610020004D
      006F006E006900630061000500040000004300410006000A0000003900300034
      0031003000070004000000550053000800180000003200310033002D00350035
      0035002D0031003900380034000900180000003200310033002D003500350035
      002D0031003900390035000A0000000000000000000B00200000004300680072
      0069007300740069006E00650020005400610079006C006F0072000C000000F0
      03169DCC42FEFEFF1D1E0025000000FF1F00000000000000D8B0400100200000
      0044006900760065007200730020006F0066002000560065006E006900630065
      0002001C000000320032003000200045006C006D002000530074007200650065
      00740004000C000000560065006E0069006300650005000400000046004C0006
      000A000000330039003200320034000700040000005500530008001800000038
      00310033002D003400340033002D003200330035003600090018000000380031
      0033002D003400340033002D0039003800340032000A0000000000000000000B
      0018000000530069006D006F006E006500200047007200650065006E000C0000
      0086520899CC42FEFEFF1D1E0026000000FF1F00000000000000B3B14001001E
      0000004F006E002D005400610072006700650074002000530043005500420041
      0002002A00000037002D003700330037003600330020004E0061006E0061006B
      00610077006100200052006F0061006400040010000000570069006E006E0069
      007000650067000500100000004D0061006E00690074006F006200610006000E
      0000004A0032005200200035005400330007000C000000430061006E00610064
      0061000800180000003400310036002D003400340035002D0030003900380038
      000900180000003400310036002D003400340035002D0030003200320033000A
      0000000000000000000B001A0000004200720061006D0020005000680069006C
      006C006900700073000C0000002E04CC99CC42FEFEFF1D1E0027000000FF1F00
      0000000000002CB2400100220000004A0061006D006100690063006100200053
      0075006E002C00200049006E0063002E0002001400000050004F00200042006F
      0078002000360034003300040016000000520075006E00610077006100790020
      0042006100790005000E0000004A0061006D0061006900630061000700160000
      005700650073007400200049006E006400690065007300080018000000380030
      0039002D003500350035002D0032003700340036000900180000003800300039
      002D003500350035002D0030003900320039000A0000000000000000000B001A
      0000004A006F006E0061007400680061006E00200057006500730074000C0000
      0074103A9DCC42FEFEFF1D1E0028000000FF1F000000000000004CB240010024
      00000055006E00640065007200770061007400650072002000460061006E0074
      0061007300790002001400000050004F00200042006F00780020003800340032
      000400120000004F00630068006F002000520069006F00730005000E0000004A
      0061006D0061006900630061000700160000005700650073007400200049006E
      0064006900650073000800180000003800300039002D003500350035002D0032
      003200310034000900180000003800300039002D003500350035002D00320032
      00330034000A0000000000000000000B001E0000004700720061006E00740020
      00410069006E00730077006F007200740068000C0000002619179CCC42FEFEFF
      1D1E0029000000FF1F000000000000000CB44001002A0000005000720069006E
      0063006500730073002000490073006C0061006E006400200053004300550042
      00410002002200000050004F00200042006F0078002000330032002000570061
      0069007900650076006F0004000E000000540061007600650075006E00690007
      0008000000460069006A0069000800140000003600370039002D003300310031
      003900320033000900140000003600370039002D003300310031003200300033
      000A0000000000000000000B001A00000041006E006E00650020004D00610072
      00690061006300680069000C000000DC4E008BCC42FEFEFF1D1E002A000000FF
      1F000000000000001FB440010036000000430065006E007400720061006C0020
      0055006E0064006500720077006100740065007200200053007500700070006C
      0069006500730002001400000050004F00200042006F00780020003700330037
      000400180000004A006F00680061006E006E0065007300620075007200670006
      00080000003200300034003200070026000000520065007000750062006C0069
      006300200053006F002E00200041006600720069006300610008001A00000032
      0037002D00310031002D00340034003300320034003500380009001A00000032
      0037002D00310031002D0034003400330033003200350039000A000000000000
      0000000B001C0000004D00610072006900610020004500760065006E0074006F
      00730068000C0000008617E59CCC42FEFEFF1D1E002B000000FF1F0000000000
      00002BB440010028000000530061006600610072006900200055006E00640065
      0072002000740068006500200053006500610002001600000050004F00200042
      006F007800200037003400350036000400180000004700720061006E00640020
      004300610079006D0061006E0007002600000042007200690074006900730068
      0020005700650073007400200049006E00640069006500730008001800000038
      00300039002D003400300039002D003400320033003300090018000000380030
      0039002D003400300039002D0033003000300032000A0000000000000000000B
      001200000041006E006E00610020005200610063006B000C0000005653A198CC
      42FEFEFF1D1E002C000000FF1F000000000000002DB44001002A0000004C0061
      0072007200790027007300200044006900760069006E00670020005300630068
      006F006F006C00020028000000330035003600320020004E0057002000420072
      0075006300650020005300740072006500650074000400120000004D0069006C
      007700610075006B00690065000500040000004F00520006000A000000390036
      00320037003700070004000000550053000800180000003500300033002D0034
      00300033002D0037003700370037000900180000003500300033002D00340030
      0033002D0030003000350039000A0000000000000000000B001C000000490073
      006100620065006C006C00650020004E0065006500630065000C000000E6E71F
      9BCC42FEFEFF1D1E002D000000FF1F0000000000000008B54001001C00000054
      006F0072006100200054006F0072006100200054006F007200610002001A0000
      0050004F00200042006F007800200048002D00340035003700330004000C0000
      004E006100730073006100750007000E00000042006100680061006D00610073
      000800180000003800300039002D003800390038002D00300030003400330009
      00180000003800300039002D003800390038002D0039003800360034000A0000
      000000000000000B00160000004B006500760069006E00200052006900640065
      0072000C0000009E62BD9DCC42FEFEFF1D1E002E000000FF1F00000000000000
      24B54001001E00000056006100730068006F006E002000560065006E00740075
      0072006500730002002200000037003400330020004B006500790068006F006C
      006500200043006F0075007200740004001000000048006F006E006F006C0075
      006C0075000500040000004800490006000A0000003900320038003500360007
      0004000000550053000800180000003500330032002D003000390039002D0030
      003400320033000900180000003500330032002D003000390039002D00360036
      00350034000A0000000000000000000B001600000053007500730061006E0020
      0053006D006900740068000C000000CC30E399CC42FEFEFF1D1E002F000000FF
      1F0000000000000038B54001001E0000004400690076006500720073002D0066
      006F0072002D00480069007200650002001A00000047002E004F002E00200050
      00200042006F0078002000390031000400080000005300750076006100070008
      000000460069006A0069000800140000003600370039002D0038003000340035
      00370036000900140000003600370039002D003000350039003300340035000A
      0000000000000000000B00140000004A006F0065002000480061007400740065
      0072000C00000098F0FC99CC42FEFEFF1D1E0030000000FF1F00000000000000
      8BB5400100200000004F006300650061006E00200041006400760065006E0074
      00750072006500730002002000000050004F00200042006F0078002000340036
      00360020004B0069006800650069000400080000004D00610075006900050004
      0000004800490006000A00000039003500370033003600070004000000550053
      000800180000003700370036002D003800360038002D00390033003300340009
      00180000003700370036002D003800360038002D0039003500350033000A0000
      000000000000000B00140000005000610075006C0020005300740069006C006C
      000C0000009649759DCC42FEFEFF1D1E0031000000FF1F0000000000000047B8
      4001003000000055006E00640065007200770061007400650072002000530043
      00550042004100200043006F006D00700061006E00790002001800000050004F
      00200042006F007800200053006E0020003900310004001000000053006F006D
      00650072007300650074000600080000005300580042004E0007000E00000042
      00650072006D007500640061000800180000003800300039002D003500350035
      002D0031003200320035000900180000003800300039002D003500350035002D
      0032003400340035000A0000000000000000000B00200000004D006900630068
      00610065006C002000470072006F00730073006D0061006E000C000000FE9BAE
      9ACC42FEFEFF1D1E0032000000FF1F00000000000000A8B84001001A00000041
      0071007500610074006900630020004400720061006D00610002002400000039
      00320031002000450076006500720067006C0061006400650073002000570061
      00790004000A000000540061006D007000610005000400000046004C0006000A
      0000003300300036003400330007000400000055005300080018000000360031
      0033002D003400340032002D0037003600350034000900180000003600310033
      002D003400340032002D0037003600370038000A0000000000000000000B0018
      000000470069006C006C00690061006E0020004F00770065006E000C0000008C
      542F88CC42FEFEFF1D1E0033000000FF1F0000000000000074B9400100240000
      00540068006500200044006900760069006E006700200043006F006D00700061
      006E00790002001600000050004F00200042006F007800200038003500330035
      00040014000000530074002E002000540068006F006D006100730006000A0000
      0030003000380032003000070022000000550053002000560069007200670069
      006E002000490073006C0061006E0064007300080016000000320032002D0034
      0034002D0035003000300039003800090016000000320032002D00340034002D
      00300039003800370038000A0000000000000000000B00160000004200720069
      0061006E0020004D0069006C00650073000C0000004277DB99CC42FEFEFF1D1E
      0034000000FF1F00000000000000B6B9400100300000004E006F007200770065
      007300740027006500720020005300430055004200410020004C0069006D0069
      0074006500640002001600000050004F00200042006F00780020003600380033
      00340004000A000000500061006700650074000600080000005000530042005A
      0007000E0000004200650072006D007500640061000800180000003700370038
      002D003100320033002D0030003700340035000900180000003700370038002D
      003100320033002D0039003700300035000A0000000000000000000B00180000
      0041006E00670065006C00610020004A006F006E00650073000C000000423CB8
      9DCC42FEFEFF1D1E0035000000FF1F000000000000009CBA4001002E00000057
      006100740065007200730070006F007500740020005300430055004200410020
      00430065006E00740065007200020024000000370038003600350020004E0045
      0020004200610072006200650072002000430074002E0004001000000050006F
      00720074006C0061006E0064000500040000004F00520006000A000000390039
      00320037003100070004000000550053000800180000003500300033002D0036
      00350034002D0032003400330034000900180000003500300033002D00360035
      0034002D0039003900380036000A0000000000000000000B001C000000520069
      0063006800610072006400200048006F0075007300650072000C000000981E90
      9CCC42FEFEFF1D1E0036000000FF1F0000000000008038C3400100300000004E
      0065007000740075006E006500270073002000540072006900640065006E0074
      00200053007500700070006C00790002001400000050004F00200042006F0078
      00200031003200390004000C0000004E0065006700720069006C0005000E0000
      004A0061006D0061006900630061000700160000005700650073007400200049
      006E0064006900650073000800180000003700370038002D003800390037002D
      0033003500340036000900180000003700370038002D003800390037002D0036
      003600340033000A0000000000000000000B001A0000004C006F007500690073
      00650020004600720061006E006B0073000C000000F40972A0CC42FEFEFEFEFE
      FF20FEFF212200C9050000FF23FEFEFE0E004D0061006E006100670065007200
      1E00550070006400610074006500730052006500670069007300740072007900
      12005400610062006C0065004C006900730074000A005400610062006C006500
      08004E0061006D006500140053006F0075007200630065004E0061006D006500
      0A0054006100620049004400240045006E0066006F0072006300650043006F00
      6E00730074007200610069006E00740073001E004D0069006E0069006D007500
      6D0043006100700061006300690074007900180043006800650063006B004E00
      6F0074004E0075006C006C00140043006F006C0075006D006E004C0069007300
      74000C0043006F006C0075006D006E00100053006F0075007200630065004900
      440010006400740044006F00750062006C006500100044006100740061005400
      7900700065001400530065006100720063006800610062006C00650012004100
      6C006C006F0077004E0075006C006C000800420061007300650014004F004100
      6C006C006F0077004E0075006C006C0012004F0049006E005500700064006100
      7400650010004F0049006E00570068006500720065001A004F00720069006700
      69006E0043006F006C004E0061006D0065001800640074005700690064006500
      53007400720069006E0067000800530069007A006500140053006F0075007200
      63006500530069007A0065001400640074004400610074006500540069006D00
      65001C0043006F006E00730074007200610069006E0074004C00690073007400
      100056006900650077004C006900730074000E0052006F0077004C0069007300
      7400060052006F0077000A0052006F0077004900440010004F00720069006700
      69006E0061006C001800520065006C006100740069006F006E004C0069007300
      74001C0055007000640061007400650073004A006F00750072006E0061006C00
      1200530061007600650050006F0069006E0074000E004300680061006E006700
      65007300}
  end
  object dtsCustomer: TDataSource
    DataSet = memCustomer
    Left = 336
    Top = 240
  end
  object frxRepCross: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42721.603726030100000000
    ReportOptions.LastChange = 42721.603726030100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 512
    Top = 400
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'CrossTest'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxMemoView1: TfrxMemoView
          Left = 136.063080000000000000
          Top = 18.897650000000000000
          Width = 200.315090000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dados Cruzados')
          ParentFont = False
        end
      end
      object DBCross1: TfrxDBCrossView
        Left = 3.779530000000000000
        Top = 113.385900000000000000
        Width = 405.000000000000000000
        Height = 150.000000000000000000
        CellLevels = 3
        DownThenAcross = False
        PlainCells = True
        CellFields.Strings = (
          'Salary'
          'Days'
          'Salary')
        ColumnFields.Strings = (
          'Year')
        DataSet = frxDBDataset2
        DataSetName = 'CrossTest'
        RowFields.Strings = (
          'Name')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
          6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D223130342C
          37373935332220546F703D223139392C33383539222057696474683D22353322
          204865696768743D22323222205265737472696374696F6E733D223234222041
          6C6C6F7745787072657373696F6E733D2246616C73652220446973706C617946
          6F726D61742E466F726D61745374723D2225322E326D2220446973706C617946
          6F726D61742E4B696E643D22666B4E756D6572696322204672616D652E547970
          3D2231352220476170583D22332220476170593D2233222048416C69676E3D22
          68615269676874222056416C69676E3D22766143656E7465722220546578743D
          22522420302C3030222F3E3C546672784D656D6F56696577204C6566743D2231
          35372C37373935332220546F703D223139392C33383539222057696474683D22
          333622204865696768743D22323222205265737472696374696F6E733D223234
          2220416C6C6F7745787072657373696F6E733D2246616C736522204672616D65
          2E5479703D2231352220476170583D22332220476170593D2233222048416C69
          676E3D2268615269676874222056416C69676E3D22766143656E746572222054
          6578743D2230222F3E3C546672784D656D6F56696577204C6566743D22313933
          2C37373935332220546F703D223139392C33383539222057696474683D223533
          22204865696768743D22323222205265737472696374696F6E733D2232342220
          416C6C6F7745787072657373696F6E733D2246616C73652220446973706C6179
          466F726D61742E466F726D61745374723D2225322E326D2220446973706C6179
          466F726D61742E4B696E643D22666B4E756D6572696322204672616D652E5479
          703D2231352220476170583D22332220476170593D2233222048416C69676E3D
          2268615269676874222056416C69676E3D22766143656E746572222054657874
          3D22522420302C3030222F3E3C546672784D656D6F56696577204C6566743D22
          3130342C37373935332220546F703D223232312C33383539222057696474683D
          22353322204865696768743D22323222205265737472696374696F6E733D2232
          342220416C6C6F7745787072657373696F6E733D2246616C736522204672616D
          652E5479703D2231352220476170583D22332220476170593D2233222048416C
          69676E3D2268615269676874222056416C69676E3D22766143656E7465722220
          546578743D22522420302C3030222F3E3C546672784D656D6F56696577204C65
          66743D223135372C37373935332220546F703D223232312C3338353922205769
          6474683D22333622204865696768743D22323222205265737472696374696F6E
          733D2232342220416C6C6F7745787072657373696F6E733D2246616C73652220
          4672616D652E5479703D2231352220476170583D22332220476170593D223322
          2048416C69676E3D2268615269676874222056416C69676E3D22766143656E74
          65722220546578743D2230222F3E3C546672784D656D6F56696577204C656674
          3D223139332C37373935332220546F703D223232312C33383539222057696474
          683D22353322204865696768743D22323222205265737472696374696F6E733D
          2232342220416C6C6F7745787072657373696F6E733D2246616C736522204672
          616D652E5479703D2231352220476170583D22332220476170593D2233222048
          416C69676E3D2268615269676874222056416C69676E3D22766143656E746572
          2220546578743D22522420302C3030222F3E3C546672784D656D6F5669657720
          4C6566743D223234362C37373935332220546F703D223139392C333835392220
          57696474683D22353322204865696768743D2232322220526573747269637469
          6F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C7365
          22204672616D652E5479703D2231352220476170583D22332220476170593D22
          33222048416C69676E3D2268615269676874222056416C69676E3D2276614365
          6E7465722220546578743D22522420302C3030222F3E3C546672784D656D6F56
          696577204C6566743D223239392C37373935332220546F703D223139392C3338
          3539222057696474683D22333622204865696768743D22323222205265737472
          696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246
          616C736522204672616D652E5479703D2231352220476170583D223322204761
          70593D2233222048416C69676E3D2268615269676874222056416C69676E3D22
          766143656E7465722220546578743D2230222F3E3C546672784D656D6F566965
          77204C6566743D223333352C37373935332220546F703D223139392C33383539
          222057696474683D22353322204865696768743D223232222052657374726963
          74696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C
          736522204672616D652E5479703D2231352220476170583D2233222047617059
          3D2233222048416C69676E3D2268615269676874222056416C69676E3D227661
          43656E7465722220546578743D22522420302C3030222F3E3C546672784D656D
          6F56696577204C6566743D223234362C37373935332220546F703D223232312C
          33383539222057696474683D22353322204865696768743D2232322220526573
          7472696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D
          2246616C736522204672616D652E5479703D2231352220476170583D22332220
          476170593D2233222048416C69676E3D2268615269676874222056416C69676E
          3D22766143656E7465722220546578743D22522420302C3030222F3E3C546672
          784D656D6F56696577204C6566743D223239392C37373935332220546F703D22
          3232312C33383539222057696474683D22333622204865696768743D22323222
          205265737472696374696F6E733D2232342220416C6C6F774578707265737369
          6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
          22332220476170593D2233222048416C69676E3D226861526967687422205641
          6C69676E3D22766143656E7465722220546578743D2230222F3E3C546672784D
          656D6F56696577204C6566743D223333352C37373935332220546F703D223232
          312C33383539222057696474683D22353322204865696768743D223232222052
          65737472696374696F6E733D2232342220416C6C6F7745787072657373696F6E
          733D2246616C736522204672616D652E5479703D2231352220476170583D2233
          2220476170593D2233222048416C69676E3D2268615269676874222056416C69
          676E3D22766143656E7465722220546578743D22522420302C3030222F3E3C2F
          63656C6C6D656D6F733E3C63656C6C6865616465726D656D6F733E3C54667278
          4D656D6F56696577204C6566743D223130342C37373935332220546F703D2231
          37372C33383539222057696474683D22353322204865696768743D2232322220
          5265737472696374696F6E733D22382220416C6C6F7745787072657373696F6E
          733D2246616C736522204672616D652E5479703D2231352220476170583D2233
          2220476170593D2233222056416C69676E3D22766143656E7465722220546578
          743D224D65646961222F3E3C546672784D656D6F56696577204C6566743D2231
          35372C37373935332220546F703D223137372C33383539222057696474683D22
          333622204865696768743D22323222205265737472696374696F6E733D223822
          20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
          5479703D2231352220476170583D22332220476170593D2233222056416C6967
          6E3D22766143656E7465722220546578743D2244617973222F3E3C546672784D
          656D6F56696577204C6566743D223139332C37373935332220546F703D223137
          372C33383539222057696474683D22353322204865696768743D223232222052
          65737472696374696F6E733D22382220416C6C6F7745787072657373696F6E73
          3D2246616C736522204672616D652E5479703D2231352220476170583D223322
          20476170593D2233222056416C69676E3D22766143656E746572222054657874
          3D2253616C617279222F3E3C546672784D656D6F56696577204C6566743D2232
          34362C37373935332220546F703D223137372C33383539222057696474683D22
          353322204865696768743D22323222205265737472696374696F6E733D223822
          20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
          5479703D2231352220476170583D22332220476170593D2233222056416C6967
          6E3D22766143656E7465722220546578743D2253616C617279222F3E3C546672
          784D656D6F56696577204C6566743D223239392C37373935332220546F703D22
          3137372C33383539222057696474683D22333622204865696768743D22323222
          205265737472696374696F6E733D22382220416C6C6F7745787072657373696F
          6E733D2246616C736522204672616D652E5479703D2231352220476170583D22
          332220476170593D2233222056416C69676E3D22766143656E74657222205465
          78743D2244617973222F3E3C546672784D656D6F56696577204C6566743D2233
          33352C37373935332220546F703D223137372C33383539222057696474683D22
          353322204865696768743D22323222205265737472696374696F6E733D223822
          20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
          5479703D2231352220476170583D22332220476170593D2233222056416C6967
          6E3D22766143656E7465722220546578743D2253616C617279222F3E3C2F6365
          6C6C6865616465726D656D6F733E3C636F6C756D6E6D656D6F733E3C54667278
          4D656D6F56696577204C6566743D223130342C37373935332220546F703D2231
          35352C33383539222057696474683D2231343222204865696768743D22323222
          205265737472696374696F6E733D2232342220416C6C6F774578707265737369
          6F6E733D2246616C736522204672616D652E5479703D223135222046696C6C2E
          4261636B436F6C6F723D2231323839353233322220476170583D223322204761
          70593D2233222048416C69676E3D22686143656E746572222056416C69676E3D
          22766143656E7465722220546578743D22222F3E3C2F636F6C756D6E6D656D6F
          733E3C636F6C756D6E746F74616C6D656D6F733E3C546672784D656D6F566965
          77204C6566743D223234362C37373935332220546F703D223135352C33383539
          222057696474683D2231343222204865696768743D2232322220526573747269
          6374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C
          73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D
          22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D
          22417269616C2220466F6E742E5374796C653D223122204672616D652E547970
          3D223135222046696C6C2E4261636B436F6C6F723D2231323839353233322220
          476170583D22332220476170593D2233222048416C69676E3D22686143656E74
          65722220506172656E74466F6E743D2246616C7365222056416C69676E3D2276
          6143656E7465722220546578743D224772616E6420546F74616C222F3E3C2F63
          6F6C756D6E746F74616C6D656D6F733E3C636F726E65726D656D6F733E3C5466
          72784D656D6F56696577204C6566743D2232332C37373935332220546F703D22
          3133332C33383539222057696474683D22383122204865696768743D22323222
          205265737472696374696F6E733D22382220416C6C6F7745787072657373696F
          6E733D2246616C736522204672616D652E5479703D223135222046696C6C2E42
          61636B436F6C6F723D2231323839353233322220476170583D22332220476170
          593D2233222048416C69676E3D22686143656E746572222056416C69676E3D22
          766143656E7465722220546578743D2253616C617279222F3E3C546672784D65
          6D6F56696577204C6566743D223130342C37373935332220546F703D22313333
          2C33383539222057696474683D2232383422204865696768743D223232222052
          65737472696374696F6E733D22382220416C6C6F7745787072657373696F6E73
          3D2246616C736522204672616D652E5479703D223135222046696C6C2E426163
          6B436F6C6F723D2231323839353233322220476170583D22332220476170593D
          2233222048416C69676E3D22686143656E746572222056416C69676E3D227661
          43656E7465722220546578743D2259656172222F3E3C546672784D656D6F5669
          6577204C6566743D2238312220546F703D223232222057696474683D22343422
          204865696768743D22323222205265737472696374696F6E733D223822205669
          7369626C653D2246616C73652220416C6C6F7745787072657373696F6E733D22
          46616C736522204672616D652E5479703D2231352220476170583D2233222047
          6170593D2233222048416C69676E3D22686143656E746572222056416C69676E
          3D22766143656E7465722220546578743D22222F3E3C546672784D656D6F5669
          6577204C6566743D2232332C37373935332220546F703D223135352C33383539
          222057696474683D22383122204865696768743D223434222052657374726963
          74696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73
          6522204672616D652E5479703D223135222046696C6C2E4261636B436F6C6F72
          3D2231323839353233322220476170583D22332220476170593D223322204841
          6C69676E3D22686143656E746572222056416C69676E3D22766143656E746572
          2220546578743D224E616D65222F3E3C2F636F726E65726D656D6F733E3C726F
          776D656D6F733E3C546672784D656D6F56696577204C6566743D2232332C3737
          3935332220546F703D223139392C33383539222057696474683D223831222048
          65696768743D22323222205265737472696374696F6E733D2232342220416C6C
          6F7745787072657373696F6E733D2246616C736522204672616D652E5479703D
          223135222046696C6C2E4261636B436F6C6F723D223132383935323332222047
          6170583D22332220476170593D2233222048416C69676E3D22686143656E7465
          72222056416C69676E3D22766143656E7465722220546578743D22222F3E3C2F
          726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C546672784D656D
          6F56696577204C6566743D2232332C37373935332220546F703D223232312C33
          383539222057696474683D22383122204865696768743D223232222052657374
          72696374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246
          616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
          723D22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D
          653D22417269616C2220466F6E742E5374796C653D223122204672616D652E54
          79703D223135222046696C6C2E4261636B436F6C6F723D223132383935323332
          2220476170583D22332220476170593D2233222048416C69676E3D2268614365
          6E7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D
          22766143656E7465722220546578743D224772616E6420546F74616C222F3E3C
          2F726F77746F74616C6D656D6F733E3C63656C6C66756E6374696F6E733E3C69
          74656D20342F3E3C6974656D20312F3E3C6974656D20312F3E3C2F63656C6C66
          756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C2F
          636F6C756D6E736F72743E3C726F77736F72743E3C6974656D20302F3E3C2F72
          6F77736F72743E3C2F63726F73733E}
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from crosstest')
    Left = 608
    Top = 384
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'CrossTest'
    CloseDataSource = False
    DataSet = ADOQuery1
    BCDToCurrency = False
    Left = 608
    Top = 440
  end
end
