\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nckuthesis}[2023/02/01 Thesis template for National Cheng Kung University]

% Derived from book class
\DeclareRobustCommand{\@typeen}{Master}
\DeclareRobustCommand{\@typezh}{碩士}
\DeclareRobustCommand{\@classen}{Thesis}
\DeclareRobustCommand{\@classzh}{論文}
\DeclareOption{phd}{\gdef\@typeen{Doctoral}\gdef\@typezh{博士}\gdef\@classen{Dissertation}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal}\gdef\@typezh{計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}
\DeclareRobustCommand{\@setspacing}{\doublespacing}
\DeclareOption{singlespacing}{\gdef\@setspacing{\singlespacing}}
\DeclareOption{onehalfspacing}{\gdef\@setspacing{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{book}

% Required packages
\RequirePackage[top=2.3cm,left=2cm,bottom=3cm,right=2cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage[contents={}]{background}
\RequirePackage{pdfpages}

% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\studentid}[1]{\gdef\@studentid{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\defenseday}[1]{\gdef\@day{#1}}
\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\acknowledgements}[2]{\gdef\@acknowledgementsen{#1}\gdef\@acknowledgementszh{#2}}
\DeclareRobustCommand{\doi}[1]{\gdef\@doi{#1}}
\DeclareRobustCommand{\keywords}[2]{\gdef\@keywordsen{#1}\gdef\@keywordszh{#2}}

\DeclareRobustCommand{\makecover}{
    \begin{titlepage}
        \vspace{2.3cm}
        \begin{singlespace}
        \begin{center}
            \fontsize{24}{35}\selectfont
            \@universityzh\par
            \@institutezh\par
            \@typezh{}\@classzh\par
            \vspace{2cm}
            {\fontsize{24}{35}\selectfont
            \@titlezh\par
            \@titleen\par}
            \vspace{\fill}
            \begin{table}[H]
                \centering
                \fontsize{18pt}{27pt}\selectfont% 設定字型大小(2)
                \begin{tabular}{llccll}
                    研\,究\,生\,\hspace{18pt}： & \@authorzh     & &  & Student: & \@authoren\\
                    指\,導\,教\,授：& \@advisorzh & &  & Advisor: & \@advisoren
                \end{tabular}
            \end{table}
            \vspace{1.5cm}
            {\fontsize{20}{30}\selectfont
                \@instituteen\par
                \@universityen\par
                Tainan, Taiwan, R. O. C.\par
                \@typeen{} \@classen\par
                \vspace{1cm}
                中華民國 \@yearzh 年 \@monthzh 月\\
                \@monthen, \@yearen}
        \end{center}
        \end{singlespace}
        \vspace{1cm}
    \end{titlepage}
}

\newenvironment{quotationpage}[1]
{\if@openright\cleardoublepage\else\clearpage\fi
\chapter*{\centerline{#1}}
\addcontentsline{toc}{chapter}{#1}
\quotation}
{\endquotation}

\newenvironment{abstracten}{\begin{quotationpage}{\@abstractnameen}}{\end{quotationpage}}
\newenvironment{abstractzh}{\begin{quotationpage}{\@abstractnamezh}}{\end{quotationpage}}
\newenvironment{acknowledgementsen}{\begin{quotationpage}{\@acknowledgementsen}}{\end{quotationpage}}
\newenvironment{acknowledgementszh}{\begin{quotationpage}{\@acknowledgementszh}}{\end{quotationpage}}

\setcounter{tocdepth}{2}
\pagestyle{plain}
\@setspacing

\makeatletter
    \def\@makechapterhead#1{%
    \vspace*{50\p@}%
    {\parindent \z@ \raggedright \normalfont
        %\ifnum \c@secnumdepth >\m@ne
        %    \huge\bfseries \@chapapp\space \thechapter
        %    \par\nobreak
        %    \vskip 20\p@
        %\fi
        \interlinepenalty\@M
        \Huge \bfseries #1\par\nobreak
        \vskip 40\p@
    }}
\makeatother


