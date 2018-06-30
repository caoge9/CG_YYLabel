# CG_YYLabel
使用storyboard设置YYLabel
由于yylable是个UIView所以直接拖UILabel或者UIView是不可以的。
正确的做法是先在工程里扩展一个继承与yylabel的类：
public class yyLabel: YYLabel {
    
}
这样就行了。
然后拖一个UIView让它的class指定为yyLabel。很愉快你可以设置属性了。如果你直接继承YYLabel也可以，也会看到text之类的属性设置，然而并没有起作用。
项目的cell中yyLabel下面还是一个系统的label这样可以把cell撑开，我是隐藏了它的文字。设置yylabel的约束和label一样就ok了。
愉快的使用xib或者故事板吧！
