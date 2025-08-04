# 🚀 Render.com 배포 가이드 - 만원요리 최씨남매 디지털 명함

## 📋 자동 배포 단계

### 1단계: Render Dashboard 접속
1. https://dashboard.render.com 접속
2. GitHub 계정으로 로그인

### 2단계: 새 Static Site 생성
1. **New +** 버튼 클릭
2. **Static Site** 선택

### 3단계: GitHub 저장소 연결
1. **Connect a repository** 클릭
2. `manwonyori/business-card` 저장소 선택
3. **Connect** 클릭

### 4단계: 배포 설정
아래 정보를 입력:

```
Name: manwon-business-card
Branch: main
Root Directory: (비워두기)
Build Command: (비워두기)
Publish Directory: ./
```

### 5단계: 환경 설정 (선택사항)
Environment Variables는 필요 없음 (정적 사이트)

### 6단계: 배포 시작
1. **Create Static Site** 버튼 클릭
2. 자동으로 배포 시작 (2-3분 소요)

## 🌐 배포 완료 후

### 접속 URL
```
https://manwon-business-card.onrender.com
```

### 커스텀 도메인 설정 (선택사항)
1. Settings > Custom Domains
2. `card.manwonyori.com` 입력
3. DNS 설정:
   - Type: CNAME
   - Name: card
   - Value: manwon-business-card.onrender.com

## 🔧 render.yaml 설정 설명

```yaml
services:
  - type: web
    name: manwon-business-card
    runtime: static
    buildCommand: ""  # 빌드 불필요
    staticPublishPath: ./  # 루트 디렉토리 배포
    pullRequestPreviewsEnabled: true  # PR 미리보기 활성화
    headers:  # 보안 헤더 설정
      - X-Frame-Options: SAMEORIGIN
      - X-Content-Type-Options: nosniff
      - X-XSS-Protection: 1; mode=block
    routes:  # SPA 라우팅 (필요시)
      - type: rewrite
        source: /*
        destination: /index.html
```

## ✅ 장점

1. **무료 호스팅**: 정적 사이트 무료
2. **자동 배포**: GitHub 푸시 시 자동 배포
3. **SSL 인증서**: 자동 HTTPS 제공
4. **CDN**: 전 세계 빠른 로딩
5. **99.9% 가동률**: 안정적인 서비스

## 📊 성능 모니터링

Render Dashboard에서 확인 가능:
- 배포 상태
- 트래픽 통계
- 에러 로그
- 성능 메트릭

## 🔍 문제 해결

### 배포 실패 시
1. Logs 탭에서 에러 메시지 확인
2. GitHub 저장소 권한 확인
3. render.yaml 문법 검증

### 404 에러 발생 시
1. Publish Directory 설정 확인
2. index.html 파일 존재 여부 확인
3. 대소문자 구분 확인 (Linux 서버)

---

*Render.com 배포는 GitHub Actions보다 간단하고 빠릅니다!*