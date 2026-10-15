<template>
  <div class="login-layout">
    <div class="ambient-bg" aria-hidden="true">
      <div class="ambient-grid"></div>
      <div class="ambient-glow ambient-glow--one"></div>
      <div class="ambient-glow ambient-glow--two"></div>
      <div class="ambient-orbit ambient-orbit--one"></div>
      <div class="ambient-orbit ambient-orbit--two"></div>
      <span class="ambient-signal ambient-signal--one"></span>
      <span class="ambient-signal ambient-signal--two"></span>
      <span class="ambient-signal ambient-signal--three"></span>
    </div>

    <header class="login-header">
      <a href="" class="brand-lockup" :title="$t('common.github')">
        <span class="brand-symbol"><img src="/favicon.ico" alt="" /></span>
        <span class="brand-copy">
          <strong>E-Brain</strong>
          <small>{{ $t('platform.brandLine') }}</small>
        </span>
      </a>

      <div class="header-links">
      <!-- <a href="https://weknora.weixin.qq.com" target="_blank" class="header-link" :title="$t('common.website')">
        <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2"
          stroke-linecap="round">
          <circle cx="12" cy="12" r="10" />
          <line x1="2" y1="12" x2="22" y2="12" />
          <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
        </svg>
        <span class="link-text">{{ $t('common.website') }}</span>
      </a>

      <a href="https://github.com/Tencent/WeKnora" target="_blank" class="header-link" :title="$t('common.info')">
        <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor">
          <path
            d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12z" />
        </svg>
        <span class="link-text">GitHub</span>
      </a> -->

      <div class="language-switch">
        <button @click="toggleLanguageMenu" class="header-link" :title="currentLangOption?.label">
          <span class="lang-flag-icon">{{ currentLangOption?.flag }}</span>
          <span class="link-text">{{ currentLangOption?.shortLabel }}</span>
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"
            stroke-linecap="round">
            <polyline points="6 9 12 15 18 9" />
          </svg>
        </button>

        <!-- Language Dropdown -->
        <div v-if="showLanguageMenu" class="language-dropdown">
          <div v-for="lang in languageOptions" :key="lang.value" @click="selectLanguage(lang.value)"
            class="language-option" :class="{ active: currentLanguage === lang.value }">
            <span class="lang-flag">{{ lang.flag }}</span>
            <span class="lang-label">{{ lang.label }}</span>
            <span v-if="currentLanguage === lang.value" class="check-icon">✓</span>
          </div>
        </div>
      </div>
      </div>
    </header>

    <main class="login-main">
      <section class="showcase-section">
      <div class="showcase-content">
        <div class="showcase-kicker">
          <span class="kicker-index">01</span>
          <span>{{ $t('platform.subtitle') }}</span>
        </div>
        <h1 class="showcase-title">{{ $t('platform.heroTitle') }}</h1>
        <p class="showcase-description">{{ $t('platform.description') }}</p>

        <div class="feature-tags">
          <span class="tag"><i></i>{{ $t('platform.rag') }}</span>
          <span class="tag"><i></i>{{ $t('platform.agent') }}</span>
          <span class="tag"><i></i>{{ $t('platform.wiki') }}</span>
          <span class="tag"><i></i>{{ $t('platform.hybridSearch') }}</span>
        </div>





<!--         
        <div class="carousel-container">
          <div class="carousel-heading">
            <span>{{ $t('platform.carouselLabel') }}</span>
            <span class="carousel-heading__line"></span>
            <span class="carousel-heading__status">LIVE SYSTEM VIEW</span>
          </div>
          <swiper :modules="modules" :slides-per-view="1" :loop="true" :autoplay="{
            delay: 4000,
            disableOnInteraction: false,
          }" :effect="'fade'" :fade-effect="{ crossFade: true }"
            :pagination="{ clickable: true, dynamicBullets: false }" :speed="800" class="screenshot-swiper">
            <swiper-slide v-for="(slide, index) in slides" :key="index">
              <div class="slide-content">
                <div class="slide-index">0{{ index + 1 }}</div>
                <img :src="slide.image" :alt="slide.title" class="slide-image" />
                <div class="slide-caption">
                  <strong>{{ slide.title }}</strong>
                  <span>{{ slide.description }}</span>
                </div>
              </div>
            </swiper-slide>
          </swiper>
        </div> -->





      </div>
      </section>

      <section class="form-section">
      <div class="form-panel">
        <div class="panel-intro">
          <span class="panel-intro__eyebrow">{{ $t('platform.workspaceAccess') }}</span>
          <span class="panel-intro__rule"></span>
        </div>
        <!-- Login Card -->
        <div class="form-card" v-if="!isRegisterMode">
          <!-- invite_only 模式下共享链接停在登录卡，同样需要邀请上下文。 -->
          <div v-if="inviteLookup" class="invite-banner">
            <t-icon name="link" class="invite-banner__icon" />
            <div class="invite-banner__text">
              <div class="invite-banner__title">
                {{ $t('inviteRegister.bannerTitle', { tenant: inviteLookup.tenant_name || '' }) }}
              </div>
              <div class="invite-banner__hint">
                {{ $t('inviteRegister.bannerHintLogin') }}
              </div>
            </div>
          </div>
          <div v-else-if="inviteLookupError" class="invite-banner invite-banner--error">
            {{ inviteLookupError }}
          </div>
          <div class="form-header">
            <h2 class="form-title">{{ $t('auth.login') }}</h2>
            <p class="form-welcome">{{ $t('auth.subtitle') }}</p>
            <p v-if="registrationEnabled" class="form-hint">{{ $t('auth.loginHint') }}</p>
          </div>

          <div class="form-content">
            <t-form ref="formRef" :data="formData" :rules="formRules" @submit="handleLogin" layout="vertical"
              label-align="top">
              <t-form-item :label="$t('auth.email')" name="email">
                <t-input v-model="formData.email" :placeholder="$t('auth.emailPlaceholder')" type="text"
                  autocomplete="email" size="large" :disabled="loading" />
              </t-form-item>

              <t-form-item :label="$t('auth.password')" name="password">
                <t-input v-model="formData.password" :placeholder="$t('auth.passwordPlaceholder')" type="password"
                  autocomplete="current-password" size="large" :disabled="loading" @enter="handleLogin" />
              </t-form-item>

              <t-button type="submit" theme="primary" size="large" block :loading="loading" class="submit-button">
                {{ loading ? $t('auth.loggingIn') : $t('auth.login') }}
              </t-button>

              <div class="register-cta" v-if="registrationEnabled">
                <div class="register-cta__divider">
                  <span>{{ $t('auth.firstTime') }}</span>
                </div>
                <t-button theme="default" variant="outline" size="large" block class="register-cta__button"
                  :disabled="loading" @click="toggleMode">
                  {{ $t('auth.createAccount') }}
                </t-button>
              </div>

              <div v-if="oidcEnabled" class="oidc-divider">
                <span>{{ $t('auth.orContinueWith') }}</span>
              </div>

              <t-button v-if="oidcEnabled" theme="default" size="large" block :loading="oidcLoading" :disabled="loading"
                class="oidc-button" @click="handleOIDCLogin">
                {{ oidcLoading ? $t('auth.redirectingToOIDC') : oidcLoginText }}
              </t-button>
            </t-form>

            <!-- Features list -->
            <div class="login-features">
              <div class="feature-item">
                <span class="feature-icon">✓</span>
                <span class="feature-text">{{ $t('platform.multimodalParsing') }}</span>
              </div>
              <div class="feature-item">
                <span class="feature-icon">✓</span>
                <span class="feature-text">{{ $t('platform.hybridSearchEngine') }}</span>
              </div>
              <div class="feature-item">
                <span class="feature-icon">✓</span>
                <span class="feature-text">{{ $t('platform.ragQandA') }}</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Register Card. Renders when the user is in register mode
             AND either self-service registration is enabled OR they
             arrived with a valid share-link token (which bypasses the
             invite_only gate). -->
        <div class="form-card" v-if="isRegisterMode && (registrationEnabled || inviteLookup)">
          <!-- Share-link banner: shown only when ?token= resolved to a
               real invitation row. Sits above the form header so the
               invitee instantly sees who invited them and into which
               workspace, without bumping the existing register UX. -->
          <div v-if="inviteLookup" class="invite-banner">
            <t-icon name="link" class="invite-banner__icon" />
            <div class="invite-banner__text">
              <div class="invite-banner__title">
                {{ $t('inviteRegister.bannerTitle', { tenant: inviteLookup.tenant_name || '' }) }}
              </div>
              <div class="invite-banner__hint">
                {{ $t('inviteRegister.bannerHint') }}
              </div>
            </div>
          </div>
          <div v-else-if="inviteLookupError" class="invite-banner invite-banner--error">
            {{ inviteLookupError }}
          </div>
          <div class="form-header">
            <h2 class="form-title">{{ $t('auth.createAccount') }}</h2>
            <!-- <p class="form-subtitle">{{ $t('auth.registerSubtitle') }}</p> -->
          </div>

          <div class="form-content">
            <t-form ref="registerFormRef" :data="registerData" :rules="registerRules" @submit="handleRegister"
              layout="vertical" label-align="top">
              <t-form-item :label="$t('auth.username')" name="username">
                <t-input v-model="registerData.username" :placeholder="$t('auth.usernamePlaceholder')" size="large"
                  :disabled="loading" />
              </t-form-item>

              <t-form-item :label="$t('auth.email')" name="email">
                <t-input v-model="registerData.email" :placeholder="$t('auth.emailPlaceholder')" type="text"
                  autocomplete="email" size="large" :disabled="loading" />
              </t-form-item>

              <t-form-item :label="$t('auth.password')" name="password">
                <t-input v-model="registerData.password" :placeholder="$t('auth.passwordPlaceholder')" type="password"
                  autocomplete="new-password" size="large" :disabled="loading" />
              </t-form-item>

              <t-form-item :label="$t('auth.confirmPassword')" name="confirmPassword">
                <t-input v-model="registerData.confirmPassword" :placeholder="$t('auth.confirmPasswordPlaceholder')"
                  type="password" autocomplete="new-password" size="large" :disabled="loading"
                  @enter="handleRegister" />
              </t-form-item>

              <t-button type="submit" theme="primary" size="large" block :loading="loading" class="submit-button">
                {{ loading ? $t('auth.registering') : $t('auth.register') }}
              </t-button>
            </t-form>

            <div class="form-footer">
              <span>{{ $t('auth.haveAccount') }}</span>
              <a href="#" @click.prevent="toggleMode" class="link-button">
                {{ $t('auth.backToLogin') }}
              </a>
            </div>

            <!-- Features list for register -->
            <div class="login-features">
              <div class="feature-item">
                <span class="feature-icon">✓</span>
                <span class="feature-text">{{ $t('platform.independentTenant') }}</span>
              </div>
              <div class="feature-item">
                <span class="feature-icon">✓</span>
                <span class="feature-text">{{ $t('platform.fullApiAccess') }}</span>
              </div>
              <div class="feature-item">
                <span class="feature-icon">✓</span>
                <span class="feature-text">{{ $t('platform.knowledgeBaseManagement') }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, nextTick, onMounted, onBeforeUnmount, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { MessagePlugin } from 'tdesign-vue-next'
import { useRoleLabel } from '@/composables/useRoleLabel'
import { notifyLoginSuccess } from '@/utils/loginNotify'
import { newPasswordRules } from '@/utils/passwordPolicy'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Autoplay, EffectFade, Pagination } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/effect-fade'
import 'swiper/css/pagination'
import {
  login,
  register,
  getOIDCAuthorizationURL,
  getOIDCConfig,
  autoSetup,
  getAuthConfig,
  userInfoFromApi,
  getInvitationByToken,
  registerByInvite,
  type InviteLookup,
} from '@/api/auth'
import { useAuthStore } from '@/stores/auth'
import { useI18n } from 'vue-i18n'

// Import screenshot images
import screenshot1 from '@/assets/img/screenshot-1.svg'
import screenshot2 from '@/assets/img/screenshot-2.svg'
import screenshot3 from '@/assets/img/screenshot-3.svg'
import screenshot4 from '@/assets/img/screenshot-4.svg'

const router = useRouter()
const route = useRoute()
const authStore = useAuthStore()
const { t, tm, locale } = useI18n()
const { formatRole, roleIcon } = useRoleLabel()

// Swiper modules
const modules = [Autoplay, EffectFade, Pagination]

// Carousel slides data
const slides = computed(() => [
  {
    image: screenshot4,
    title: t('platform.carousel.agenticRagTitle'),
    description: t('platform.carousel.agenticRagDesc')
  },
  {
    image: screenshot2,
    title: t('platform.carousel.hybridSearchTitle'),
    description: t('platform.carousel.hybridSearchDesc')
  },
  {
    image: screenshot3,
    title: t('platform.carousel.wikiTitle'),
    description: t('platform.carousel.wikiDesc')
  },
  {
    image: screenshot1,
    title: t('platform.carousel.smartDocRetrievalTitle'),
    description: t('platform.carousel.smartDocRetrievalDesc')
  }
])

// Form references
const formRef = ref()
const registerFormRef = ref()

// State management
const loading = ref(false)
const oidcLoading = ref(false)
const isRegisterMode = ref(false)
const showLanguageMenu = ref(false)
const oidcEnabled = ref(false)
const oidcProviderName = ref('')
// registrationEnabled defaults to true so that on first paint the Register
// link is visible; the actual mode is fetched from /auth/config in onMounted.
// In invite_only mode the link/card are hidden.
const registrationEnabled = ref(true)
const complexPasswordEnabled = ref(false)

// invite-link state. When the URL carries ?token=xxx we resolve it to
// the originating tenant + role and switch the form into a "register
// via invitation" mode. The token bypasses the normal invite_only
// gate — possessing it IS the authorisation. Submitting the register
// form with this set hits /auth/register-by-invite (auto-login on
// success) instead of /auth/register.
const inviteToken = ref('')
const inviteLookup = ref<InviteLookup | null>(null)
const inviteLookupError = ref('')
const inviteLookupLoading = ref(false)

// Language options
const languageOptions = [
  { value: 'zh-CN', label: '简体中文', shortLabel: '中文', flag: '🇨🇳' },
  { value: 'en-US', label: 'English', shortLabel: 'EN', flag: '🇺🇸' },
  { value: 'ru-RU', label: 'Русский', shortLabel: 'RU', flag: '🇷🇺' },
  { value: 'ko-KR', label: '한국어', shortLabel: '한국어', flag: '🇰🇷' },
  { value: 'ja-JP', label: '日本語', shortLabel: '日本語', flag: '🇯🇵' }
]

const currentLanguage = computed(() => locale.value)
const oidcLoginText = computed(() => {
  if (oidcProviderName.value) {
    return t('auth.oidcLoginWithProvider', { provider: oidcProviderName.value })
  }
  return t('auth.oidcLogin')
})
const currentLangOption = computed(() => languageOptions.find(l => l.value === currentLanguage.value))

// Login form data
const formData = reactive<{ [key: string]: any }>({
  email: '',
  password: '',
})

// Register form data
const registerData = reactive<{ [key: string]: any }>({
  username: '',
  email: '',
  password: '',
  confirmPassword: ''
})

// Login form validation rules
const formRules = computed(() => ({
  email: [
    { required: true, message: t('auth.emailRequired'), type: 'error' },
    { email: true, message: t('auth.emailInvalid'), type: 'error' }
  ],
  password: [
    { required: true, message: t('auth.passwordRequired'), type: 'error' },
    { min: 8, message: t('auth.passwordMinLength'), type: 'error' },
    { max: 32, message: t('auth.passwordMaxLength'), type: 'error' }
  ],
}))

// Register form validation rules
const registerRules = computed(() => ({
  username: [
    { required: true, message: t('auth.usernameRequired'), type: 'error' },
    { min: 2, message: t('auth.usernameMinLength'), type: 'error' },
    { max: 20, message: t('auth.usernameMaxLength'), type: 'error' },
    {
      pattern: /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/,
      message: t('auth.usernameInvalid'),
      type: 'error'
    }
  ],
  email: [
    { required: true, message: t('auth.emailRequired'), type: 'error' },
    { email: true, message: t('auth.emailInvalid'), type: 'error' }
  ],
  password: newPasswordRules(t, complexPasswordEnabled.value),
  confirmPassword: [
    { required: true, message: t('auth.confirmPasswordRequired'), type: 'error' },
    {
      validator: (val: string) => val === registerData.password,
      message: t('auth.passwordMismatch'),
      type: 'error'
    }
  ]
}))

// Toggle login/register mode
const toggleMode = () => {
  isRegisterMode.value = !isRegisterMode.value

  Object.keys(registerData).forEach(key => {
    (registerData as any)[key] = ''
  })
}

// Toggle language menu
const toggleLanguageMenu = () => {
  showLanguageMenu.value = !showLanguageMenu.value
}

// Select language
const selectLanguage = (lang: string) => {
  locale.value = lang
  localStorage.setItem('locale', lang)
  showLanguageMenu.value = false
  MessagePlugin.success(t('language.languageSaved'))
}

// Close language menu when clicking outside
const handleClickOutside = (event: MouseEvent) => {
  const target = event.target as HTMLElement
  if (!target.closest('.language-switch')) {
    showLanguageMenu.value = false
  }
}

// Add click outside listener
onMounted(() => {
  document.addEventListener('click', handleClickOutside)
})

onBeforeUnmount(() => {
  document.removeEventListener('click', handleClickOutside)
})

const persistLoginResponse = async (response: any, skipRedirect = false) => {
  // Backend renamed `tenant` to `active_tenant` and added `memberships`
  // when tenant-level RBAC landed (issue #1303). The two are otherwise
  // identical — `active_tenant` is the tenant whose ID is encoded in the
  // JWT, defaulting to the user's home tenant on a fresh login.
  const activeTenant = response.active_tenant || response.tenant
  if (response.user && response.token) {
    // user.tenant_id must be the user's HOME tenant (the immutable row
    // on the users table); useHomeTenant() and the home-badge logic both
    // assume so. The ACTIVE tenant (which can differ from home when the
    // server honoured a remembered last-active-tenant preference) is
    // expressed separately via setSelectedTenant below.
    const homeTenantIdRaw = response.user.tenant_id ?? activeTenant?.id ?? ''
    authStore.setUser(userInfoFromApi(response.user, homeTenantIdRaw))
    authStore.setToken(response.token)
    if (response.refresh_token) {
      authStore.setRefreshToken(response.refresh_token)
    }
    if (activeTenant) {
      authStore.setTenant({
        id: String(activeTenant.id) || '',
        name: activeTenant.name || '',
        owner_id: response.user.id || '',
        created_at: activeTenant.created_at || new Date().toISOString(),
        updated_at: activeTenant.updated_at || new Date().toISOString()
      })
    } else {
      authStore.setTenant(null)
    }
    if (Array.isArray(response.memberships)) {
      authStore.setMemberships(response.memberships)
    }
    // If the backend dropped us into a non-home tenant (honoured a
    // remembered "last active tenant" preference), set the override so
    // subsequent requests carry X-Tenant-ID and the UI stays consistent.
    // Otherwise clear any stale override left in localStorage by a
    // previous session for a different account.
    const activeIdNum = Number(activeTenant?.id)
    const homeIdNum = Number(homeTenantIdRaw)
    if (Number.isFinite(activeIdNum) && Number.isFinite(homeIdNum) && activeIdNum !== homeIdNum) {
      authStore.setSelectedTenant(activeIdNum, activeTenant?.name || null)
    } else {
      authStore.setSelectedTenant(null, null)
    }
  }

  // Pull runtime capabilities (including whether ordinary users may create
  // workspaces) before entering the main UI so create actions never flash
  // briefly when the deployment is invitation-only.
  await authStore.refreshFromAuthMe()
  await nextTick()
  if (skipRedirect) return
  router.replace(authStore.hasValidTenant ? '/platform/knowledge-bases' : '/onboarding/workspace')
}

const getBackendOIDCRedirectURI = () => `${window.location.origin}/api/v1/auth/oidc/callback`

const loadOIDCConfig = async () => {
  try {
    const response = await getOIDCConfig()
    oidcEnabled.value = !!response.success && !!response.enabled
    oidcProviderName.value = response.provider_display_name || ''
  } catch {
    oidcEnabled.value = false
    oidcProviderName.value = ''
  }
}

// loadAuthConfig fetches /auth/config and caches whether self-service
// registration is allowed. Failures fall back to "enabled" so a transient
// network glitch doesn't lock new users out of an open deployment.
const loadAuthConfig = async () => {
  try {
    const response = await getAuthConfig()
    registrationEnabled.value = response.registration_mode !== 'invite_only'
    complexPasswordEnabled.value = response.complex_password_enabled
  } catch {
    registrationEnabled.value = true
    complexPasswordEnabled.value = false
  }
}

const handleOIDCLogin = async () => {
  try {
    oidcLoading.value = true
    const response = await getOIDCAuthorizationURL(getBackendOIDCRedirectURI())
    const authorizationURL = response.authorization_url

    if (!response.success || !authorizationURL) {
      MessagePlugin.error(response.message || t('auth.oidcLoginFailed'))
      return
    }

    // 跳转 IdP 会丢失 URL 中的 token，暂存到 sessionStorage，回调后由 App.vue 兑换。
    if (inviteToken.value) {
      sessionStorage.setItem('weknora_pending_invite_token', inviteToken.value)
    }
    window.location.href = authorizationURL
  } catch (error: any) {
    console.error('OIDC 登录跳转失败:', error)
    MessagePlugin.error(error.message || t('auth.oidcLoginFailed'))
  } finally {
    oidcLoading.value = false
  }
}

// 用 token 加入空间并进入应用。会话此时已有效，故即便 token 失效也照常进入（避免困在登录页）。
const acceptAndEnter = async (token: string) => {
  loading.value = true
  try {
    const result = await authStore.acceptInvitationByTokenAndRefresh(token)
    if (result.ok) {
      MessagePlugin.success(t('inviteRegister.joined'))
    } else {
      MessagePlugin.warning(t('inviteRegister.invalidBody'))
    }
  } catch {
    MessagePlugin.warning(t('inviteRegister.invalidBody'))
  } finally {
    loading.value = false
    await nextTick()
    router.replace('/platform/knowledge-bases')
  }
}

// Handle login
const handleLogin = async () => {
  try {
    const valid = await formRef.value?.validate()
    if (valid !== true) return

    loading.value = true

    const response = await login({
      email: formData.email,
      password: formData.password,
    })

    if (response.success) {
      if (inviteToken.value) {
        // 从邀请链接登录：持久化会话后兑换 token 并进入对应空间。
        await persistLoginResponse(response, true)
        await acceptAndEnter(inviteToken.value)
        return
      }
      await persistLoginResponse(response)
      notifyLoginSuccess(response, t, tm, formatRole, roleIcon)
    } else {
      MessagePlugin.error(response.message || t('auth.loginError'))
    }
  } catch (error: any) {
    console.error('登录错误:', error)
    MessagePlugin.error(error.message || t('auth.loginErrorRetry'))
  } finally {
    loading.value = false
  }
}

// Handle registration. Dispatches based on whether the user arrived
// with a share-link token: with token -> register-by-invite (auto-
// login on success); without -> the normal self-service register
// (drops back to the login form for the user to sign in).
const handleRegister = async () => {
  try {
    const valid = await registerFormRef.value?.validate()
    if (valid !== true) return

    loading.value = true

    if (inviteToken.value) {
      const response = await registerByInvite({
        token: inviteToken.value,
        username: registerData.username,
        email: registerData.email,
        password: registerData.password,
      })
      if (!response.success) {
        MessagePlugin.error(response.message || t('auth.registerFailed'))
        return
      }
      MessagePlugin.success(t('auth.registerSuccess'))
      // register-by-invite returns the same shape as login (token +
      // active_tenant + memberships), so reuse the login persistence
      // path — same store writes, same redirect target.
      await persistLoginResponse(response)
      return
    }

    const response = await register({
      username: registerData.username,
      email: registerData.email,
      password: registerData.password
    })

    if (response.success) {
      MessagePlugin.success(t('auth.registerSuccess'))

      // Switch to login mode and fill in email
      isRegisterMode.value = false
      formData.email = registerData.email

      // Clear register form
      Object.keys(registerData).forEach(key => {
        (registerData as any)[key] = ''
      })
    } else {
      MessagePlugin.error(response.message || t('auth.registerFailed'))
    }
  } catch (error: any) {
    console.error('注册错误:', error)
    MessagePlugin.error(error.message || t('auth.registerError'))
  } finally {
    loading.value = false
  }
}

// Check if already logged in; for lite edition, attempt transparent auto-setup
onMounted(async () => {
  // Share-link landing: ?token=xxx switches the form into invite-
  // register mode before any other auto-flow (logged-in redirect /
  // auto-setup / OIDC) gets a chance to redirect. Resolution failure
  // surfaces inline; the user can still log in normally if they
  // already have an account. We check this BEFORE the isLoggedIn
  // redirect so an existing session doesn't bounce the user to
  // /platform (and possibly back to /login if the session is stale),
  // dropping the invite token along the way.
  const tokenFromQuery = String(route.query.token || '').trim()
  if (tokenFromQuery) {
    inviteToken.value = tokenFromQuery
    inviteLookupLoading.value = true
    // 1. 先校验 token：无效/过期则停在登录页报错，不进注册模式。
    try {
      const resp = await getInvitationByToken(tokenFromQuery)
      if (resp.success && resp.data) {
        inviteLookup.value = resp.data
      } else {
        inviteLookupError.value = resp.message || t('inviteRegister.invalidBody')
        loadOIDCConfig()
        loadAuthConfig()
        return
      }
    } catch {
      inviteLookupError.value = t('inviteRegister.invalidBody')
      loadOIDCConfig()
      loadAuthConfig()
      return
    } finally {
      inviteLookupLoading.value = false
    }

    // 2. 已登录则直接兑换 token 进入空间（两种模式通用）。
    if (authStore.isLoggedIn && (await authStore.refreshFromAuthMe())) {
      await acceptAndEnter(tokenFromQuery)
      return
    }

    // 3. 未登录：按注册模式决定界面。invite_only 停在登录页、登录后再兑换；self_serve 保持注册流程。
    const cfg = await getAuthConfig()
    const inviteOnly = cfg.registration_mode === 'invite_only'
    registrationEnabled.value = !inviteOnly
    isRegisterMode.value = !inviteOnly
    loadOIDCConfig()
    return
  }

  if (authStore.isLoggedIn) {
    router.replace('/platform/knowledge-bases')
    return
  }

  const AUTO_SETUP_FAILED_KEY = 'weknora_auto_setup_failed'
  if (localStorage.getItem(AUTO_SETUP_FAILED_KEY) !== 'true') {
    try {
      const response = await autoSetup()
      if (response.success) {
        authStore.setLiteMode(true)
        await persistLoginResponse(response)
        return
      } else {
        localStorage.setItem(AUTO_SETUP_FAILED_KEY, 'true')
      }
    } catch {
      localStorage.setItem(AUTO_SETUP_FAILED_KEY, 'true')
    }
  }

  loadOIDCConfig()
  loadAuthConfig()
})
</script>

<style lang="less" scoped>
.login-layout {
  display: flex;
  width: 100%;
  min-height: 100%;
  overflow: hidden;
  position: relative;
  background: linear-gradient(225deg, #022c22 0%, #064e3b 15%, #065f46 25%, #047857 38%, #059669 50%, #07C05F 65%, #10B981 78%, #34D399 90%, #6EE7B7 100%);

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: radial-gradient(circle at 20% 50%, rgba(255, 255, 255, 0.06) 0%, transparent 50%),
      radial-gradient(circle at 80% 50%, rgba(255, 255, 255, 0.04) 0%, transparent 50%);
    pointer-events: none;
  }
}

.animated-bg {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  pointer-events: none;
  z-index: 1;
  overflow: hidden;
  contain: strict;
}

.knowledge-node {
  position: absolute;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.15);
  border: 2px solid rgba(255, 255, 255, 0.3);
  box-shadow:
    0 0 15px rgba(255, 255, 255, 0.35),
    0 0 30px rgba(16, 185, 129, 0.2),
    inset 0 0 8px rgba(255, 255, 255, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  animation: nodePulse 5s infinite ease-in-out;
  will-change: transform, opacity;
}

.node-icon {
  width: 20px;
  height: 20px;
  color: rgba(255, 255, 255, 0.9);
}

.node-1 {
  top: 15%;
  left: 20%;
  animation-delay: 0s;
}

.node-2 {
  top: 25%;
  left: 35%;
  animation-delay: 0.5s;
}

.node-3 {
  top: 20%;
  left: 55%;
  animation-delay: 1s;
}

.node-4 {
  top: 30%;
  left: 75%;
  animation-delay: 1.5s;
}

.node-5 {
  top: 45%;
  left: 25%;
  animation-delay: 2s;
}

.node-6 {
  top: 50%;
  left: 45%;
  animation-delay: 2.5s;
}

.node-7 {
  top: 48%;
  left: 65%;
  animation-delay: 3s;
}

.node-8 {
  top: 60%;
  left: 20%;
  animation-delay: 0.3s;
}

.node-9 {
  top: 12%;
  right: 15%;
  animation-delay: 1.8s;
}

.node-10 {
  top: 38%;
  right: 10%;
  animation-delay: 2.3s;
}

.node-11 {
  top: 70%;
  left: 40%;
  animation-delay: 0.8s;
}

.node-12 {
  top: 65%;
  left: 80%;
  animation-delay: 1.3s;
}

@keyframes nodePulse {

  0%,
  100% {
    transform: scale(1);
    opacity: 0.65;
  }

  50% {
    transform: scale(1.08);
    opacity: 0.9;
  }
}

.knowledge-lines {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0.35;
}

.connection-line {
  stroke: rgba(255, 255, 255, 0.5);
  stroke-width: 1.5;
  stroke-dasharray: 6, 3;
  stroke-linecap: round;
  animation: lineFlow 10s infinite linear;
  will-change: stroke-dashoffset;
}

.line-1 {
  animation-delay: 0s;
}

.line-2 {
  animation-delay: 0.5s;
}

.line-3 {
  animation-delay: 1s;
}

.line-4 {
  animation-delay: 0.3s;
}

.line-5 {
  animation-delay: 0.8s;
}

.line-6 {
  animation-delay: 1.3s;
}

.line-7 {
  animation-delay: 1.8s;
}

.line-8 {
  animation-delay: 2.3s;
}

.line-9 {
  animation-delay: 0.2s;
}

.line-10 {
  animation-delay: 0.7s;
}

.line-11 {
  animation-delay: 0.9s;
}

.line-12 {
  animation-delay: 1.5s;
}

@keyframes lineFlow {
  0% {
    stroke-dashoffset: 0;
  }

  100% {
    stroke-dashoffset: 18;
  }
}

@media (prefers-reduced-motion: reduce) {
  .knowledge-node {
    animation: none;
    opacity: 0.65;
  }

  .connection-line {
    animation: none;
  }
}

/* Left Showcase Section */
.showcase-section {
  flex: 0 0 52%;
  display: flex;
  align-items: flex-end;
  padding: 100px 30px 100px 50px;
  box-sizing: border-box;
  position: relative;
}

.showcase-content {
  width: 100%;
  max-width: 600px;
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  margin-bottom: 60px;
}

.showcase-subtitle {
  margin-top: 0;
  font-size: 22px;
  color: rgba(255, 255, 255, 0.95);
  margin: 0 0 8px 0;
  font-family: var(--app-font-family);
  line-height: 1.4;
  font-weight: 500;
}

.showcase-description {
  font-size: var(--app-text-lg);
  color: rgba(255, 255, 255, 0.8);
  margin: 0 0 28px 0;
  font-family: var(--app-font-family);
  line-height: 1.5;
}

.feature-tags {
  display: flex;
  gap: 12px;
  margin-bottom: 40px;
  flex-wrap: wrap;
}

.tag {
  display: inline-block;
  padding: 8px 20px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 20px;
  color: var(--td-text-color-anti);
  font-size: var(--app-text-base);
  font-weight: 500;
  font-family: var(--app-font-family);
}

/* Carousel */
.carousel-container {
  width: 100%;
  margin-top: 48px;
}

.screenshot-swiper {
  width: 100%;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  padding-bottom: 40px;

  :deep(.swiper-wrapper) {
    transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  }

  :deep(.swiper-pagination) {
    bottom: 15px !important;
    z-index: 10;
  }

  :deep(.swiper-pagination-bullet) {
    width: 10px;
    height: 10px;
    background: rgba(255, 255, 255, 0.5);
    opacity: 1;
    transition: all var(--app-motion-slow) ease;
    margin: 0 6px !important;
  }

  :deep(.swiper-pagination-bullet-active) {
    background: var(--td-bg-color-container);
    width: 28px;
    border-radius: 5px;
  }
}

.slide-content {
  width: 100%;
  height: 100%;
  background: var(--td-bg-color-container);
  border-radius: 16px;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.slide-image {
  width: 100%;
  height: 100%;
  display: block;
  object-fit: contain;
}

/* Right Form Section */
.form-section {
  flex: 0 0 48%;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  padding: 112px 50px 100px 30px;
  box-sizing: border-box;
  position: relative;
}

.form-panel {
  width: 100%;
  max-width: 480px;
  margin-bottom: 60px;
  position: relative;
  z-index: 2;
}

.header-logo {
  position: fixed;
  top: 32px;
  left: 50px;
  z-index: 100;
  cursor: pointer;

  .logo-image {
    width: 120px;
    height: auto;
  }
}

.header-links {
  position: fixed;
  top: 28px;
  right: 28px;
  display: flex;
  align-items: center;
  gap: 10px;
  z-index: 100;
}

.header-link {
  display: flex;
  align-items: center;
  gap: 7px;
  padding: 9px 15px;
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.25);
  color: var(--td-text-color-anti);
  text-decoration: none;
  font-size: var(--app-text-md);
  font-weight: 600;
  font-family: var(--app-font-family);
  letter-spacing: 0.2px;
  cursor: pointer;
  position: relative;

  svg {
    flex-shrink: 0;
  }

  .link-text {
    line-height: 1;
  }

  &:hover {
    background: rgba(255, 255, 255, 0.3);
    border-color: rgba(255, 255, 255, 0.4);
    color: var(--td-text-color-anti);
  }
}

.language-switch {
  position: relative;

  button {
    background: rgba(255, 255, 255, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.25);
    color: var(--td-text-color-anti);

    .lang-flag-icon {
      font-size: var(--app-text-xl);
      line-height: 1;
      flex-shrink: 0;
    }

    &:hover {
      background: rgba(255, 255, 255, 0.3);
      border-color: rgba(255, 255, 255, 0.4);
    }

    svg:last-child {
      margin-left: 2px;
      flex-shrink: 0;
    }
  }
}

.language-dropdown {
  position: absolute;
  top: calc(100% + 8px);
  right: 0;
  min-width: 160px;
  background: rgba(255, 255, 255, 0.97);
  border: 1px solid var(--td-component-stroke);
  border-radius: var(--app-radius-md);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
  overflow: hidden;
  z-index: 1000;
}

.language-option {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 14px;
  cursor: pointer;
  font-size: var(--app-text-md);
  font-family: var(--app-font-family);
  color: var(--td-text-color-primary);

  .lang-flag {
    font-size: var(--app-text-xl);
    flex-shrink: 0;
  }

  .lang-label {
    flex: 1;
  }

  .check-icon {
    color: var(--td-success-color);
    font-weight: 700;
    font-size: var(--app-text-base);
    flex-shrink: 0;
  }

  &:hover {
    background: var(--td-bg-color-secondarycontainer);
  }

  &.active {
    background: var(--td-success-color-light);
    color: var(--td-brand-color-active);
  }
}

.form-card {
  background: rgba(255, 255, 255, 0.97);
  border-radius: 16px;
  padding: 40px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
  box-sizing: border-box;
  border: none;
  width: 100%;
}

/* Share-link invitation banner. Sits above the register form when the
 * user arrived via /register?token=xxx; gives them confirmation of who
 * invited them before they fill anything in. Subtle, neutral card —
 * the page background is heavily brand-coloured already, so a loud
 * tinted banner clashes; we lean on the form's own surface tokens. */
.invite-banner {
  display: flex;
  align-items: flex-start;
  gap: 10px;
  padding: 12px 14px;
  margin-bottom: 20px;
  border-radius: var(--app-radius-lg);
  background: var(--td-bg-color-container-hover);
  border: 1px solid var(--td-component-stroke);
  color: var(--td-text-color-primary);
}

.invite-banner__icon {
  margin-top: 2px;
  font-size: var(--app-text-2xl);
  flex-shrink: 0;
  color: var(--td-text-color-secondary);
}

.invite-banner__text {
  display: flex;
  flex-direction: column;
  gap: 2px;
  min-width: 0;
}

.invite-banner__title {
  font-size: var(--app-text-base);
  font-weight: 600;
  line-height: 1.4;
  color: var(--td-text-color-primary);
}

.invite-banner__hint {
  font-size: var(--app-text-sm);
  color: var(--td-text-color-secondary);
  line-height: 1.5;
}

.invite-banner--error {
  background: var(--td-error-color-1);
  border-color: var(--td-error-color-3);
  color: var(--td-error-color);
  font-size: var(--app-text-md);
}

.form-header {
  text-align: center;
  margin-bottom: 32px;
}

.form-title {
  font-size: var(--app-text-4xl);
  font-weight: 600;
  color: var(--td-text-color-primary);
  margin: 0 0 6px 0;
  font-family: var(--app-font-family);
}

.form-welcome {
  font-size: var(--app-text-md);
  color: var(--td-text-color-secondary);
  margin: 0;
  font-family: var(--app-font-family);
}

.form-hint {
  margin: 10px 0 0;
  padding: 8px 12px;
  border-radius: var(--app-radius-md);
  background: var(--td-success-color-light);
  color: var(--td-brand-color-active);
  font-size: 12.5px;
  line-height: 1.5;
  font-family: var(--app-font-family);
}

/* 注册入口：从底部小字链接升级为带分隔线的醒目次级按钮，
   让首次访客一眼就能找到「创建账户」。 */
.register-cta {
  margin-top: 8px;

  &__divider {
    position: relative;
    text-align: center;
    margin: 4px 0 14px;
    color: var(--td-text-color-secondary);
    font-size: var(--app-text-md);
    font-family: var(--app-font-family);

    span {
      position: relative;
      z-index: 1;
      padding: 0 12px;
      background: rgba(255, 255, 255, 0.97);
    }

    &::before {
      content: '';
      position: absolute;
      left: 0;
      right: 0;
      top: 50%;
      border-top: 1px solid var(--td-component-stroke);
    }
  }

  &__button {
    height: 46px;
    border-radius: var(--app-radius-md);
    font-size: var(--app-text-lg);
    font-weight: 500;
    border-color: var(--td-brand-color);
    color: var(--td-brand-color);

    &:hover {
      border-color: var(--td-brand-color-active);
      color: var(--td-brand-color-active);
      background: var(--td-success-color-light);
    }
  }
}

.form-subtitle {
  font-size: var(--app-text-md);
  color: var(--td-text-color-secondary);
  margin: 0;
  font-family: var(--app-font-family);
}

.form-content {
  :deep(.t-form-item__label) {
    font-size: var(--app-text-base);
    color: var(--td-text-color-primary);
    font-weight: 500;
    margin-bottom: 8px;
    font-family: var(--app-font-family);
    display: block;
    text-align: left;
  }

  :deep(.t-input) {
    border: 1px solid var(--td-component-stroke);
    border-radius: var(--app-radius-md);
    background: var(--td-bg-color-container);
    transition: all var(--app-motion-base);

    &:focus-within {
      border-color: var(--td-brand-color);
      box-shadow: 0 0 0 3px color-mix(in srgb, var(--td-brand-color) 10%, transparent);
    }

    &:hover {
      border-color: var(--td-brand-color);
    }

    .t-input__inner {
      border: none !important;
      box-shadow: none !important;
      outline: none !important;
      background: transparent;
      font-size: var(--app-text-lg);
      font-family: var(--app-font-family);

      &:focus {
        border: none !important;
        box-shadow: none !important;
        outline: none !important;
      }
    }

    .t-input__wrap {
      border: none !important;
      box-shadow: none !important;
    }
  }

  :deep(.t-form-item) {
    margin-bottom: 18px;

    &:last-child {
      margin-bottom: 0;
    }
  }

  :deep(.t-form-item__control) {
    width: 100%;
  }
}

.submit-button {
  height: 46px;
  border-radius: var(--app-radius-md);
  font-size: var(--app-text-xl);
  font-weight: 500;
  font-family: var(--app-font-family);
  margin: 20px 0 16px 0;
}

.oidc-divider {
  position: relative;
  margin: 4px 0 6px;
  text-align: center;
  color: var(--td-text-color-placeholder);
  font-size: var(--app-text-sm);

  span {
    position: relative;
    z-index: 1;
    padding: 0 12px;
    background: rgba(255, 255, 255, 0.95);
  }

  &::before {
    content: '';
    position: absolute;
    left: 0;
    right: 0;
    top: 50%;
    border-top: 1px solid var(--td-component-stroke);
  }
}

.oidc-button {
  height: 46px;
  border-radius: var(--app-radius-md);
  font-size: var(--app-text-lg);
  font-weight: 500;
}

.form-footer {
  text-align: center;
  font-size: var(--app-text-base);
  color: var(--td-text-color-secondary);
  font-family: var(--app-font-family);
  margin-top: 16px;
  padding-bottom: 16px;
  border-bottom: 1px solid var(--td-component-stroke);

  .link-button {
    color: var(--td-brand-color);
    text-decoration: none;
    margin-left: 4px;
    font-weight: 500;
    transition: all var(--app-motion-base);

    &:hover {
      color: var(--td-brand-color);
      text-decoration: underline;
    }
  }
}

.login-form-footer {
  border-bottom: none;
  padding-bottom: 8px;
  margin-top: 12px;
}

.login-features {
  margin-top: 20px;
  padding: 0;

  .feature-item {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
    font-size: var(--app-text-md);
    color: var(--td-text-color-secondary);
    font-family: var(--app-font-family);

    &:last-child {
      margin-bottom: 0;
    }

    .feature-icon {
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: var(--td-success-color-light);
      color: var(--td-brand-color-active);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: var(--app-text-sm);
      font-weight: 700;
      margin-right: 10px;
      flex-shrink: 0;
    }

    .feature-text {
      line-height: 1.4;
    }
  }
}

/* Responsive Design */
@media (max-width: 1024px) {
  .knowledge-node:nth-of-type(n + 13) {
    display: none;
  }

  .connection-line:nth-of-type(n + 13) {
    display: none;
  }

  .showcase-subtitle {
    font-size: var(--app-text-2xl);
  }

  .header-logo {
    top: 26px;
    left: 40px;

    .logo-image {
      width: 100px;
    }
  }

  .header-links {
    top: 22px;
    right: 22px;
    gap: 8px;

    .link-text {
      display: none;
    }

    .header-link {
      padding: 10px;
      gap: 0;
    }
  }
}

@media (max-width: 768px) {
  .login-layout {
    flex-direction: column;
  }

  .knowledge-node:nth-of-type(n + 9) {
    display: none;
  }

  .connection-line:nth-of-type(n + 9) {
    display: none;
  }

  .showcase-section {
    flex: 0 0 auto;
    min-height: 50vh;
    padding: 40px 24px;
  }

  .showcase-content {
    max-width: 100%;
  }

  .header-logo {
    top: 22px;
    left: 30px;

    .logo-image {
      width: 80px;
    }
  }

  .showcase-subtitle {
    font-size: var(--app-text-xl);
    margin-bottom: 24px;
  }

  .feature-tags {
    margin-bottom: 24px;
  }

  .carousel-container {
    margin-top: 24px;
  }

  .form-section {
    flex: 0 0 auto;
    padding: 24px;
  }

  .header-links {
    top: 18px;
    right: 18px;
    gap: 8px;

    .link-text {
      display: inline;
    }

    .header-link {
      padding: 8px 12px;
      font-size: var(--app-text-sm);
    }
  }

  .form-card {
    padding: 32px 24px;
  }

  .form-title {
    font-size: 22px;
  }
}

@media (max-width: 480px) {
  .animated-bg {
    display: none;
  }

  .showcase-section {
    padding: 32px 20px;
  }

  .header-logo {
    top: 18px;
    left: 20px;

    .logo-image {
      width: 70px;
    }
  }

  .showcase-subtitle {
    font-size: var(--app-text-base);
  }

  .tag {
    font-size: var(--app-text-sm);
    padding: 6px 16px;
  }

  .form-section {
    padding: 20px;
  }

  .header-links {
    top: 14px;
    right: 14px;
    gap: 6px;
    flex-wrap: wrap;

    .header-link {
      padding: 7px 10px;
      font-size: var(--app-text-xs);
    }
  }

  .form-card {
    padding: 28px 20px;
  }

  .form-header {
    margin-bottom: 24px;
  }
}

@media (prefers-reduced-motion: reduce) {

  .knowledge-node,
  .connection-line {
    animation: none !important;
    transition: none !important;
  }

  .animated-bg {
    display: none;
  }
}
</style>

<!-- E-Brain login visual system: the legacy styles above remain scoped to
     the original selectors for compatibility, while this layer defines the
     new split-screen experience. Authentication markup and handlers are
     intentionally unchanged. -->
<style lang="less" scoped>
.login-layout {
  position: relative;
  display: block;
  width: 100%;
  height: 100svh;
  min-height: 640px;
  overflow: hidden;
  color: #f7f6f2;
  background:
    radial-gradient(circle at 10% 12%, rgba(224, 167, 87, 0.18), transparent 24%),
    radial-gradient(circle at 62% 88%, rgba(80, 116, 112, 0.2), transparent 30%),
    #111318;
}

.ambient-bg {
  position: absolute;
  inset: 0;
  z-index: 0;
  overflow: hidden;
  pointer-events: none;
}

.ambient-grid {
  position: absolute;
  inset: 0;
  opacity: 0.26;
  background-image:
    linear-gradient(rgba(255, 255, 255, 0.045) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.045) 1px, transparent 1px);
  background-size: 52px 52px;
  mask-image: linear-gradient(90deg, black 0%, black 55%, transparent 92%);
}

.ambient-glow {
  position: absolute;
  border-radius: 999px;
  filter: blur(2px);
  animation: ambientDrift 14s ease-in-out infinite alternate;
}

.ambient-glow--one {
  top: 14%;
  left: 27%;
  width: 280px;
  height: 280px;
  background: rgba(218, 158, 74, 0.1);
}

.ambient-glow--two {
  right: 28%;
  bottom: -100px;
  width: 360px;
  height: 360px;
  background: rgba(80, 145, 132, 0.11);
  animation-delay: -5s;
}

.ambient-orbit {
  position: absolute;
  border: 1px solid rgba(226, 181, 105, 0.22);
  border-radius: 50%;
  transform: rotate(-24deg);
  animation: orbitFloat 16s ease-in-out infinite;
}

.ambient-orbit::after {
  content: '';
  position: absolute;
  top: 9%;
  left: 18%;
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: #ddb16c;
  box-shadow: 0 0 18px rgba(221, 177, 108, 0.9);
}

.ambient-orbit--one {
  top: -180px;
  left: 28%;
  width: 620px;
  height: 330px;
}

.ambient-orbit--two {
  right: 32%;
  bottom: -250px;
  width: 560px;
  height: 300px;
  border-color: rgba(121, 163, 153, 0.18);
  animation-delay: -8s;
}

.ambient-signal {
  position: absolute;
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: #dcae64;
  box-shadow: 0 0 0 7px rgba(220, 174, 100, 0.08), 0 0 20px rgba(220, 174, 100, 0.7);
  animation: signalPulse 3.4s ease-in-out infinite;
}

.ambient-signal--one { top: 29%; left: 43%; }
.ambient-signal--two { top: 63%; left: 13%; animation-delay: -1.4s; }
.ambient-signal--three { right: 39%; bottom: 20%; animation-delay: -2.2s; }

.login-header {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 26px clamp(24px, 4vw, 68px);
  box-sizing: border-box;
}

.brand-lockup {
  display: inline-flex;
  align-items: center;
  gap: 11px;
  color: #f7f6f2;
  text-decoration: none;
}

.brand-symbol {
  display: grid;
  place-items: center;
  width: 38px;
  height: 38px;
  overflow: hidden;
  border: 1px solid rgba(238, 196, 123, 0.45);
  border-radius: 12px;
  background: rgba(255, 255, 255, 0.06);
  box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.04);

  img {
    width: 32px;
    height: 32px;
    object-fit: cover;
  }
}

.brand-copy {
  display: flex;
  flex-direction: column;
  gap: 3px;

  strong {
    font-size: 17px;
    line-height: 1;
    letter-spacing: -0.02em;
    font-weight: 700;
  }

  small {
    color: rgba(247, 246, 242, 0.52);
    font-size: 9px;
    line-height: 1;
    letter-spacing: 0.14em;
    text-transform: uppercase;
  }
}

.header-links {
  position: relative;
  top: auto;
  right: auto;
  display: flex;
  align-items: center;
  gap: 10px;
}

.header-link {
  color: rgba(247, 246, 242, 0.82);
  background: rgba(255, 255, 255, 0.055);
  border: 1px solid rgba(255, 255, 255, 0.13);
  border-radius: 12px;
  box-shadow: none;
  backdrop-filter: blur(14px);
  transition: background 180ms ease, border-color 180ms ease, transform 180ms ease;

  &:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.11);
    border-color: rgba(239, 195, 119, 0.42);
    transform: translateY(-1px);
  }
}

.language-switch button {
  color: rgba(247, 246, 242, 0.86);
  background: rgba(255, 255, 255, 0.055);
  border-color: rgba(255, 255, 255, 0.13);

  &:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.11);
    border-color: rgba(239, 195, 119, 0.42);
  }
}

.language-dropdown {
  top: calc(100% + 10px);
  min-width: 170px;
  padding: 6px;
  border: 1px solid rgba(255, 255, 255, 0.13);
  border-radius: 14px;
  background: rgba(28, 30, 37, 0.96);
  box-shadow: 0 18px 50px rgba(0, 0, 0, 0.35);
  backdrop-filter: blur(18px);
}

.language-option {
  border-radius: 9px;
  color: rgba(247, 246, 242, 0.8);

  &:hover,
  &.active {
    color: #f2c77e;
    background: rgba(231, 182, 102, 0.1);
  }
}

.login-main {
  position: relative;
  z-index: 2;
  display: grid;
  grid-template-columns: minmax(0, 1.12fr) minmax(370px, 0.88fr);
  gap: clamp(26px, 5vw, 92px);
  width: min(100%, 1540px);
  height: 100%;
  margin: 0 auto;
  padding: 94px clamp(24px, 4vw, 68px) 26px;
  box-sizing: border-box;
}

.showcase-section,
.form-section {
  min-width: 0;
  padding: 0;
  position: relative;
}

.showcase-section {
  display: flex;
  align-items: center;
}

.showcase-content {
  width: min(100%, 710px);
  margin: 0;
  z-index: 2;
}

.showcase-kicker {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 21px;
  color: #ddb16c;
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.16em;
  line-height: 1.2;
  text-transform: uppercase;
}

.kicker-index {
  display: inline-grid;
  place-items: center;
  width: 27px;
  height: 27px;
  border: 1px solid rgba(221, 177, 108, 0.5);
  border-radius: 9px;
  font-size: 10px;
  letter-spacing: 0;
}

.showcase-title {
  max-width: 680px;
  margin: 0;
  color: #f6f4ee;
  font-size: clamp(43px, 5.2vw, 78px);
  font-weight: 640;
  letter-spacing: -0.065em;
  line-height: 0.98;
  text-wrap: balance;
}

.showcase-description {
  max-width: 560px;
  margin: 24px 0 24px;
  color: rgba(247, 246, 242, 0.63);
  font-size: clamp(15px, 1.3vw, 18px);
  line-height: 1.65;
}

.feature-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin: 0 0 26px;
}

.tag {
  display: inline-flex;
  align-items: center;
  gap: 7px;
  padding: 8px 11px;
  border: 1px solid rgba(255, 255, 255, 0.12);
  border-radius: 9px;
  color: rgba(247, 246, 242, 0.68);
  background: rgba(255, 255, 255, 0.04);
  font-size: 11px;
  line-height: 1;
  white-space: nowrap;

  i {
    width: 5px;
    height: 5px;
    border-radius: 50%;
    background: #dcb06b;
    box-shadow: 0 0 10px rgba(220, 176, 107, 0.8);
  }
}

.carousel-container {
  width: min(100%, 690px);
  margin-top: 0;
}

.carousel-heading {
  display: flex;
  align-items: center;
  gap: 12px;
  margin: 0 0 10px 2px;
  color: rgba(247, 246, 242, 0.5);
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.13em;
  text-transform: uppercase;
}

.carousel-heading__line {
  width: 48px;
  height: 1px;
  background: rgba(221, 177, 108, 0.5);
}

.carousel-heading__status {
  color: rgba(247, 246, 242, 0.28);
  font-size: 9px;
  font-weight: 500;
  letter-spacing: 0.08em;
}

.screenshot-swiper {
  height: clamp(220px, 29vh, 320px);
  padding: 0 0 28px;
  border: 0;
  border-radius: 22px;
  box-shadow: 0 24px 70px rgba(0, 0, 0, 0.26);

  :deep(.swiper-wrapper) {
    transition-timing-function: cubic-bezier(0.22, 1, 0.36, 1);
  }

  :deep(.swiper-pagination) {
    bottom: 3px !important;
    left: 0;
    text-align: left;
  }

  :deep(.swiper-pagination-bullet) {
    width: 5px;
    height: 5px;
    margin: 0 5px 0 0 !important;
    background: rgba(255, 255, 255, 0.3);
    opacity: 1;
    transition: width 260ms ease, background 260ms ease;
  }

  :deep(.swiper-pagination-bullet-active) {
    width: 25px;
    border-radius: 5px;
    background: #ddb16c;
  }
}

.slide-content {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  overflow: hidden;
  border: 1px solid rgba(222, 177, 108, 0.28);
  border-radius: 22px;
  background:
    radial-gradient(circle at 82% 18%, rgba(221, 177, 108, 0.16), transparent 25%),
    radial-gradient(circle at 15% 90%, rgba(79, 137, 128, 0.14), transparent 35%),
    linear-gradient(135deg, #171a20 0%, #0f1116 58%, #191b20 100%);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.07), inset 0 0 45px rgba(255, 255, 255, 0.025);
}

.slide-content::after {
  content: '';
  position: absolute;
  inset: 0;
  pointer-events: none;
  background: linear-gradient(115deg, transparent 20%, rgba(241, 202, 137, 0.16) 48%, transparent 68%);
  transform: translateX(-100%);
  animation: slideSheen 8s ease-in-out infinite;
}

.slide-index {
  position: absolute;
  top: 14px;
  left: 16px;
  z-index: 2;
  color: rgba(247, 246, 242, 0.42);
  font-family: ui-monospace, SFMono-Regular, Menlo, monospace;
  font-size: 10px;
  letter-spacing: 0.12em;
}

.slide-image {
  position: absolute;
  top: 17px;
  right: 17px;
  bottom: 52px;
  left: 17px;
  z-index: 1;
  width: calc(100% - 34px);
  height: calc(100% - 69px);
  display: block;
  object-fit: contain;
  border-radius: 12px;
  box-shadow: 0 12px 28px rgba(29, 33, 38, 0.13);
}

.slide-caption {
  position: absolute;
  right: 18px;
  bottom: 13px;
  left: 18px;
  z-index: 3;
  display: flex;
  align-items: baseline;
  gap: 10px;
  min-width: 0;

  strong {
    overflow: hidden;
    color: #f7f6f2;
    font-size: 12px;
    font-weight: 700;
    line-height: 1.2;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  span {
    overflow: hidden;
    color: rgba(247, 246, 242, 0.52);
    font-size: 10px;
    line-height: 1.2;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
}

.form-section {
  display: flex;
  align-items: center;
  justify-content: center;
}

.form-panel {
  width: min(100%, 440px);
  max-width: 440px;
  margin: 0;
  z-index: 2;
}

.panel-intro {
  display: flex;
  align-items: center;
  gap: 12px;
  margin: 0 0 12px 4px;
  color: rgba(247, 246, 242, 0.45);
  font-size: 10px;
  font-weight: 700;
  letter-spacing: 0.16em;
  text-transform: uppercase;
}

.panel-intro__rule {
  width: 42px;
  height: 1px;
  background: rgba(221, 177, 108, 0.55);
}

.form-card {
  width: 100%;
  max-height: calc(100svh - 144px);
  overflow-y: auto;
  padding: clamp(25px, 3vw, 38px);
  border: 1px solid rgba(255, 255, 255, 0.55);
  border-radius: 28px;
  box-sizing: border-box;
  background: #f7f6f2 !important;
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.22), 0 1px 0 rgba(255, 255, 255, 0.8) inset !important;
  scrollbar-width: thin;
  scrollbar-color: rgba(28, 30, 36, 0.24) transparent;
}

.form-card::-webkit-scrollbar { width: 5px; }
.form-card::-webkit-scrollbar-thumb { border-radius: 99px; background: rgba(28, 30, 36, 0.24); }

.invite-banner {
  margin-bottom: 18px;
  border-color: rgba(33, 35, 42, 0.12);
  background: rgba(33, 35, 42, 0.045);
}

.form-header {
  margin-bottom: 25px;
  text-align: left;
}

.form-title {
  margin: 0 0 8px;
  color: #1b1d23;
  font-size: clamp(29px, 3vw, 38px);
  font-weight: 670;
  letter-spacing: -0.045em;
  line-height: 1;
}

.form-welcome {
  max-width: 330px;
  color: rgba(27, 29, 35, 0.54);
  font-size: 13px;
  line-height: 1.55;
}

.form-hint {
  margin-top: 14px;
  color: #6e542a;
  background: rgba(221, 177, 108, 0.14);
}

.form-content {
  :deep(.t-form-item__label) {
    margin-bottom: 7px;
    color: rgba(27, 29, 35, 0.78);
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.02em;
  }

  :deep(.t-form-item) {
    margin-bottom: 15px;
  }

  :deep(.t-input) {
    min-height: 48px;
    border: 1px solid rgba(27, 29, 35, 0.15) !important;
    border-radius: 13px;
    background: #fff !important;
    box-shadow: none !important;
    transition: border-color 180ms ease, box-shadow 180ms ease, transform 180ms ease;

    &:hover,
    &:focus-within {
      border-color: rgba(184, 133, 54, 0.8) !important;
      box-shadow: 0 0 0 4px rgba(221, 177, 108, 0.13) !important;
    }

    .t-input__inner {
      color: #1b1d23;
      font-size: 14px;
    }
  }
}

.submit-button,
.oidc-button,
.register-cta__button {
  min-height: 48px;
  border-radius: 13px;
  font-size: 14px;
  font-weight: 700;
  letter-spacing: 0.01em;
}

.submit-button {
  margin: 15px 0 12px;
  color: #f9f8f4 !important;
  background: #1b1d23 !important;
  border-color: #1b1d23 !important;
  box-shadow: 0 10px 22px rgba(27, 29, 35, 0.18);

  &:hover {
    background: #343740 !important;
    border-color: #343740 !important;
    transform: translateY(-1px);
  }
}

.register-cta {
  margin-top: 3px;
}

.register-cta__divider {
  margin: 8px 0 11px;
  color: rgba(27, 29, 35, 0.42);
  font-size: 11px;

  span {
    color: inherit;
    background: #f7f6f2 !important;
  }

  &::before {
    border-color: rgba(27, 29, 35, 0.1);
  }
}

.register-cta__button {
  color: #292c34 !important;
  border-color: rgba(27, 29, 35, 0.18) !important;
  background: transparent !important;

  &:hover {
    color: #6e542a !important;
    border-color: rgba(184, 133, 54, 0.65) !important;
    background: rgba(221, 177, 108, 0.1) !important;
  }
}

.oidc-divider {
  margin: 12px 0 8px;

  span {
    background: #f7f6f2 !important;
  }

  &::before {
    border-color: rgba(27, 29, 35, 0.1);
  }
}

.oidc-button {
  color: #292c34 !important;
  border-color: rgba(27, 29, 35, 0.16) !important;
  background: #fff !important;
}

.login-features {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 8px;
  margin-top: 20px;
  padding-top: 18px;
  border-top: 1px solid rgba(27, 29, 35, 0.1);

  .feature-item {
    display: block;
    margin: 0;
    color: rgba(27, 29, 35, 0.54);
    font-size: 10px;
    line-height: 1.35;
  }

  .feature-icon {
    display: grid;
    width: 21px;
    height: 21px;
    margin: 0 0 7px;
    color: #8f672b;
    background: rgba(221, 177, 108, 0.2);
    font-size: 11px;
  }

  .feature-text {
    display: block;
  }
}

.form-footer {
  border-color: rgba(27, 29, 35, 0.1);

  .link-button {
    color: #8f672b;

    &:hover { color: #61461e; }
  }
}

@keyframes ambientDrift {
  from { transform: translate3d(-12px, 4px, 0) scale(0.96); opacity: 0.6; }
  to { transform: translate3d(18px, -16px, 0) scale(1.05); opacity: 1; }
}

@keyframes orbitFloat {
  0%, 100% { transform: rotate(-24deg) translate3d(0, 0, 0); opacity: 0.6; }
  50% { transform: rotate(-18deg) translate3d(10px, 14px, 0); opacity: 1; }
}

@keyframes signalPulse {
  0%, 100% { transform: scale(0.75); opacity: 0.48; }
  50% { transform: scale(1.5); opacity: 1; }
}

@keyframes slideSheen {
  0%, 55% { transform: translateX(-100%); }
  75%, 100% { transform: translateX(100%); }
}

@media (max-height: 780px) and (min-width: 901px) {
  .login-header { padding-top: 18px; padding-bottom: 18px; }
  .login-main { padding-top: 76px; padding-bottom: 18px; }
  .showcase-title { font-size: clamp(38px, 4.8vw, 64px); }
  .showcase-description { margin: 17px 0; }
  .feature-tags { margin-bottom: 18px; }
  .screenshot-swiper { height: 215px; }
  .form-card { max-height: calc(100svh - 112px); padding: 24px 28px; }
}

@media (max-width: 900px) {
  .login-layout {
    height: auto;
    min-height: 100svh;
    overflow-y: auto;
  }

  .login-header {
    position: relative;
    padding: 18px 20px;
  }

  .login-main {
    grid-template-columns: 1fr;
    gap: 30px;
    height: auto;
    padding: 24px 20px 36px;
  }

  .showcase-section { align-items: flex-start; }
  .showcase-content { width: 100%; }
  .showcase-title { max-width: 700px; font-size: clamp(40px, 8vw, 62px); }
  .carousel-container { width: 100%; }
  .form-section { justify-content: stretch; }
  .form-panel { width: 100%; max-width: 520px; margin: 0 auto; }
  .form-card { max-height: none; }
}

@media (max-width: 520px) {
  .brand-copy small { display: none; }
  .header-links .link-text { display: inline; }
  .header-link { padding: 8px 10px; }
  .showcase-title { font-size: 42px; }
  .showcase-description { margin-top: 17px; font-size: 14px; }
  .feature-tags { gap: 6px; }
  .tag { padding: 7px 9px; font-size: 10px; }
  .screenshot-swiper { height: 205px; }
  .slide-caption { display: block; }
  .slide-caption span { display: block; margin-top: 3px; }
  .form-card { padding: 24px 20px; border-radius: 22px; }
  .login-features { gap: 6px; }
}

@media (prefers-reduced-motion: reduce) {
  .ambient-glow,
  .ambient-orbit,
  .ambient-signal,
  .slide-content::after { animation: none; }
}
</style>

<style lang="less">
html[theme-mode="dark"] {
  .login-layout {
    background: linear-gradient(225deg, #011a14 0%, #032e22 15%, #043a2c 25%, #05503d 38%, #046647 50%, #038a56 65%, #049b60 78%, #06a06a 90%, #07b074 100%);
  }

  .knowledge-node {
    background: rgba(255, 255, 255, 0.1);
    border-color: rgba(255, 255, 255, 0.2);
    box-shadow: 0 0 8px rgba(255, 255, 255, 0.15);
  }

  .connection-line {
    stroke: rgba(255, 255, 255, 0.25);
  }

  .header-logo .logo-image {
    filter: invert(1) hue-rotate(180deg) brightness(1.1);
  }

  .header-link {
    background: rgba(255, 255, 255, 0.12);
    border-color: rgba(255, 255, 255, 0.15);

    &:hover {
      background: rgba(255, 255, 255, 0.2);
    }
  }

  .language-switch button {
    background: rgba(255, 255, 255, 0.12);
    border-color: rgba(255, 255, 255, 0.15);

    &:hover {
      background: rgba(255, 255, 255, 0.2);
    }
  }

  .language-dropdown {
    background: rgba(36, 36, 36, 0.97) !important;
    border-color: var(--td-component-stroke) !important;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.4) !important;
  }

  .tag {
    background: rgba(255, 255, 255, 0.12);
  }

  .form-card {
    background: rgba(36, 36, 36, 0.97) !important;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.4) !important;
  }

  .register-cta__divider span {
    background: rgba(36, 36, 36, 0.97);
  }

  .form-content .t-input {
    background: var(--td-bg-color-page) !important;
    border-color: rgba(255, 255, 255, 0.1) !important;

    &:hover {
      border-color: var(--td-brand-color) !important;
    }

    &:focus-within {
      border-color: var(--td-brand-color) !important;
    }
  }

  .screenshot-swiper .swiper-pagination-bullet-active {
    background: rgba(255, 255, 255, 0.9) !important;
  }

  .login-features .feature-icon {
    background: rgba(6, 176, 77, 0.15);
  }
}
</style>

<style lang="less" scoped>
/* Keep the new visual system consistent when the app theme is dark. */
html[theme-mode="dark"] .login-layout {
  background:
    radial-gradient(circle at 10% 12%, rgba(224, 167, 87, 0.18), transparent 24%),
    radial-gradient(circle at 62% 88%, rgba(80, 116, 112, 0.2), transparent 30%),
    #111318 !important;
}

html[theme-mode="dark"] .header-link,
html[theme-mode="dark"] .language-switch button {
  color: rgba(247, 246, 242, 0.86) !important;
  background: rgba(255, 255, 255, 0.055) !important;
  border-color: rgba(255, 255, 255, 0.13) !important;
}

html[theme-mode="dark"] .form-card {
  color: #1b1d23;
  background: #f7f6f2 !important;
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.22), 0 1px 0 rgba(255, 255, 255, 0.8) inset !important;
}

html[theme-mode="dark"] .form-content :deep(.t-input) {
  color: #1b1d23 !important;
  background: #fff !important;
  border-color: rgba(27, 29, 35, 0.15) !important;
}

html[theme-mode="dark"] .register-cta__divider span,
html[theme-mode="dark"] .oidc-divider span {
  background: #f7f6f2 !important;
}

html[theme-mode="dark"] .login-features .feature-icon {
  color: #8f672b !important;
  background: rgba(221, 177, 108, 0.2) !important;
}
</style>
