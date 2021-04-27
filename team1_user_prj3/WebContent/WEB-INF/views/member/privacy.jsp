<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입-이용약관"
    %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 처리방침</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/servlet_prj/common/css/main.css"/>
<style type="text/css">
	#books{ height: 1100px; margin:0px auto; }
	/* 헤더 시작 */
	#header{ height: 150px; position:relative; background: #FFFFFF;}
	#hLogo{width:900px;height: 80px; margin:10px auto; margin-top:20px; text-align: center;}
	#logo{font-size: 30px; font-weight: bold; color: #F58E69; margin: 10px}
	/* 헤더 끝 */
	
	/* aside시작 */
	/* aside끝 */
	 
	/* container 시작 */
	#container{ width: 1300px; min-height: 1800px; margin:0px auto;}
	
	#title{font-size:25px; font-weight: bold; font-family: san-serif; padding-bottom: 30px; padding-top: 30px;text-align: center}
	#term{font-size:20px;font-weight: bold; font-family: san-serif;}
	#terms{font-weight: bold; font-family: san-serif;}
	p,ul,li{width: 770px;}
	/* container 끝 */
	
	/* footer 시작 */
	/* footer 끝 */
	
	#hTitle{font-faimly:'고딕'; font-size:30px; font-weight: bold;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){

});
</script>
</head>	
<body>
<div id="books">
<!-- header 시작  -->		
<div id="header">
	<hr color="#F58E69"/>
	<div id="hLogo">
	<nav>
 		<a class="navbar-brand" href="#">
   		<img src="images/header_logo.png"  class="d-inline-block align-top" alt=""><span id="logo">JINI BOOKS</span>
		</a>
	</nav>
	</div>
	<hr color="#F58E69"/>
</div>
<!-- header 끝  -->

<!-- haside 시작  -->	
<!-- haside 끝  -->	

<!-- container 시작  -->	
<div id="container">
	<div id="title">개인정보 처리방침</div>
	<div style="width: 770px; margin: 0px auto; margin-bottom: 30px">
	지니 주식회사(이하 "회사”라 함)는 고객님들의 개인정보를 소중히 다루고 있습니다. 회사는 ‘정보통신망이용촉진 및 정보 보호 등에 관한 법률’ 등 모든 관련 법규를 준수하며 회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다. 개인정보 보호정책을 통해 이용자가 제공한 개인정보가 어떠한 용도와 방식으로 이용되며, 개인정보 보호를 위해 어떠한 방법을 통해 관리되고 있는지에 대해 알려드립니다.
	</div>
	<hr color="#868686"/>
	<div class="row">
  <!-- 
  <div class="col-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-one-list" data-toggle="list" href="#list-one" role="tab" aria-controls="one">1. 수집하는 개인정보 항목 및 수집방법</a>
      <a class="list-group-item list-group-item-action" id="list-two-list" data-toggle="list" href="#list-two" role="tab" aria-controls="two">2. 개인정보 이용목적</a>
      <a class="list-group-item list-group-item-action" id="list-three-list" data-toggle="list" href="#list-three" role="tab" aria-controls="three">3. 개인정보 수집에 대한 동의</a>
      <a class="list-group-item list-group-item-action" id="list-four-list" data-toggle="list" href="#list-four" role="tab" aria-controls="four">4. 개인정보의 공유 및 제공</a>
      <a class="list-group-item list-group-item-action" id="list-five-list" data-toggle="list" href="#list-five" role="tab" aria-controls="five">5. 개인정보의 사용 및 제3자에 대한 제공</a>
      <a class="list-group-item list-group-item-action" id="list-six-list" data-toggle="list" href="#list-six" role="tab" aria-controls="six">6. 개인정보의 처리 위탁</a>
      <a class="list-group-item list-group-item-action" id="list-seven-list" data-toggle="list" href="#list-seven" role="tab" aria-controls="seven">7. 개인정보 국외 이전</a>
      <a class="list-group-item list-group-item-action" id="list-eight-list" data-toggle="list" href="#list-eight" role="tab" aria-controls="eight">8. 개인정보의 보유기간 및 회원탈퇴</a>
      <a class="list-group-item list-group-item-action" id="list-nine-list" data-toggle="list" href="#list-nine" role="tab" aria-controls="nine">9. 개인정보 파기절차 및 방법</a>
      <a class="list-group-item list-group-item-action" id="list-ten-list" data-toggle="list" href="#list-ten" role="tab" aria-controls="ten">10. 쿠키에 대한 운용 및 선택권</a>
      <a class="list-group-item list-group-item-action" id="list-eleven-list" data-toggle="list" href="#list-eleven" role="tab" aria-controls="eleve">11. 이용자의 권리와 의무</a>
      <a class="list-group-item list-group-item-action" id="list-twelve-list" data-toggle="list" href="#list-twelve" role="tab" aria-controls="twelve">12. 개인정보의 기술적/관리적 보호 대책</a>
      <a class="list-group-item list-group-item-action" id="list-thirteen-list" data-toggle="list" href="#list-thirteen" role="tab" aria-controls="thirteen">13. 개인정보 보호책임자 및 담당자</a>
      <a class="list-group-item list-group-item-action" id="list-fourteen-list" data-toggle="list" href="#list-fourteen" role="tab" aria-controls="fourteen">14. 고지의 의무</a>
    </div>
  </div>
  -->
  <div style="width: 770px; margin: 0px auto; margin-top: 30px;">
  
      <span id="term">1. 수집하는 개인정보 항목 및 수집방법</span>
      <br/>
      <br/>
      <span id="terms">가. 수집하는 개인정보 항목</span>
      <p>
             첫째, 회사는 회원가입 및 로그인, 원활한 고객상담, 각종 최적화된 서비스를 제공하기 위하여, 다음과 같은 최소한의 개인정보를 이용자의 회원가입 시 수집하고 있습니다.
      </p>
      <ul>
        <li>일반/외국인/14세미만 어린이 회원가입 시
          <ul>
            <li>필수 입력 사항: 이름, 아이디, 비밀번호, 이메일주소, 법정대리인의 본인인증값</li>
            <li>선택 입력 사항: 생년, 성별</li>
          </ul>
        </li>
        <li>
                 소셜 네트워크 계정으로 회원가입 시 : 이름, 이메일주소, 생년, 성별
        </li>
      </ul>
      <p>
             둘째, 모바일 서비스 이용시 단말기에 관한 정보(단말기 모델, 하드웨어 ID, 운영체제 버전정보)와 서비스 이용 기본 통계(동기화, 독서노트 기능 제공을 위한 서점 및 애플리케이션 이용 정보, 서점 내 회원 대상 또는 개인화된 맞춤 추천 기능을 위한 서점 및 애플리케이션 이용 정보)이 수집될 수 있으나, 이는 개인을 식별할 수 없는 형태입니다. 만약 서비스 이용 도중 추가적으로 개인정보 수집이 필요한 경우, 회사는 회원에게 미리 이러한 사실을 고지하고 동의를 받습니다.
      </p>
      <p>
             셋째, 회사는 이용자의 페이퍼샵 주문 혹은 AS시 재화의 배송 및 원활한 고객상담을 위하여 다음과 같은 기본 정보를 수집하고 있습니다.
      </p>
      <ul>
        <li>이름, 주소, 유선전화번호, 휴대전화번호, 이메일주소</li>
      </ul>
      <p>넷째, 회사는 이용자의 선물하기 기능 이용시 선물 전송을 위하여 필요한 선물 수령인의 기본 정보를 수집하고 있습니다.</p>
      <ul>
        <li>선물 수령인의 이름, 휴대전화번호, 이메일 주소</li>
      </ul>
      <p>다섯째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
      <ul>
        <li>IP 주소, 쿠키, 방문 일시, OS종류, 브라우저 종류, 결제기록, 서비스 이용 기록, 불량이용 기록</li>
      </ul>
        <p>여섯째, 유료 서비스 이용 과정에서 아래와 같은 정보가 개인정보 수탁자(결제대행사)에 의해 수집될 수 있으나, 회사는 결제 정보를 보관하지 않습니다.</p>
      <ul>
        <li>신용카드 결제시 : 카드사명, 카드번호 등</li>
        <li>휴대전화 결제시 : 휴대폰번호, 통신사, 결제승인번호 등</li>
        <li>계좌이체시 : 은행명, 계좌번호 등</li><li>상품권 이용시 : 상품권 번호</li>
      </ul>
      <span id="terms">나. 개인정보 수집방법</span>
      <p>회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
      <ul>
        <li>홈페이지, 모바일 애플리케이션, 서면 양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모</li>
      </ul>
      <br/>
      <br/>
      <span id="term">2. 개인정보 이용목적</span>
      <br/>
      <br/>
      <span id="terms">가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</span>
      <p>
             제화 및 컨텐츠의 제공, 맞춤 서비스 제공, 청구서 및 구매내역 발송, 컨텐츠 선물하기, 기기 간 동기화 서비스 제공, 본인인증, 구매 및 요금 결제, 요금추심 등
      </p>
      <span id="terms">나. 회원관리</span>
      <p>
             본인확인, 불량회원(지니북스 이용약관 제16조 위반 사유로 인하여 영구이용이 정지된 회원)의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 분쟁 조정을 위한 기록 보존, 민원처리, 공지사항 전달
      </p>
      <span id="terms">다. 신규 서비스 개발 및 마케팅에의 활용</span>
      <p>
             신규 서비스 개발, 통계학적 특성, 이용 형태 등에 따른 맞춤형 서비스 제공, 광고 게재, 이벤트 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계
      </p>
      <br/>
      <br/>
      <span id="term">3. 개인정보 수집에 대한 동의</span>
      <p>첫째, 회사는 고객님께서 개인정보 보호정책 또는 이용약관의 내용에 대해 ‘동의함’ 버튼을 통해 동의 여부를 선택할 수 있는 절차를 마련하여, ‘동의함’ 버튼을 선택할 경우 입력하신 개인정보가 당사의 고객DB에 저장되어 상기 명시된 이용목적에 적합하게 이용되는 것으로 간주합니다.</p>
      <p>둘째, 제휴사 등 제3자를 통해 개인정보 수집에 대한 동의를 받을 경우에도, 고객님께서 개인정보 보호정책 또는 이용약관의 내용에 대해 ‘동의함’ 버튼을 통해 동의 여부를 선택할 수 있는 절차를 마련하여, ‘동의함’ 버튼을 선택할 경우 동의하신 것과 동일하게 간주합니다.</p>
      <br/>
      <br/>
      <span id="term">4. 개인정보의 공유 및 제공</span>
      <p>회사는 고객님의 개인정보를 상기 "2. 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업, 타기관에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
      <ul>
        <li>고객님이 사전에 공개에 동의한 경우</li>
        <li>법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</li>
        <li>서비스제공에 따른 요금정산을 위하여 필요한 경우</li>
        <li>통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정개인을 식별할 수 없는 형태로 제공하는 경우</li>
      </ul>
      <br/>
      <br/>
      <span id="term">5. 개인정보의 사용 및 제3자에 대한 제공</span>
      <p>지니북스는 상품 및 이벤트 경품 배송을 위해 성명, 주소, 연락처의 정보를 필요한 업무 내에서 아래 수탁자에게 제공하고 있으며, 제휴사가 안전하게 개인정보를 처리할 수 있도록 규정하고 관리하고 있습니다. 또한, 목적달성 이후에는 지체없이 정보를 파기합니다.</p>
      <ul>
        <li>제공받는 자: 제휴 출판사</li>
        <li>제공목적: 이벤트 경품 배송</li>
        <li>제공항목: 이름, 전화번호, 주소</li>
        <li>보유 및 이용기간: 목적달성 이후 즉시 파기</li>
      </ul>
      <br/>
      <br/>
      <span id="term">6. 개인정보의 처리 위탁</span>
      <p>지니북스는 원활하고 편리한 서비스를 위하여, 최소한의 제한된 범위에서 개인정보를 외부 전문업체에 위탁하여 운영하고 있습니다. 위탁 계약시 개인정보가 안전하게 관리될 수 있도록 관련 사항들을 별도로 규정하고 있습니다.</p>
      <span id="terms">가. 국내업체</span>
      <p>&lt;결제&gt;</p>
      <ul>
        <li>
        <p>수탁업체</p>
        <ul>
        <li>㈜LG유플러스</li>
        <li>㈜이니시스</li>
        <li>㈜페이게이트</li>
        <li>㈜LG CNS</li>
        <li>네이버 주식회사</li>
        <li>㈜카카오페이</li>
        <li>㈜NHN한국사이버결제</li>
        <li>㈜페이레터</li>
        </ul>
        </li>
        <li>
        <p>위탁업무: 결제, 구매 안전 서비스 제공</p>
        </li>
        <li>보유 및 이용기간: 회원 탈퇴 및 위탁 계약 만료 시까지</li>
        </ul>
        <p>&lt;배송&gt;</p>
        <ul>
        <li>
        <p>수탁업체</p>
        <ul>
        <li>㈜굿스코아</li>
        <li>우체국</li>
        <li>DHL</li>
        <li>㈜굿스포스트</li>
        <li>CJ 대한통운</li>
        </ul>
        </li>
        <li>
        <p>위탁업무: 상품 배송</p>
        </li>
        <li>보유 및 이용기간: 목적 달성 시 즉시파기</li>
        </ul>
        <p>&lt;인증&gt;</p>
        <ul>
        <li>수탁업체: NICE신용평가정보</li>
        <li>위탁업무: 본인인증</li>
        <li>보유 및 이용기간: 목적 달성시 즉시 파기</li>
        </ul>
        <p>&lt;문자발송&gt;</p>
        <ul>
        <li>수탁업체: kth</li>
        <li>위탁업무: SMS 문자 메시지 발송</li>
        <li>보유 및 이용기간: 목적 달성 시 즉시 파기</li>
        </ul>
        <span id="terms">나. 국외업체</span>
        <ul>
        <li>수탁업체: Zendesk</li>
        <li>이전되는 국가: 미국</li>
        <li>위탁업무: 고객 문의 및 안내 관리</li>
        <li>보유 및 이용기간: 소비자의 불만 또는 분쟁처리에 관한 기록 보유 방침을 따름</li>
        </ul>
        <br/>
        <br/>
        <span id="term">7. 개인정보 국외 이전</span>
        <p>회사는 서비스 제공을 위해 아래와 같이 개인정보를 국외로 이전하고 있습니다.</p>
        <ul>
        <li>이전되는 개인정보 항목 : 아이디, 연락처, 이름</li>
        <li>개인정보가 이전되는 국가 : 미국</li>
        <li>이전 일시 및 이전방법: 문의 등록 시에 네트워크를 통한 전송</li>
        <li>개인정보를 이전 받는 자의 성명 : Zendesk</li>
        <li>개인정보를 이전 받는 자의 개인정보 이용목적 : 문의 및 안내 관리</li>
        <li>개인정보를 이전 받는 자의 개인정보 보유 이용 기간 : 회원 탈퇴 시까지</li>
        </ul>
        <br/>
        <br/>
        <span id="term">8. 개인정보의 보유기간 및 회원탈퇴</span>
        <br/>
        <br/>
        <span id="terms">가. 개인 정보의 보유 및 이용 기간</span>
        <p>회원 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 관련 법령에 의거하여 명시한 기간 동안 별도로 분리 보관되며, 명시한 기간이 경과한 개인정보는 지체없이 파기합니다.</p>
        <ul>
        <li>
        <p>계약 또는 청약철회 등에 관한 기록</p>
        <ul>
        <li>보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
        <li>보존 기간 : 5년</li>
        </ul>
        </li>
        <li>
        <p>대금결제 및 재화 등의 공급에 관한 기록</p>
        <ul>
        <li>보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
        <li>보존 기간 : 5년</li>
        </ul>
        </li>
        <li>
        <p>소비자의 불만 또는 분쟁처리에 관한 기록</p>
        <ul>
        <li>보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
        <li>보존 기간 : 3년</li>
        </ul>
        </li>
        <li>
        <p>웹사이트 방문기록</p>
        <ul>
        <li>보존 근거 : 통신비밀보호법</li>
        <li>보존 기간 : 3개월</li>
        </ul>
        </li>
        </ul>
        <span id="terms">나. 회원 탈퇴와 재가입 제한</span>
        <p>탈퇴 완료된 계정의 아이디는 영구적으로 재사용이 불가능하며, 이메일 주소는 30일이 경과한 이후부터 재사용할 수 있습니다. 재가입을 제한하기 위한 아이디 및 이메일 중복여부 검사는 단방향 암호화되어 복원 불가능한 고유값을 대조하는 방식이 사용됩니다.</p>
        <span id="terms">다. 권리</span>
        <p>원칙적으로 개인정보 보호법에 의해 개인정보 수집 동의를 거부할 권리가 있으며, 수집 동의 거부 시에는 회원가입이 불가합니다.</p>
        <br/>
        <br/>
        <span id="term">9. 개인정보 파기절차 및 방법</span>
        <p>개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 회사의 개인정보 파기절차 및 방법은 다음과 같습니다.</p>
        <span id="terms">가. 파기절차</span>
        <ul>
        <li>고객님이 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보 보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.</li>
        <li>동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.</li>
        </ul>
        <span id="terms">나. 파기방법</span>
        <ul>
        <li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
        <li>전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
        </ul>
        <span id="terms">다. 휴면계정의 개인정보 파기절차</span>
        <ul>
        <li>지니북스는 "정보통신망 이용촉진 및 정보보호 등에 관한 법률 제29조 및 동법 시행령 제16조"에 따라 지니북스 서비스에 1년 이상 로그인하지 않은 계정은 개인정보보호를 위하여 해당 회원의 개인정보를 휴면계정으로 전환 및 별도 관리합니다.</li>
        <li>휴면 처리되는 회원정보 : 회원 가입 시 또는 회원 정보 수정으로 수집/관리되는 모든 정보</li>
        <li>지니북스는 휴면 계정의 개인정보 분리·저장 기간이 도래하기 1개월 전에 이메일 등을 통해 해당 이용자에게 관련 내용을 공지합니다.</li>
        <li>휴면 처리된 계정의 개인정보는 분리 보관 시작으로부터 3년이 경과하면 지체없이 파기합니다.</li>
        </ul>
        <br/>
        <br/>
        <span id="term">10. 쿠키에 대한 운용 및 선택권</span>
        <br/>
        <br/>
        <span id="terms">가. 쿠키의 운용 및 사용목적</span>
        <p>회사는 일반적인 웹사이트와 마찬가지로 쿠키를 운용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터 인터넷 브라우저로 전송하는 소량의 정보이며, 컴퓨터 디스크에 저장됩니다. 쿠키는 고객님이 아닌 고객님의 컴퓨터만을 식별하며, 로그인 유지, 아이디 저장, 이용 형태 분석 등 이용자에게 최적화된 서비스를 제공하기 위하여 사용됩니다.</p>
        <span id="terms">나. 쿠키의 설치, 운영과 거부</span>
        <p>고객님은 쿠키에 대한 선택권이 있습니다. 웹 브라우저 종류에 따라 다소 상이할 수 있지만, 대부분 웹브라우저의 환경 설정을 통해 쿠키허용 여부를 결정하거나 기존의 쿠키 일체를 삭제할 수 있습니다. 다만 쿠키의 저장을 거부할 경우, 로그인이 필요한 일부 서비스의 이용에 제한이 생길 수 있습니다.</p>
        <p>[쿠키의 설정 방법]</p>
        <ul>
        <li>Internet Explorer : 도구 메뉴 선택 &gt; 인터넷 옵션 선택 &gt; 개인정보 탭 클릭 &gt; 개인정보처리 수준 설정</li>
        <li>Chrome : 설정 메뉴 선택 &gt; 고급 설정 표시 선택 &gt; 개인정보-콘텐츠 설정 선택 &gt; 쿠키 수준 설정</li>
        <li>Firefox : 옵션 메뉴 선택 &gt; 개인정보 선택 &gt; 방문기록-사용자 정의 설정 &gt; 쿠키 수준 설정</li>
        <li>Safari : 환경설정 메뉴 선택 &gt; 개인정보 탭 선택 &gt; 쿠키 및 웹 사이트 데이터 수준 설정</li>
        </ul>
        <br/>
        <br/>
        <span id="term">11. 이용자의 권리와 의무</span>
        <br/>
        <br/>
        <span id="terms">가. 이용자의 권리</span>
        <ul>
        <li>고객님은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다.</li>
        <li>개인정보 조회, 수정을 위해서는 '정보변경'을, 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.</li>
        <li>개인정보 보호책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.</li>
        <li>개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.</li>
        </ul>
        <span id="terms">나. 이용자의 의무</span>
        <ul>
        <li>고객님의 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방해 주시기 바랍니다. 고객님이 입력한 부정확한 정보로 인해 발생하는 사고의 책임은 고객님 자신에게 있으며 타인 정보를 도용하거나 허위정보를 입력할 경우 회원자격이 상실될 수 있습니다.</li>
        <li>고객님은 스스로를 보호하고 타인의 정보를 침해하지 않을 의무를 가지고 있습니다. 비밀번호를 포함한 귀하의 개인정보가 유출되지 않도록 주의하시고 타인의 개인정보와 게시물을 훼손하지 않도록 유의해 주십시오.</li>
        <li>이 같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시, ‘정보통신망이용촉진 및 정보 보호등에관한법률’ 등에 의해 처벌받을 수 있습니다.</li>
        </ul>
        <br/>
        <br/>
        <span id="term">12. 개인정보의 기술적/관리적 보호 대책</span>
        <p>회사는 이용자들의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.</p>
        <span id="terms">가. 비밀번호 암호화</span>
        <p>지니북스 회원 아이디(ID)의 비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.</p>
        <span id="terms">나. 해킹 등에 대비한 대책</span>
        <p>회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다.</p>
        <ul>
        <li>개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 유출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다.</li>
        <li>방화벽을 이용하여 외부로부터의 무단 접근을 방지하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</li>
        </ul>
        <span id="terms">다. 처리 직원의 최소화 및 교육</span>
        <ul>
        <li>회사의 개인정보관련 처리 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 개인정보처리방침의 준수를 항상 강조하고 있습니다.</li>
        <li>입사 시 개인정보 관련 처리자의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보 처리방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하고 있습니다.</li>
        <li>개인정보 관련 처리자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확화하고 있습니다.</li>
        </ul>
        <span id="terms">라. 개인정보 보호전담기구의 운영</span>
        <p>사내 개인정보 보호전담기구를 통하여 개인정보 보호방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다. 단, 이용자 본인의 부주의나 인터넷상의 문제로 아이디, 비밀번호, 이메일주소 등 개인정보가 유출되어 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다.</p>
        <br/>
        <br/>
        <span id="term">13. 개인정보 보호책임자 및 담당자</span>
        <br/>
        <br/>
        <span id="terms">가. 개인정보 관리 및 보호의 의무</span>
        <p>회사는 개인 정보를 안전하게 이용하여 최상의 서비스를 제공하기 위하여 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 상기 고지한 사항에 반하는 사고가 발생할 시에 개인정보 보호책임자가 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종 분쟁에 관해서는 일체 책임이 없습니다.</p>
        <span id="terms">나. 담당부서 연락처</span>
        <p>귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보 보호 관련 민원을 개인정보 보호책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.</p>
        <p>&lt;개인정보관리 책임 부서 및 보호책임자&gt;</p>
        <ul>
        <li>이 름 : 김혜빈</li>
        <li>소 속 : 개인정보 보호팀</li>
        <li>지 위 : CTO</li>
        <li>전 화 : 1644-0000</li>
        <li>메 일 : security@jini.com</li>
        </ul>
        <p>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
        <ul>
        <li>개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
        <li>대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
        <li>경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)</li>
        </ul>
        <br/>
        <br/>
        <span id="term">14. 고지의 의무</span>
        <p>현 개인정보처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다. 또한 개인정보 보호정책에 버전번호 및 변경공고일자 및 그 시행일자 등을 부여하여 개정여부를 쉽게 알 수 있도록 하고 있습니다.</p>
        <ul>
        <li>개인정보처리방침 버전번호 : 1.0</li>
        <li>개인정보처리방침 변경 공고일자 : 2019년 11월 24일</li>
        <li>변경 개인정보처리방침 시행일자 : 2019년 12월 1일</li>
        </ul>
        
  </div>
</div>
</div><!-- container 끝  -->	
</div><!-- books -->	

</body>
</html>