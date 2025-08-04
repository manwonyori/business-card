# 📇 만원요리 최씨남매 - 직원 명함 추가 가이드

## 🚀 직원 명함 시스템 완성!

이제 JSON 기반의 동적 직원 명함 시스템이 완성되었습니다.

### 📋 현재 구조

```
business-card/
├── index.html           # 직원 목록 페이지 (메인)
├── card.html           # 동적 명함 템플릿
├── lee-jinyong.html    # 이진용 대표 개별 명함
├── data/
│   └── employees.json  # 직원 데이터 (여기만 수정하면 됨!)
└── 기타 파일들...
```

## 👥 직원 추가 방법 (매우 간단!)

### 1단계: employees.json 파일 열기
`data/employees.json` 파일을 텍스트 에디터로 엽니다.

### 2단계: 새 직원 정보 추가
employees 배열에 새 직원 정보를 추가합니다:

```json
{
  "id": "honggildong",        // 영문 소문자 (URL에 사용)
  "name": "홍길동",           // 실제 이름
  "title": "영업팀",          // 부서/직책
  "phone": "010-9999-8888",   // 전화번호
  "email": "hong@manwonyori.com",  // 이메일
  "profileImage": null,       // 프로필 사진 (선택)
  "active": true             // true: 표시, false: 숨김
}
```

### 3단계: 저장 후 Git 푸시
```bash
git add data/employees.json
git commit -m "직원 추가: 홍길동"
git push
```

## 🔗 접근 방법

### 직원 목록 페이지
```
https://manwonyori.github.io/business-card/
```

### 개별 직원 명함
```
https://manwonyori.github.io/business-card/card.html?id=leejinyong
https://manwonyori.github.io/business-card/card.html?id=kimcheolsu
https://manwonyori.github.io/business-card/card.html?id=parkminjung
...
```

## 💡 활용 팁

### 1. 직원 정보 수정
- `employees.json`에서 해당 직원 정보만 수정
- Git push 하면 자동 반영

### 2. 직원 비활성화
- 퇴사자는 삭제하지 말고 `"active": false`로 변경
- 목록에서 숨겨지지만 기존 링크는 유지

### 3. 부서별 정렬
- employees 배열의 순서대로 표시됨
- 부서별로 그룹핑하여 정렬 가능

### 4. QR 코드 생성
각 직원별 QR 코드 생성 URL:
```
https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=https://manwonyori.github.io/business-card/card.html?id=직원ID
```

## 🎯 추가 가능한 기능

### 간단한 기능 (10분)
- [ ] 프로필 사진 추가
- [ ] 부서별 색상 변경
- [ ] 직급 표시 추가

### 고급 기능 (30분)
- [ ] 검색 기능
- [ ] 부서별 필터
- [ ] 명함 다운로드 (PDF)
- [ ] 다국어 지원

## 📱 모바일 사용법

### 직원에게 링크 공유
1. 직원 목록에서 해당 직원 클릭
2. URL 복사
3. 카톡/문자로 전송

### 예시 메시지
```
안녕하세요! 만원요리 최씨남매 디지털 명함입니다.
https://manwonyori.github.io/business-card/card.html?id=kimcheolsu
클릭하시면 연락처를 저장하실 수 있습니다 😊
```

## ✅ 체크리스트

- [x] 직원 목록 페이지 완성
- [x] 동적 명함 생성 시스템
- [x] JSON 기반 데이터 관리
- [x] 모바일 최적화
- [x] 연락처 저장 기능
- [ ] 실제 직원 데이터 입력
- [ ] 프로필 사진 추가 (선택)

---

### 🆘 도움이 필요하신가요?
- 기술 문의: we@manwonyori.com
- 수정 요청: GitHub Issues

*만원요리 최씨남매 디지털 명함 시스템 v2.0*