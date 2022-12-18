module Page.Gallery exposing (view, Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  {
  }


type Msg
    = NoOp


type alias Image =
    { modalId : String
    , thumbnail : String
    , artwork : String
    , description : String
    }

images2022 =
    [ Image "2022-01" "pics/2022/melt_mini.png" "pics/2022/melt.png" "melt"
    , Image "2022-02" "pics/2022/ippondake_color_mini.jpg" "pics/2022/ippondake_color.jpg" "妖怪イッポンダケ"
    , Image "2022-03" "pics/2022/rimne001_mini.jpg" "pics/2022/rimne001.png" "輪廻"
    , Image "2022-04" "pics/2022/unhealthy_beauty_2_mini.jpg" "pics/2022/unhealthy_beauty_2.png" "Unhealthy Beauty No.2"
    , Image "2022-05" "pics/2022/tak2022_brighter_mini.jpg" "pics/2022/tak2022_brighter.png" "Portrait"
    , Image "2022-06" "pics/2022/RIP_mini.jpg" "pics/2022/RIP.png" "Requiescat In Pace"
    ]

images2021 =
    [ Image "2021-01" "pics/2021/2021年賀状_mini.png" "pics/2021/2021年賀状.png" "New year card"
    , Image "2021-02" "pics/2021/20210214_mini.png" "pics/2021/20210214.png" "untitled"
    , Image "2021-03" "pics/2021/unhealthy_mini.png" "pics/2021/unhealthy.png" "Unhealthy beauty"
    , Image "2021-04" "pics/2021/ポニテ_mini.png" "pics/2021/ポニテ.png" "Ponytail"
    , Image "2021-05" "pics/2021/神の一滴_mini.png" "pics/2021/神の一滴.png" "One drop from God"
    ]

images2020 =
    [ Image "2020-01" "pics/2020/メイド長_mini.png" "pics/2020/メイド長.png" "メイド長"
    , Image "2020-02" "pics/2020/gothic_lolita_mini.png" "pics/2020/gothic_lolita.png" "Gothic Lolita"
    , Image "2020-03" "pics/2020/fashion_illust_mini.png" "pics/2020/fashion_illust.png" "Fashion Show"
    , Image "2020-04" "pics/2020/actin_mini.png" "pics/2020/actin.png" "Actin fiber expands your consciousness."
    ]

images2019 =
    [ Image "2019-01" "pics/2019/love_RGBmini.jpg" "pics/2019/love_RGB.jpg" "Love kills you."
    ]


images2018 =
    [ Image "2018-01" "pics/2018/食事_モノトーンmini.png" "pics/2018/食事_モノトーン.png" "読書"
    ]


images2017 =
    [ Image "2017-01" "pics/2017/chickenYearmini.png" "pics/2017/chickenYear.png" "酉年の年賀状"
    , Image "2017-02" "pics/2017/北枕で夢を見るmini.png" "pics/2017/北枕で夢を見る.png" "北枕で夢を見る"
    ]


images2016 =
    [ Image "2016-01" "pics/2016/羽化mini.png" "pics/2016/羽化.png" "羽化"
    , Image "2016-02" "pics/2016/smokingRGBmini.jpg" "pics/2016/smokingRGB.jpg" "smoking alone..."
    , Image "2016-03" "pics/2016/noose umbrellamini.png" "pics/2016/noose umbrella.png" "noose umbrella"
    , Image "2016-04" "pics/2016/縁側で寝るmini.png" "pics/2016/縁側で寝る.png" "縁側で寝る、変な星の色。"
    , Image "2016-05" "pics/2016/BTmini.png" "pics/2016/BT.png" "No title"
    , Image "2016-06" "pics/2016/独我論mini.jpg" "pics/2016/独我論.jpg" "独我論 (solipsism)"
    ]

images2015 =
    [ Image "2015-01" "pics/2015/neckRGBmini.jpg" "pics/2015/neckRGB.jpg" "neck"
    , Image "2015-02" "pics/2015/MermaidMummymini.png" "pics/2015/MermaidMummy.png" "Mermaid Mummy"
    , Image "2015-03" "pics/2015/EarPhonemini.png" "pics/2015/EarPhone.png" "聴こえる..."
    , Image "2015-04" "pics/2015/Demon or Demonmini.png" "pics/2015/Demon or Demon.png" "悪魔と悪魔"
    , Image "2015-05" "pics/2015/blue and devil mini.png" "pics/2015/blue and devil.png" "blue and devil"
    , Image "2015-06" "pics/2015/anti-blue and devil mini.png" "pics/2015/anti-blue and devil.png" "anti-blue and devil"
    , Image "2015-07" "pics/2015/脳が溶け出すmini.png" "pics/2015/脳が溶け出す.png" "誰かがみんなの記憶と体験を回収してデータベースを作っている。"
    ]


images2014 =
    [ Image "2014-01" "pics/2014/suicidal ideationmini.png" "pics/2014/suicidal ideation.png" "suicidal ideation"
    , Image "2014-02" "pics/2014/EyeDropmini.png" "pics/2014/EyeDrop.png" "EyeDrop"
    , Image "2014-03" "pics/2014/花魁mini.png" "pics/2014/花魁.jpg" "花魁(oiran)"
    , Image "2014-04" "pics/2014/三日月mini.png" "pics/2014/三日月.png" "三日月(crescent)"
    , Image "2014-05" "pics/2014/cigarettemini.png" "pics/2014/cigarette.png" "cigarette"
    , Image "2014-06" "pics/2014/hall20140412mini.png" "pics/2014/hall20140412.png" "hall20140412"
    , Image "2014-07" "pics/2014/weeeeeemini.png" "pics/2014/weeeeee.png" "weeeeee"
    , Image "2014-08" "pics/2014/お昼寝mini.png" "pics/2014/お昼寝.png" "お昼寝(nap)"
    , Image "2014-09" "pics/2014/20140914mini.jpg" "pics/2014/20140914.jpg" "Blue Murderous Intent"
    , Image "2014-10" "pics/2014/DIYcompmini.jpg" "pics/2014/DIYcomp.jpg" "DIY"
    ]


images2013 =
    [ Image "2013-01" "pics/2013/御手洗団子mini.png" "pics/2013/御手洗団子.png" "みたらし団子"
    , Image "2013-02" "pics/2013/心に触れるmini.png" "pics/2013/心に触れる.png" "心に触れる"
    , Image "2013-03" "pics/2013/hystericgirlsmini.png" "pics/2013/hystericgirls.png" "hysteric school girls"
    , Image "2013-04" "pics/2013/blueeyesmini.png" "pics/2013/blueeyes.png" "blue eyes"
    , Image "2013-05" "pics/2013/究極の透明感のある肌mini.png" "pics/2013/究極の透明感のある肌.png" "究極の透明感のある肌"
    , Image "2013-06" "pics/2013/伝達mini.png" "pics/2013/伝達.png" "伝達"
    , Image "2013-07" "pics/2013/almondogmini.png" "pics/2013/almondog.png" "アーモンドプードル_Almondog"
    , Image "2013-08" "pics/2013/あはは楽しいmini.png" "pics/2013/あはは楽しい.png" "あはは楽しい_FEEL SO GOOD!"
    , Image "2013-09" "pics/2013/NoFacemini.png" "pics/2013/NoFace.png" "・・・・・誰？"
    , Image "2013-10" "pics/2013/smilingmini.png" "pics/2013/smiling.png" "No title"
    , Image "2013-11" "pics/2013/試用目隠しカバー13_dAmini.png" "pics/2013/試用目隠しカバー13_dA.png" "積怨"
    , Image "2013-12" "pics/2013/automatismmini.png" "pics/2013/automatism.png" "automatism"
    , Image "2013-13" "pics/2013/automatism2mini.png" "pics/2013/automatism2.png" "automatism2"
    , Image "2013-14" "pics/2013/lip_needlemini.png" "pics/2013/lip_needle.png" "needle"
    , Image "2013-15" "pics/2013/見せないmini.png" "pics/2013/見せない.png" "No title"
    , Image "2013-16" "pics/2013/infantmini.png" "pics/2013/infant.png" "Like an infant"
    , Image "2013-17" "pics/2013/cuttermini.png" "pics/2013/cutter.png" "dissociation"
    , Image "2013-18" "pics/2013/幸せのかたちmini.png" "pics/2013/幸せのかたち.png" "幸せのかたち"
    , Image "2013-19" "pics/2013/BUfKX62CIAAnHLLmini.png" "pics/2013/BUfKX62CIAAnHLL.png" "No tilte"
    , Image "2013-20" "pics/2013/researchermini.png" "pics/2013/researcher.png" "researcher"
    , Image "2013-21" "pics/2013/hangmini.png" "pics/2013/hang.png" "hang"
    , Image "2013-22" "pics/2013/sciencemini.jpg" "pics/2013/science.jpg" "science"
    , Image "2013-23" "pics/2013/lastscenemini.png" "pics/2013/lastscene.png" "最期に見た光景"
    , Image "2013-24" "pics/2013/handsmini.png" "pics/2013/hands.png" "hands"
    , Image "2013-25" "pics/2013/2014NewYearmini.jpg" "pics/2013/2014NewYear.jpg" "午年"
    ]


images2012 =
    [ Image "2012-01" "pics/2012/MJとこの海mini.png" "pics/2012/MJとこの海.png" "metempsychosis"
    , Image "2012-02" "pics/2012/冬mini.png" "pics/2012/冬.png" "winter"
    , Image "2012-03" "pics/2012/吐きたい2mini.png" "pics/2012/吐きたい2.png" "vomit"
    , Image "2012-04" "pics/2012/均質mini.png" "pics/2012/均質.png" "均質は美徳か_homogeneity"
    , Image "2012-05" "pics/2012/思いっきりmini.png" "pics/2012/思いっきり.png" "思いっきり"
    , Image "2012-06" "pics/2012/勉強嫌mini.png" "pics/2012/勉強嫌.png" "勉強嫌"
    , Image "2012-07" "pics/2012/没個性と記号の値段mini.png" "pics/2012/没個性と記号の値段.png" "没個性と記号の値段"
    , Image "2012-08" "pics/2012/表層mini.png" "pics/2012/表層.png" "表層"
    , Image "2012-09" "pics/2012/小悪魔mini.jpg" "pics/2012/小悪魔.jpg" "小悪魔"
    , Image "2012-10" "pics/2012/プロングホーンmini.png" "pics/2012/プロングホーン.png" "Pronghorn"
    , Image "2012-11" "pics/2012/hmmemini.png" "pics/2012/hmme.png" "No title"
    , Image "2012-12" "pics/2012/depressmini.png" "pics/2012/depress.png" "hate me"
    , Image "2012-13" "pics/2012/巳01mini.png" "pics/2012/巳01.png" "巳01"
    , Image "2012-14" "pics/2012/巳02mini.png" "pics/2012/巳02.png" "巳02"
    , Image "2012-15" "pics/2012/ヘビゲッティmini.png" "pics/2012/ヘビゲッティ.png" "ヘビゲッティ"
    ]


imagesBefore2012 =
    [ Image "b2011-01" "pics/before2012/愛犬pngvermini.PNG" "pics/before2012/愛犬pngver.PNG" "My doggy"
    , Image "b2011-02" "pics/before2012/cell_cyclemini.png" "pics/before2012/cell_cycle.png" "the cell cycle"
    , Image "b2011-03" "pics/before2012/鳥獣戯画風mini.png" "pics/before2012/鳥獣戯画風.png" "鳥獣戯画風01"
    , Image "b2011-04" "pics/before2012/鳥獣戯画風revmini.png" "pics/before2012/鳥獣戯画風rev.png" "鳥獣戯画風02"
    , Image "b2011-05" "pics/before2012/maymini.png" "pics/before2012/may.png" "五月晴れ"
    , Image "b2011-06" "pics/before2012/二重盲検法mini.png" "pics/before2012/二重盲検法.png" "二重猛犬法-double blind test-"
    , Image "b2011-07" "pics/before2012/colourmini.png" "pics/before2012/colour.png" "colours"
    , Image "b2011-08" "pics/before2012/あかねさすmini.png" "pics/before2012/あかねさす.png" "あかねさす"
    ]


imagesSydney =
    [ Image "w2013-01" "pics/sydney/entermini.png" "pics/sydney/enter.png" ""
    , Image "w2013-02" "pics/sydney/02city_far_2mini.png" "pics/sydney/02city_far_2.png" ""
    , Image "w2013-03" "pics/sydney/Ash_WaterColourmini.png" "pics/sydney/Ash_WaterColour.png" ""
    , Image "w2013-04" "pics/sydney/biography01mini.png" "pics/sydney/biography01.png" ""
    , Image "w2013-05" "pics/sydney/discography03mini.png" "pics/sydney/discography03.png" ""
    , Image "w2013-06" "pics/sydney/Newsmini.png" "pics/sydney/News.png" ""
    , Image "w2013-07" "pics/sydney/Photo002mini.png" "pics/sydney/Photo002.png" ""
    , Image "w2013-08" "pics/sydney/Novel001mini.png" "pics/sydney/Novel001.png" ""
    , Image "w2013-09" "pics/sydney/Link001mini.png" "pics/sydney/Link001.png" ""
    , Image "w2013-10" "pics/sydney/show02mini.png" "pics/sydney/show02.png" ""
    , Image "w2013-11" "pics/sydney/video001mini.png" "pics/sydney/video001.png" ""
    ]


imagesDid =
    [ Image "w2019-01" "pics/DID_anthology/DIDmini.jpg" "pics/DID_anthology/DID.jpg" "第七回文学フリマ大阪(08.Sep.2019)"]


view : Model -> Html Msg
view model =
    div [] [
        h5 [ class "gallery-year" ] [ text "2022" ]
      , div [ class "row" ] ( List.map makeModal images2022 )
      , h5 [ class "gallery-year" ] [ text "2021" ]
      , div [ class "row" ] ( List.map makeModal images2021 )
      , h5 [ class "gallery-year" ] [ text "2020" ]
      , div [ class "row" ] ( List.map makeModal images2020 )
      , h5 [ class "gallery-year" ] [ text "2019" ]
      , div [ class "row" ] ( List.map makeModal images2019 )
      , h6 [] [ text "Works for Clients" ]
      , div [ class "row" ] ( List.map makeModal imagesDid )
      , h5 [ class "gallery-year" ] [ text "2018" ]
      , div [ class "row" ] ( List.map makeModal images2018 )
      , h5 [ class "gallery-year" ] [ text "2017" ]
      , div [ class "row" ] ( List.map makeModal images2017 )
      , h5 [ class "gallery-year" ] [ text "2016" ]
      , div [ class "row" ] ( List.map makeModal images2016 )
      , h5 [ class "gallery-year" ] [ text "2015" ]
      , div [ class "row" ] ( List.map makeModal images2015 )
      , h5 [ class "gallery-year" ] [ text "2014" ]
      , div [ class "row" ] ( List.map makeModal images2014 )
      , h5 [ class "gallery-year" ] [ text "2013" ]
      , div [ class "row" ] ( List.map makeModal images2013 )
      , h6 [] [ text "Works for Clients" ]
      , div [ class "row" ] ( List.map makeModal imagesSydney )
      , h5 [ class "gallery-year" ] [ text "2012" ]
      , div [ class "row" ] ( List.map makeModal images2012 )
      , h5 [ class "gallery-year" ] [ text "~2011" ]
      , div [ class "row" ] ( List.map makeModal imagesBefore2012 )
    ]


makeModal image =
    div [ class "col l2" ]
        [ a [ class "modal-trigger", href ("#" ++ image.modalId) ]
            [ img [ class "responsive-img", src image.thumbnail ] [] ]
        , div [ class "modal modal-fixed-footer", id image.modalId ]
            [ div [ class "modal-content" ]
                [ div [ class "modal-header" ] 
                    [ a [ class "modal-close btn-flat right", href "#" ] [ text "Close" ]
                    ]
                , div [ class "modal-body center" ]
                    [ img [ class "image-in-modal", src image.artwork ] []
                    ]
                ]
            , div [ class "modal-footer" ]
                [ div [ class "left" ] [ span [] [ text ( image.modalId ++ ": " ++ image.description ) ] ]
                ]
            ]
        ]
