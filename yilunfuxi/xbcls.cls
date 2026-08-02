%# -*- coding:utf-8 -*-
%%%%%%%%%%%%%%%%%%%%%%
%% start of file `xbcls.cls'.
%%%%%%%%%%%%%%%%%%%%%
% \RequirePackage 不會重復載入宏包，\usepackage 會. 


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xbcls}[2024/09/24 v0.01 books document class]

\LoadClass[UTF8, oneside, openany]{ctexbook}  % hyperref选项去掉了, 以前是书签乱码才添加的. 
\ctexset{autoindent=false} \setlength\parindent{0pt} % 不缩进


% 章节等的距离/大小设置. 
% \CTEXsetup[选项]{标题} 相当于设置了 \ctexset{ 标题 = {选项} }  貌似这个命令在最新的ctex宏包中已经过时, 但还能用.
%\ctexset{section={format={\large\bfseries\raggedright}}}
\ctexset{
part={
  numbering=false, 
  name={}, 
  }, 
chapter={
  titleformat={\Large\bfseries\centering},
  nameformat={\Large\bfseries},
  beforeskip={-20pt},
  afterskip=0pt,
  },
section={
    name={\S},
    number=\arabic{chapter}.\arabic{section}~,
    %format=\large\bfseries\raggedright,
    format=\large\bfseries\centering,
    aftername={\,},
    beforeskip=2pt,
    },
subsection={
    name={\S},
    number=\arabic{chapter}.\arabic{section}.\arabic{subsection}~,
    format=\normalsize\bfseries,
    aftername={\,},
    beforeskip=2pt,
    },
	}


\RequirePackage{geometry}
\geometry{
   a4paper,
   left=2cm, right=2.3cm,  %% or inner=xx , outer=yy
   top=1cm, bottom=1.5cm, 
   headheight=4mm,
   headsep=4mm,
   includehead,includefoot,
   marginparsep=1pc,marginparsep=0pc,marginparwidth=0pc, 
   footskip=12mm
}

% % 页眉和页脚的相关定义
% \RequirePackage{fancyhdr}                  
% \fancyhf{}
% \renewcommand{\headrule}{%
% %\hrule height0.8pt width\headwidth \vskip0.8pt % 只是为了单线, 故注释掉.
% \hrule height0.4pt width\headwidth \vskip-2pt  %
% }
% %以上三行代码将页眉改为两条水平线, 第一条粗0.8pt, 第二条粗0.4pt, 它们之间的距离为0.8pt.
% %减去1.6pt是为了抵消第一条线及第二条线之间的间隔所占的垂直距离, 从而使整个页眉的高度保持不变.顶顶顶顶d大调ddd交集

% %如果需要画单隔线，则需要
% \renewcommand{\headrulewidth}{0.5pt}    % 在页眉下画一个0.5pt宽的分隔线
% \renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线, 其实就是画0pt粗的线.

\pagestyle{empty}   				% 清空页面的设置. 
% \renewcommand\sectionmark[1]{%
% \markright{\CTEXthesection~~#1}}		% 修改页眉小节的表现形式, 即数字编号与section名之间多了—
% \fancyhead[LO]{\songti{\rightmark}}
% \fancyhead[RO]{$\cdot$\,\thepage\,$\cdot$}     %{\heiti 第\thepage页, 共\pageref{LastPage}页}  [C]表示居中

%=============================== 控制title
\RequirePackage{titlesec}                 
\newcommand{\sectionbreak}{\clearpage}    % section从新的页面开始, 就不要\clearpage 单独控制了.

%=============================== 作图宏包
\RequirePackage{pgf,tikz}
\usetikzlibrary{calc} % 可以进行坐标计算
\usetikzlibrary{decorations, decorations.markings, decorations.pathmorphing, decorations.pathreplacing, decorations.shapes, decorations.text}
\usetikzlibrary{arrows}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{angles}
\usetikzlibrary{backgrounds}
\usetikzlibrary{external}
\usetikzlibrary{folding}
\usetikzlibrary{graphs}
\usetikzlibrary{intersections}
\usetikzlibrary{math} % 提供了tikzmath命令
\usetikzlibrary{matrix}  % 数阵的写法: \matrix[matrix of nodes]
\usetikzlibrary{positioning}
\usetikzlibrary{quotes}
\usetikzlibrary{shapes}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{trees,fit}

\RequirePackage{tikzsymbols}  % symbols中有 \Neutrey \Smiley 等等脸部表情. % 为了画一棵树 \Springtree
\RequirePackage{tkz-base} % 20200704 画三角公式推导流程图 20211215 添加
\RequirePackage{tabularray}
\RequirePackage{tcolorbox}
\RequirePackage{adjustbox}
\RequirePackage{multirow}

%=================================================================================%
%=============================== 数学类宏包 ============================================%
\RequirePackage[fleqn]{amsmath}     % 公式靠左对齐, 这是全局选项. 也可以 \documentclass[fleqn]{article}, 未知ctexbook是否可以.
\RequirePackage{chngcntr}           % 去掉章节与公式编号关联 http://www.latexstudio.net/archives/2111.html
\counterwithout{equation}{chapter}  % 解除关联
%\counterwithin{equation}{chapter}  % 设置新的关联
\RequirePackage{amssymb}            % 数学必备宏包
\RequirePackage{amsthm}					% 定理和证明环境, ntheorem宏包与之有些冲突
\RequirePackage{amsfonts}				% 
\RequirePackage{esvect}             % 好看的向量箭头符号，命令是\vv
\RequirePackage{nicefrac}   			% 在正文文本中排版分式时，可以用它来得到较好的排版效果。
\RequirePackage{siunitx}            % 输出数字等形式一致起来: \ang{角度}, \num{数值}, \si{单位}, \SI, \numlist, \numrange, \SIlist. % 这个宏包还是挺有意思的.
\RequirePackage{pifont}       	  	% 带圈的各种数字符号使用
\RequirePackage{wasysym}				% smiley 会有 Font shape `xxx' in size <yyy> not available 和 Size substitutions with differences up to xxpt have occurred.
\RequirePackage{extarrows} 			% 等号/箭头上下放置内容 % http://blog.sina.com.cn/s/blog_5e16f1770100l6cv.html
\RequirePackage{mathtools}				% \xRightarrow{abc}  	% 与extarrows宏包有近似之处.
\RequirePackage{mathrsfs} 				% 数学花体英文字符.  	% \mathscr{A}
\RequirePackage{relsize}    			% 调整公式字体大小：\mathsmaller, \mathlarger

\RequirePackage{makecell}


% 定义图片路径
\graphicspath{{./bodyxb/src/}}

\RequirePackage{diagbox} % 表头斜线 % https://liam.page/2013/08/04/LaTeX-table/
\RequirePackage{longtable}      % 支持长表格  20210415
\RequirePackage{xifthen}             % todonotes宏包的需要 (ifthen修改为xifthen(对ifthen的增强, 20200301))
\RequirePackage{xkeyval}
\RequirePackage{calc}

% https://liam.page/2013/08/04/LaTeX-table/
\RequirePackage{array}
\newcolumntype{L}[1]{>{\vspace{0.25em}\begin{minipage}{#1}\raggedright\let\newline\\
\arraybackslash\hspace{0pt}}m{#1}<{\end{minipage}\vspace{0.25em}}}
\newcolumntype{R}[1]{>{\vspace{0.25em}\begin{minipage}{#1}\raggedleft\let\newline\\
\arraybackslash\hspace{0pt}}m{#1}<{\end{minipage}\vspace{0.25em}}}
\newcolumntype{C}[1]{>{\vspace{0.25em}\begin{minipage}{#1}\centering\let\newline\\
\arraybackslash\hspace{0pt}}m{#1}<{\end{minipage}\vspace{0.25em}}}


%------------------------- 列表与图表距离设置 -----------------------%
\setlength{\topsep}{3pt plus1pt minus2pt}           % 第一个item和前面版落间的距离
\setlength{\partopsep}{3pt plus1pt minus2pt}        % 当在一个新页开始时加到\topsep的额外空间
\setlength{\itemsep}{3pt plus1pt minus2pt}          % 连续items之间的距离.
\setlength{\floatsep}{10pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{2pt plus1pt minus1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus1pt minus2pt} % 表格中的表与标题之间的距离

% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面，也可以防止在很大空白的浮动页上放置很小的图形。
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 别忘了includegraphics. 
%单图居中，用法 \onetu{图}（插图部分可包括\caption和\label，下同）. 
\newcommand\onetu[1]{%
\begin{figure}[!ht]
\centering
#1
\end{figure}
}
 
%双图横排，可调宽，用法 \twotu{图}{图} 或 \twotu[x]{图}{图}, 其中x为0到1之间的数字，\twotu{图}{图} 等价于 \twotu[0.5]{图}{图}. 默认为0.5.
\newcommand\twotu[3][0.5]{%
\begin{figure}[!ht]
\begin{minipage}[b]{#1\linewidth}
\centering
#2
\end{minipage}%
\begin{minipage}[b]{\linewidth-#1\linewidth}
\centering
#3
\end{minipage}
\end{figure}
}
 
%三图、四图横排，等宽，用法 \threetu{图}{图}{图} \fourtu{图}{图}{图}{图}
\newcommand\threetu[3]{%
\begin{figure}[!ht]
\begin{minipage}[b]{\linewidth/3}
\centering
#1
\end{minipage}%
\begin{minipage}[b]{\linewidth/3}
\centering
#2
\end{minipage}%
\begin{minipage}[b]{\linewidth/3}
\centering
#3
\end{minipage}
\end{figure}
}

\newcommand\fourtu[4]{%
\begin{figure}[!ht]
\begin{minipage}[b]{\linewidth/4}
\centering
#1
\end{minipage}%
\begin{minipage}[b]{\linewidth/4}
\centering
#2
\end{minipage}%
\begin{minipage}[b]{\linewidth/4}
\centering
#3
\end{minipage}%
\begin{minipage}[b]{\linewidth/4}
\centering
#4
\end{minipage}
\end{figure}
}


%======================= 列表格式 ==========================%
\RequirePackage[shortlabels,inline]{enumitem}

\RequirePackage{iitem}

% 列表形式修改
%============定义列表项目格式===============
\makeatletter
\renewcommand{\labelenumi}{\theenumi.}          % \def\labelenumi{\theenumi}
\renewcommand{\theenumi}{\arabic{enumi}}        % 生成1.这样的标号效果, 与下面的区别在于有无括号()和点.号

\renewcommand{\labelenumii}{\theenumii}
\renewcommand{\theenumii}{(\arabic{enumii})}    %生成(1)这样的编号效果, 注意(), 以及上一行theenumii后没有.号

\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
%\setlength{\topsep}{-1em}
\makeatother

% https://tex.stackexchange.com/questions/146306/how-to-make-horizontal-lists
% \NumTabs{5} 意为列表中, 一行放5项列表项. 需要结合enumitem中itemjoin使用. 
\RequirePackage{tabto}

%=============================== 下划线
\RequirePackage{ulem}

%=============================== 这个宏包有选项, 会有预定义若干种颜色. base color, dvipsnames, svgnames, x11names
\RequirePackage{xcolor}

%=============================== 解析过程是否显示
\newtoks\patchtoks    % helper token register
\def\longpatch#1%     % worker macro
  {\let\myoldmac#1%
   \long\def#1##1{\patchtoks={##1}\myoldmac{\the\patchtoks}}}
\longpatch{\phantom}

\NewDocumentEnvironment{jieda}{ +b }{%
  \ifjieda
      \par {\textcolor{blue}{解析}}\quad #1
  \else
      \par %\phantom{\parbox{\textwidth}{#1}} % 输出答案所需的空白 % \par % 
  \fi
  }{\par}
\RequirePackage{xparse}

\NewDocumentEnvironment{example}{ +b }{%
  \par {\textcolor{blue}{例子}}\quad #1
  }{\par}
\RequirePackage{xparse}

\NewDocumentEnvironment{vspace_}{ +b }{%
  \ifvspace
      \par #1
  \else
      \par %\phantom{\parbox{\textwidth}{#1}} % 输出答案所需的空白 % \par % 
  \fi
  }{\par}
\RequirePackage{xparse}

%=============================== 填空题的答案及横线 ============================================%
\newcommand{\blk}[1][1.5]{\underline{\makebox[#1 cm]{}}}

\newcommand{\blkda}[2][1.5]{\uline{\makebox[#1 cm][c]{%
                \ifmyanswer
                \textcolor{blue}{#2}%
                \else
                \phantom{#2}%
                \fi}}}

%=============================== 选择题的答案及括号 ============================================%
\newcommand{\kh}[1]{~~{{%
            \ifmyanswer
            {\makebox[0.2cm][c]{\textcolor{blue}{#1}}}%
            \else
            \phantom{\makebox[0.2cm][c]{#1} }%
            \fi}~~}}

\newif\ifmyanswer
\newcommand{\myanswer}[1]{\ifthenelse{\isodd{#1}}{\myanswertrue}{}}


%=============================== 选择题 ============================================%
% 需要ifthen宏包
% 选项自动排版，用法 \xx{选项}{选项}{选项}{选项}，会自动判断排版方式
\newlength\lxxa
\newlength\lxxb
\newlength\lxxc
\newlength\lxxd
\newlength\lxxmax
\newlength\lhalf
\newlength\lhalfhalf

\newcommand{\xx}[4]{% next 60 行
\settowidth\lxxa{\texttt{(A)} #1}%
\settowidth\lxxb{\texttt{(B)} #2}%
\settowidth\lxxc{\texttt{(C)} #3}%
\settowidth\lxxd{\texttt{(D)} #4}%
    \ifthenelse{
        \lengthtest{\lxxa > \lxxb}
        }
        {\setlength\lxxmax\lxxa}
        {\setlength\lxxmax\lxxb}
    \ifthenelse{
        \lengthtest{\lxxmax < \lxxc}
        }
        {\setlength\lxxmax\lxxc}
        {}
    \ifthenelse{
        \lengthtest{\lxxmax < \lxxd}
        }
        {\setlength\lxxmax\lxxd}
        {}
\addtolength\lxxmax{1.5em}%
\setlength\lhalf{(\linewidth-\parindent)/2}%
\setlength\lhalfhalf{\lhalf/2}%

\ifthenelse{
    \lengthtest{\lxxmax > \lhalf}
    }
    {\texttt{(A)} #1 \par \texttt{(B)} #2 \par \texttt{(C)} #3 \par \texttt{(D)} #4 \par}%
    {
    \ifthenelse{
        \lengthtest{\lxxmax > \lhalfhalf}
        }
        {%
        \begin{minipage}{\lhalf}
        \texttt{(A)} #1
        \end{minipage}%
        \begin{minipage}{\lhalf}
        \texttt{(B)} #2
        \end{minipage}\par
        \begin{minipage}{\lhalf}
        \texttt{(C)} #3
        \end{minipage}%
        \begin{minipage}{\lhalf}
        \texttt{(D)} #4
        \end{minipage} \par%
        }
        {%
        \begin{minipage}{\lhalfhalf}
        \texttt{(A)} #1
        \end{minipage}%
        \begin{minipage}{\lhalfhalf}
        \texttt{(B)} #2
        \end{minipage}%
        \begin{minipage}{\lhalfhalf}
        \texttt{(C)} #3
        \end{minipage}%
        \begin{minipage}{\lhalfhalf}
        \texttt{(D)} #4
        \end{minipage} \par%
        }%
    }%
}%

%=============================== 解答题留白 ============================================%

%=============================== 竖直空白 ============================================%
% \vsp 默认1cm, 如果需要3cm, 则\vsp[3]. 
\newcommand{\vsp}[1][3]{\vspace*{#1 cm}}


%=============================== 关于解答 ============================================%
% 新定义了jieda(解析)与proof(证)环境, 可以互相包含, 甚至无限递归.
\renewcommand{\qedsymbol}{} % 将\qed清空, 如果需要设置为其他的, 那就在{}内写.

% \makeatletter
% \newenvironment{jieda}[1][\jiedaname]{\par
%   \normalfont \topsep0\p@\@plus6\p@\relax       % \topsep0 默认为\topsep6, 大概是space above之意.
%   \trivlist
%   \item[\hskip\labelsep\normalfont
%     #1\@addpunct{}]\ignorespaces                % \@addpunct{} 就是修改头文字后面的标点符号, 比如: , 等等.
% }{\popQED\endtrivlist\vspace*{3pt}\@endpefalse} % \vspace*{3pt} 用于环境结束后增加与下文的距离.
% \providecommand{\jiedaname}{\textcolor[HTML]{5f51b8}{解析}}
% \makeatother

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par    % proofname由ctex宏包中的ctexset中的proofname来控制, 请在本页中搜索proofname.
\pushQED{\qed}%
\normalfont \topsep0\p@\@plus6\p@\relax
\trivlist
\item\relax
{\normalfont
#1\@addpunct{}}\hspace\labelsep\ignorespaces
}{%
\popQED\endtrivlist\@endpefalse
}
\makeatother


\renewcommand{\qedsymbol}{} % 将\qed清空, 如果需要设置为其他的, 那就在{}内写.
\makeatletter
\newenvironment{mydingyi}[1][\mydingyiname]{\par
  \normalfont \topsep0\p@\@plus6\p@\relax       % \topsep0 默认为\topsep6, 大概是space above之意.
  \trivlist
  \item[\hskip\labelsep\normalfont
    #1\@addpunct{}]\ignorespaces                % \@addpunct{} 就是修改头文字后面的标点符号, 比如: , 等等.
}{\popQED\endtrivlist\vspace*{3pt}\@endpefalse} % \vspace*{3pt} 用于环境结束后增加与下文的距离.
\providecommand{\mydingyiname}{\textcolor[HTML]{5f51b8}{定义}}
\makeatother

%=============================== 方便输入的一些设置 ============================================%

%=================带圈的数字======================
% 方法一: 
\RequirePackage{circledsteps} % 基本命令: \Circled[]{}, \CircledTop[inner color=red]{1}, \CircledText[outer color=green]{2}. 

% 方法二: 用pifont宏包, \ding{172}输出①, 依次排下去. 


% =================绝对值$\abs{AB}$
\newcommand{\myvert}[1]{\left|#1\right|}
\let\abs=\myvert
\newcommand{\mydvert}[1]{\left|#1\right|}
\let\tempabs=\mydvert
\newcommand{\myddvert}[1]{\lVert #1 \rVert} % 模的符号, 两条竖线. 
\let\dabs=\myddvert

% =================高斯函数$\gauss{x}$
\newcommand{\myvertgauss}[1]{\left[#1\right]}
\let\gauss=\myvertgauss

% =================向量夹角$\lrangle{\vv{a},\vv{b}}$
\newcommand{\myleftrightangle}[1]{\left<#1\right>}
\let\lrangle=\myleftrightangle

% =================小于等于号\leq, 大于等于号\geq. 
% \let copies a command to a new name, while \def creates a new command.
\let\le\leqslant
\let\leq\leqslant
\let\ge\geqslant
\let\geq\geqslant

% =================真子集的统一化. 包含于\subseteq, 真包含于\subset. 
\let\subsetneqq\subset
\let\supsetneqq\supset

%=====================关于字母=========
% 定义对数常数e, 虚数符号i,j以及微分算子d为直立体.
\newcommand{\md}{\,\mathrm{d}}
\newcommand{\me}{\mathrm{e}}    % 以前的. 
\newcommand{\mi}{\mathrm{i}}    % 以前的. 
\newcommand{\eu}{\mathrm{e}}    % 自然对数的底"e"理解为"e upright"的缩写或"Euler's number"的首字母. (exam-zh-doc.pdf)
\newcommand{\iu}{\mathrm{i}}    % 虚数单位"i"理解为"i upright"或"imaginary unit"的缩写. (exam-zh-doc.pdf)
\newcommand{\mj}{\mathrm{j}}
\newcommand{\mk}{\mathrm{k}}

%\newcommand{\dif}{\mathrm{d}}
\newcommand*{\dif}{\mathop{}\!\mathrm{d}}  % 微分算子d. 


\renewcommand{\mathbf}[1]{\boldsymbol{#1}}  % 重新定义 \mathbold 为矢量黑斜体用Mathtype生成的公式源码直接应用于程序中(导出时请选择 TeX-AMS-LaTeX ）


% 复数的实部与虚部(from latex_notes)  $\Im{z}$
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}

% 自定义排列组合数的输入命令 20231206
\newcommand{\mmp}[2]{\mathrm{P}_{#1}^{#2}} % P_n^m(口语化) 20231206
\newcommand{\mmc}[2]{\mathrm{C}_{#1}^{#2}} % C_n^m(口语化) 20231206
\newcommand{\mpp}{\mathrm{P}} % 概率P 20240206


% 以下自定义只能放在导言区, 并且要在amsmath宏包之后
% arccot sech csch调用amsmath宏包, 然后如下定义: 
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccsc}{arccsc}
\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\csch}{csch}
\DeclareMathOperator{\arcsinh}{arcsinh}
\DeclareMathOperator{\arccosh}{arccosh}
\DeclareMathOperator{\arctanh}{arctanh}
\DeclareMathOperator{\arccoth}{arccoth}
\DeclareMathOperator{\arcsech}{arcsech}
\DeclareMathOperator{\arccsch}{arccsch}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\E}{exp}
\DeclareMathOperator{\Arg}{Arg}
\DeclareMathOperator{\lcm}{lcm} % 最小公倍数. 最大公约数系统已定义: \gcd


% ceil/floor 
% http://tex.stackexchange.com/questions/42271/floor-and-ceiling-functions
% http://tex.stackexchange.com/questions/118173/how-to-write-ceil-and-floor-in-latex
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\newcommand{\ceiling}[1]{\ceil{#1}}


\let\riff\implies                        % 向右推出
\let\liff\impliedby                      % 向左推出
% \newcommand{\riff}{\Longrightarrow}    % 向右推出
% \newcommand{\liff}{\Longleftarrow}     % 向左推出
\RequirePackage{centernot}
\newcommand\niff{\centernot\iff}         % 否定形式
\newcommand\nriff{\centernot\riff}       % 向右推不出
\newcommand\nliff{\centernot\liff}       % 向左推不出



%%% 修改\dotfill, 使得点号为中圆点, 即如\cdots中的点 %%%
%% from http://bbs.ctex.org/forums/index.php?showtopic=4212&mode=linear %%
\makeatletter
\def\dotfill{%
\leavevmode
\cleaders \hb@xt@ .44em{\hss$\cdot$\hss}\hfill
\kern\z@}
\makeatother


%=============================== 关于弧, 全等, 相似, 约等于 ============================================%

% 弧符号, 命令是 \hu  % texdoc yhmath
\DeclareSymbolFont{yh}{OMX}{yhex}{m}{n}
\DeclareMathAccent{\hu}{\mathord}{yh}{"F3}


% 斜的平行符号
% 法一: \usepackage{txfonts} \varparallel
% 法二: 平行\px 与不平行\npx,\npll
\newcommand\px{\mathrel{/\mkern-5mu/}}
\newcommand{\npx}{\mathrel{/\mkern-5mu/}\kern -0.9em\smallsetminus\kern 0.09em}
% 评论区 https://zhuanlan.zhihu.com/p/90881927 
% \newcommand{\pll}{\kern 0.56em/\kern -0.8em /\kern 0.56em}
% \newcommand{\npll}{\kern 0.56em/\kern -0.8em /\kern -0.75em \smallsetminus\kern 0.09em}
\newcommand{\npll}{\mathrel{/\mkern-5mu/}\kern -0.9em\smallsetminus\kern 0.09em}

% 平行四边形可以用\diamondsuit 进行旋转, 也可以用\lozenge 进行旋转. 需要相应的宏包支持(主要是字体). 20240129

% 平行四边形\pxsb % 使用 $\sbx{ABCD}$ % http://liam0205.me/2013/04/13/LaTeX-parallelogram/
% \newcommand\sbx{\mathord{\text{\tikz[baseline] \draw (0,.1ex) -- (.8em,.1ex) -- (1em,1.6ex) -- (.2em,1.6ex) -- cycle;}}} 
\newcommand\pxsb{\mathord{\text{\tikz[baseline] \draw (0,.1ex) -- (.8em,.1ex) -- (1em,1.6ex) -- (.2em,1.6ex) -- cycle;}}}

% 平行且等于
% 法一: \usepackage{fdsymbol} 中的 \upVDash
% 法二: 画平行且等于 % http://kuing.is-programmer.com/posts/205617.html
\newcommand\pqd{\mathrel{\text{%
\begin{tikzpicture}[baseline,line width=0.1ex,line cap=round]
\draw (0,0) -- (.7em,0)
(0,.3ex) -- (.7em,.3ex)
(.2em,.55ex) -- (.4em,1.8ex)
(.35em,.55ex) -- (.55em,1.8ex);
\end{tikzpicture}}}}

% 全等: 20230905, 直接用\cong. 合同. 
\newcommand\qd{\scalebox{-1}[1]{$\cong$}}

% https://www.zhihu.com/collection/107098339
% \usetikzlibrary{shapes.geometric}
\newcommand{\Stars}[2][fill=red,draw=orange]{\footnotesize{\begin{tikzpicture}[baseline=-0.35em,#1]
\foreach \X in {1,...,5}
{\pgfmathsetmacro{\xfill}{min(1,max(1+#2-\X,0))}
\path (\X*1.1em,0) 
node[star,draw,star point height=0.25em,minimum size=1em,inner sep=0pt,
path picture={\fill (path picture bounding box.south west) 
rectangle  ([xshift=\xfill*1em]path picture bounding box.north west);}]{};
}
\end{tikzpicture}}}


% 原来的mod命令导致前面的括号离内容太远. 
% 整除, 同余, 模. 
% https://tex.stackexchange.com/questions/137073/writing-mod-in-congruence-problems-without-leading-space
\newcommand{\Mod}[1]{\left(\mathrm{mod}\ #1\right)}
% 那么现在用 $a\equiv b\Mod c$ 亦可$a\equiv b\pmod c$  
% 小括号()的英语: parentheses, 如pmatrix, vmatrix(其中v表示vertical(竖线)), bmatrix(方括号square brackets)


% 关于\ensuremath % https://www.jianshu.com/p/2145e75ed646
% https://pastebin.com/pQu32L3L
% 文本模式与数学模式下使用\bA, 皆可得到\mathbb{A}. 

\RequirePackage{xspace}

\newcommand{\mmm}[1]{\ensuremath{#1}\xspace}
\newcommand{\bA}{\mmm{\mathbb{A}}}
\newcommand{\bB}{\mmm{\mathbb{B}}}
\newcommand{\bC}{\mmm{\mathbb{C}}}
\newcommand{\bD}{\mmm{\mathbb{D}}}
\newcommand{\bE}{\mmm{\mathbb{E}}}
\newcommand{\bF}{\mmm{\mathbb{F}}}
\newcommand{\bG}{\mmm{\mathbb{G}}}
\newcommand{\bH}{\mmm{\mathbb{H}}}
\newcommand{\bI}{\mmm{\mathbb{I}}}
\newcommand{\bJ}{\mmm{\mathbb{J}}}
\newcommand{\bK}{\mmm{\mathbb{K}}}
\newcommand{\bL}{\mmm{\mathbb{L}}}
\newcommand{\bM}{\mmm{\mathbb{M}}}
\newcommand{\bN}{\mmm{\mathbb{N}}}
\newcommand{\bO}{\mmm{\mathbb{O}}}
\newcommand{\bP}{\mmm{\mathbb{P}}}
\newcommand{\bQ}{\mmm{\mathbb{Q}}}
\newcommand{\bR}{\mmm{\mathbb{R}}}
\newcommand{\bS}{\mmm{\mathbb{S}}}
\newcommand{\bT}{\mmm{\mathbb{T}}}
\newcommand{\bU}{\mmm{\mathbb{U}}}
\newcommand{\bV}{\mmm{\mathbb{V}}}
\newcommand{\bW}{\mmm{\mathbb{W}}}
\newcommand{\bX}{\mmm{\mathbb{X}}}
\newcommand{\bY}{\mmm{\mathbb{Y}}}
\newcommand{\bZ}{\mmm{\mathbb{Z}}}

% $\in\mathbb{N^*}$. 
\newcommand{\zn}{\mmm{\in\mathbb{N^*}}}
\newcommand{\zz}{\mmm{\in\mathbb{Z}}}
\newcommand{\zq}{\mmm{\in\mathbb{Q}}}
\newcommand{\zr}{\mmm{\in\mathbb{R}}}
\newcommand{\zc}{\mmm{\in\mathbb{C}}}

\newcommand{\mA}{\mmm{\mathrm{A}}}
\newcommand{\mB}{\mmm{\mathrm{B}}}
\newcommand{\mC}{\mmm{\mathrm{C}}}
\newcommand{\mD}{\mmm{\mathrm{D}}}
\newcommand{\mE}{\mmm{\mathrm{E}}}
\newcommand{\mF}{\mmm{\mathrm{F}}}
\newcommand{\mG}{\mmm{\mathrm{G}}}
\newcommand{\mH}{\mmm{\mathrm{H}}}
\newcommand{\mI}{\mmm{\mathrm{I}}}
\newcommand{\mJ}{\mmm{\mathrm{J}}}
\newcommand{\mK}{\mmm{\mathrm{K}}}
\newcommand{\mL}{\mmm{\mathrm{L}}}
\newcommand{\mM}{\mmm{\mathrm{M}}}
\newcommand{\mN}{\mmm{\mathrm{N}}}
\newcommand{\mO}{\mmm{\mathrm{O}}}
\newcommand{\mP}{\mmm{\mathrm{P}}}
\newcommand{\mQ}{\mmm{\mathrm{Q}}}
\newcommand{\mR}{\mmm{\mathrm{R}}}
\newcommand{\mS}{\mmm{\mathrm{S}}}
\newcommand{\mT}{\mmm{\mathrm{T}}}
\newcommand{\mU}{\mmm{\mathrm{U}}}
\newcommand{\mV}{\mmm{\mathrm{V}}}
\newcommand{\mW}{\mmm{\mathrm{W}}}
\newcommand{\mX}{\mmm{\mathrm{X}}}
\newcommand{\mY}{\mmm{\mathrm{Y}}}
\newcommand{\mZ}{\mmm{\mathrm{Z}}}



% 懒人设置. 
\newcommand{\zsd}{{\textbf{知识点: }}}
\newcommand{\ps}{\textcolor[HTML]{000040}{注: }}
\newcommand{\da}{\textcolor[HTML]{000040}{答案: }}

\newcommand\holder{H\"older}
\newcommand\schur{Sch\"ur}
\newcommand\Holder{H\"older}
\newcommand\Schur{Sch\"ur}
\newcommand\LHS{\texttt{LHS}}
\newcommand\RHS{\texttt{RHS}}


% \mydate{20170728}: 录于20170728
%\newcommand{\mydate}[1]{(录于\,#1)}
\RequirePackage{xstring}         % 操作字符串 
\newcommand{\mydate}[1]{(录于\StrMid{#1}{1}{4}/\StrMid{#1}{5}{6}/\StrMid{#1}{7}{8})}
\newcommand{\mdate}[1]{(录于\zhdate{#1})}


%===================其他宏包
\RequirePackage{verbatim}   		% 注释大段文字的宏包comment
\RequirePackage{lipsum}          % \lipsum[n] 默认7个段落
\RequirePackage{multicol}
\RequirePackage{footnpag}        % 脚注按页排序列表, 而不是按照chapter(book/report类中).



%=====================交叉引用
\RequirePackage{hyperref}

% pagebackref=true, % 这个选项会报警, 未知原因.
\hypersetup{
 colorlinks,
 %hyperindex,
 linkcolor          =blue,                      % internet链接
 anchorcolor        =red,                       % 文内链接(锚点)
 citecolor          =green,                     % 参考文献引用的颜色(bibliography)
 urlcolor           =blue,                      % Color for linked URLs, 缺省 magenta 
 plainpages         =false,
 breaklinks,        % 以下来自于elegant book
% unicode,                
 bookmarksnumbered  =false,
 bookmarksopen      =true, 
 pdfsubject         =\@author \@title Book,
 pdfkeywords        ={math},
 pdfcreator         ={ZH},  % 若为汉字则报警, 说是unicode的东西.
 pdfstartview       =FitH,
 pdfborder={0 0 0},
 linktocpage
 }



% \pagenumbering{Roman} % Roman字体书写页码. 此处为了实现目录的页码用Roman字体. 注意\pagenumbering\tableofcontents\mainmatter 这3个命令的先后关系.

\RequirePackage{lmodern}    			% http://ctan.org/pkg/lm
\RequirePackage{anyfontsize}			% 去掉字体大小警告的宏包(与lmodern一起使用). 得在pxfonts之后. 但我并没有去了解这个宏包.  % Font shape xx in size <m> not available size <n> substituted
									% http://tex.stackexchange.com/questions/58087/how-to-remove-the-warnings-font-shape-ot1-cmss-m-n-in-size-4-not-available



\RequirePackage{silence} 		% 参考宏包选项
\WarningFilter{array}{Command \@xhline has changed}
\WarningFilter{array}{xhline has changed.}
\WarningFilter{enumerate}{The counter will not be printed}
\WarningFilter{hyperref}{Size substitutions}
\WarningFilter{latex}{Token not allowed}
\WarningFilter{latex}{Marginpar on page}
\WarningFilter{latex}{The counter will not be printed}
\WarningFilter{latex}{Font shape}
\WarningFilter{mdframed}{Overfull \vbox}
\WarningFilter{stmaryrd}{Font shape}
%\WarningFilter{footnpag}{Ignoring empty anchor}


%忽略掉Underfull \hbox (badness 10000) in paragraph at lines 998--998之类的错误. Overfull是太宽；underfull是宽度不够。
%hbadness报警，就设置\hbadness大点，10000为无穷大.
%若是显示字体什么的为98.5pt，就设置\hfuzz大小即可，latex不再报警.
\hfuzz=\maxdimen
\tolerance=10000
\hbadness=10000


\newcommand*\zhparallel{%               %中文平行 parallel
	\mathrel{\text{\tikz[baseline,line cap=round] \draw (0em,-0.3ex) -- (.4em,1.7ex) (.2em,-0.3ex) -- (.6em,1.7ex);}%
}}


\newcommand*\zhsubsetneqq{%               %中文真子集 proper subset
	\mathrel{\text{\tikz[baseline,line cap=round]
		\draw (.6636em,1.57ex) -- (.192em,1.57ex) arc (90:270:0.4022ex) -- (.6636em,.7674ex) (0,.2558ex) -- (.6636em,.2558ex) (0,.5116ex) -- (.6636em,.5116ex) (.2323em,0ex) -- (.4313em,.7674ex);%
}}%
}

\newcommand*\zhsubset{%                    %%中文子集 subset
	\mathrel{\text{\tikz[baseline,line cap=round]
		\draw (.6636em,1.57ex) -- (.20235em,1.57ex) arc (90:270:0.4797ex) -- (.6636em,.61ex) (0,.305ex) -- (.6636em,.305ex);%
}}%
}

\newcommand*\zhsupsetneqq{%               %中文反向真子集 proper supset
	\mathrel{\text{\tikz[baseline,line cap=round]
		\draw (-.6636em,1.57ex) -- (-.192em,1.57ex) arc (90:-90:0.4022ex) -- (-.6636em,.7674ex) (0,.2558ex) -- (-.6636em,.2558ex) (0,.5116ex) -- (-.6636em,.5116ex) (-.4313em,0ex) -- (-.2323em,.7674ex);%
	}}%
}

\newcommand*\zhsupset{%                    %%中文反向子集 supset
	\mathrel{\text{\tikz[baseline,line cap=round]
		\draw (-.6636em,1.57ex) -- (-.20235em,1.57ex) arc (90:-90:0.4797ex) -- (-.6636em,.61ex) (-.6636em,.305ex) -- (0,.305ex);%
}}%
}


%\newcommand*\paraleq{%               %平行且等于parallel and equation
%	\mathrel{\hspace{.03555em}\text{\tikz[baseline,line cap=round]
%			\draw (.1em,0ex) -- (.9em,0ex)
%			(.1em,.25ex) -- (.9em,.25ex)
%			(.375em,.3ex) -- (.675em,1.75ex)
%			(.525em,.3ex) -- (.825em,1.75ex);}\hspace{.03555em}%
%}}

\newcommand*\paraleq{%               %稍微调宽之后的 平行且等于parallel and equation 看起来不太好看
	\mathrel{\hspace{.03555em}\text{\tikz[baseline,line cap=round]
			\draw (.1em,0ex) -- (.9em,0ex)
			(.1em,.3ex) -- (.9em,.3ex)
			(.375em,.4ex) -- (.675em,1.8ex)
			(.55em,.4ex) -- (.85em,1.8ex);}\hspace{.03555em}}%
}

\newcommand*\param{%            %平行四边形parallelogram  param
  \mathord{\text{%
    \tikz[baseline,line join=round]
      \draw (0,.1ex) -- (.8em,.1ex) -- (1em,1.4ex) -- (.2em,1.4ex) -- cycle;}}}

\newcommand*\zhsim{%                                       %相似 similar
	\mathrel{\text{%
			\tikz[baseline,line cap=round] \draw (-.25em,1.15ex) .. controls (-.55em,1.15ex) and (-.51em,.23ex) .. (-.275em,.23ex) .. controls (0,.23ex) and (0,1.15ex) .. (.275em,1.15ex) .. controls (.51em,1.15ex) and (.55em,.23ex) .. (.25em,.23ex);%
}}}

\newcommand*\zhcong{%                                       %全等 congruent
	\mathrel{\text{%\small%
			\tikz \draw[baseline,line cap=round] (-.2em,1.35ex) .. controls (-.46em,1.6ex) and (-.54em,.65ex) .. (-.25em,.65ex) .. controls (-.06em,.65ex) and (.06em,1.35ex) .. (.25em,1.35ex) .. controls (.54em,1.35ex) and (.46em,.4ex) .. (.2em,.65ex) (-.46em,.4ex) -- (.46em,.4ex) (-.46em,0ex) -- (.46em,0ex);%
}}}
