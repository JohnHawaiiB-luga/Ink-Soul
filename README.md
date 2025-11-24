# 🖤 Ink & Soul by Asunaah
<p align="center">
<img width="800" height="521" alt="image" src="https://github.com/user-attachments/assets/b8ad0292-4fe7-47ca-a759-629fcd3bed6b" />
</p>

> Fineline · Sacred & Symbolic Tattooing

<h1> Professional full-stack web application for a tattoo artist specializing in contemporary devotional tattooing. </h1>
  
## ✨ Características
### 🎨 Frontend
- **Diseño "Templo Digital Devocional"**: Estética dark premium con acentos dorados
- **Multi-página (MPA)**: 6 páginas independientes con React Router
- **Bilingüe**: Español/Inglés con selector en navegación
- **Responsive**: Optimizado para mobile, tablet y desktop
- **Animaciones**: Efectos "halo dorado" y transiciones elegantes (400-600ms)
- **Componentes**: Hero, Button, Card, Navigation, Footer personalizados

### 🔧 Backend
- **Supabase**: Base de datos PostgreSQL gestionada
- **Edge Functions**: 3 funciones serverless en Deno
  - `submit-appointment`: Gestión de citas
  - `send-contact-message`: Mensajes de contacto
  - `create-payment-intent`: Procesamiento de pagos Stripe
- **RLS Policies**: Seguridad a nivel de fila configurada

### 🛍️ Funcionalidades
- **Portfolio Dinámico**: Galería masonry con filtros por categoría (lightbox modal)
- **Sistema de Citas**: Formulario completo con calendario visual
- **Tienda Online**: Productos con integración Stripe (prints, merchandise, aftercare)
- **Contacto**: Formulario + información + mapa Google Maps
- **Sobre Mí**: Biografía + proceso creativo timeline

### 🔧 Panel de Administración

**Propósito**: Dashboard completo para la gestión integral del negocio de tatuaje, permitiendo administrar citas, productos, contenido y usuarios de manera centralizada desde una interfaz web moderna y segura.

**Funciones Clave**:
- **Gestión de Citas**: Ver, editar, confirmar o cancelar citas de clientes
- **Administración de Tienda**: Gestionar productos, precios, inventario y órdenes de compra
- **Usuarios RGPD**: Gestión de datos personales y cumplimiento de normativas europeas
- **Contenido Dinámico**: Actualizar portfolio, biografía y información de contacto

**Acceso y Seguridad**:
- **Ruta**: `/admin` (protegida con autenticación robusta)
- **Roles**: Owner (acceso completo), Assistant (gestión limitada), Viewer (solo lectura)
- **Autenticación**: Sistema 2FA (Two-Factor Authentication) obligatorio
- **Backups**: Automáticos diarios con rotación semanal
- **Logs**: Registro completo de acciones administrativas

**[DEMO PLACEHOLDER: Panel administrativo con screenshots y credenciales de prueba]**

## 🏗️ Arquitectura

```
ink-soul-app/
├── public/
│   └── images/              # Assets visuales (9 imágenes)
├── src/
│   ├── components/
│   │   ├── common/          # Button, Hero
│   │   └── layout/          # Navigation, Footer
│   ├── pages/               # Home, About, Portfolio, Appointments, Shop, Contact
│   ├── contexts/            # LanguageContext (ES/EN)
│   ├── lib/                 # supabase.ts, i18n.ts
│   └── index.css            # Tailwind + custom styles
├── supabase/
│   └── functions/           # 3 Edge Functions
├── docs/                    # Design specs
└── DEPLOYMENT_GUIDE.md      # Guía completa de deployment
```

## 🚀 Quick Start

### Pre-requisitos
- Node.js 18+
- pnpm
- Cuenta Supabase (gratis)
- Cuenta Stripe (modo test gratis)

### 1. Instalar Dependencias
```bash
cd ink-soul-app
pnpm install
```

### 2. Configurar Credenciales

**Supabase** (`src/lib/supabase.ts`):
```typescript
const supabaseUrl = "https://YOUR_PROJECT.supabase.co"
const supabaseAnonKey = "YOUR_ANON_KEY"
```

**Stripe** (`src/pages/ShopPage.tsx`):
```typescript
const stripePromise = loadStripe('YOUR_PUBLISHABLE_KEY')
```

### 3. Configurar Backend

Ver `DEPLOYMENT_GUIDE.md` para instrucciones completas:
- Crear tablas en Supabase
- Configurar RLS policies
- Desplegar Edge Functions
- Insertar productos de ejemplo

### 4. Desarrollo Local
```bash
pnpm dev
# Visitar http://localhost:5173
```

### 5. Build Production
```bash
pnpm build
# Output: dist/
```

## 📊 Base de Datos

### Tablas
1. **appointments**: Gestión de citas de tatuaje
2. **products**: Catálogo de productos (prints, merchandise, aftercare)
3. **orders**: Órdenes de compra con Stripe
4. **order_items**: Items individuales de cada orden
5. **contact_messages**: Mensajes de contacto

## 🎨 Design System

### Paleta de Colores
- Negro Carbón: `#0C0C0C` (85% - fondo principal)
- Dorado Envejecido: `#C1A261` (10% - acentos, CTA)
- Burdeos Borgoña: `#6B1E24` (3% - elementos devocionales)
- Índigo Profundo: `#2E356D` (2% - detalles secundarios)

### Tipografías
- **Display**: Playfair Display (títulos, eslogan)
- **Body**: Inter (texto base, botones)

### Tokens
Configurados en `tailwind.config.js` según `docs/design-tokens.json`

## 📦 Tech Stack

**Frontend:**
- React 18.3 + TypeScript 5.6
- Vite 6.0
- React Router 6
- Tailwind CSS 3.4
- Lucide React (iconos SVG)

**Backend:**
- Supabase (PostgreSQL + Edge Functions)
- Deno (Edge Functions runtime)

**Pagos:**
- Stripe Payment Intents API
- @stripe/stripe-js

## 🌍 i18n (Internacionalización)

Sistema bilingüe completo:
- Español (ES) - idioma por defecto
- Inglés (EN)
- Selector en navigation bar
- Traducciones en `src/lib/i18n.ts`

## 📝 Páginas

1. **Home** (`/`): Hero + Featured Works + Especialidades
2. **About** (`/about`): Biografía + Proceso Creativo + Galería Personal
3. **Portfolio** (`/portfolio`): Galería Masonry + Filtros + Lightbox
4. **Appointments** (`/appointments`): Formulario + Calendario + Políticas
5. **Shop** (`/shop`): Productos + Filtros + Stripe Checkout
6. **Contact** (`/contact`): Formulario + Info + Mapa + Redes Sociales

## 🔑 Variables de entorno (placeholders)

Las siguientes variables de entorno deben configurarse para el correcto funcionamiento de la aplicación. Reemplaza los valores placeholder con tus credenciales reales.

### Configuración de Stripe
- **STRIPE_SECRET_KEY**: Clave secreta para procesamiento de pagos
  - *Uso*: Procesamiento de pagos en Edge Functions
  - *Formato*: `sk_test_...` (test) / `sk_live_...` (producción)
  - *Placeholder*: `<<STRIPE_SECRET_KEY>>`

- **STRIPE_PUBLISHABLE_KEY**: Clave pública para frontend
  - *Uso*: Inicialización de Stripe en el frontend
  - *Formato*: `pk_test_...` (test) / `pk_live_...` (producción)
  - *Placeholder*: `<<STRIPE_PUBLISHABLE_KEY>>`

### Configuración de Supabase
- **SUPABASE_URL**: URL del proyecto Supabase
  - *Uso*: Conexión a la base de datos y servicios
  - *Formato*: `https://[project-id].supabase.co`
  - *Placeholder*: `<<SUPABASE_URL>>`

- **SUPABASE_ANON_KEY**: Clave pública de Supabase
  - *Uso*: Autenticación y acceso a tablas públicas
  - *Formato*: Clave pública JWT de 40+ caracteres
  - *Placeholder*: `<<SUPABASE_ANON_KEY>>`

- **SUPABASE_SERVICE_ROLE_KEY**: Clave de servicio de Supabase
  - *Uso*: Acceso administrativo completo en Edge Functions
  - *Formato*: Clave de servicio JWT de 40+ caracteres
  - *Placeholder*: `<<SUPABASE_SERVICE_ROLE_KEY>>`

### Configuración de Autenticación
- **AUTH_SECRET**: Secreto para tokens JWT
  - *Uso*: Firmado de tokens de autenticación
  - *Formato*: String aleatorio de al menos 32 caracteres
  - *Placeholder*: `<<AUTH_SECRET>>`

### Configuración de Administración
- **ADMIN_ALLOWED_EMAILS**: Emails autorizados para panel admin
  - *Uso*: Control de acceso al panel administrativo
  - *Formato*: Lista separada por comas de emails válidos
  - *Placeholder*: `<<ADMIN_ALLOWED_EMAILS>>`

## 🔐 Seguridad

- Row Level Security (RLS) activado en todas las tablas
- Políticas públicas solo para lectura (`SELECT`)
- Inserciones permitidas para `anon` y `service_role`
- API keys nunca expuestas en frontend (Edge Functions)

## 📱 Responsive Breakpoints

- XS: 0px (Mobile small)
- SM: 640px (Mobile large)
- MD: 768px (Tablet)
- LG: 1024px (Desktop small)
- XL: 1280px (Desktop standard)
- 2XL: 1536px (Desktop large)

## 🐛 Troubleshooting

Ver sección completa en `DEPLOYMENT_GUIDE.md`

Errores comunes:
- **RLS policy violation**: Verificar políticas incluyen `'anon'` role
- **Stripe payment fails**: Verificar `STRIPE_SECRET_KEY` en Edge Function secrets
- **Images not loading**: Verificar rutas `/images/...` en `public/images/`

## 📄 Documentación

- `DEPLOYMENT_GUIDE.md`: Guía completa de deployment
- `backend-architecture.md`: Arquitectura del backend
- `docs/design-specification.md`: Especificación de diseño completa (611 líneas)
- `docs/content-structure-plan.md`: Plan de estructura de contenido (172 líneas)
- `docs/design-tokens.json`: Tokens de diseño (formato W3C)
- `docs/guia-proyecto-final-ciclo.md`: Guía para el proyecto final del ciclo (1,146 líneas)

## 🎯 Roadmap

- [ ] Integración Google Calendar para citas
- [ ] Sistema de autenticación de usuarios
- [ ] Dashboard admin para gestionar citas/productos
- [ ] Notificaciones por email (SendGrid/Resend)
- [ ] Blog de cuidado post-tatuaje
- [ ] Galería de reviews/testimonios

## 📞 Contacto

- **Instagram**: [@asunaah](https://instagram.com/asunaah)
- **WhatsApp**: +34  605 239 673
- **Email**: inkandsoultatoo@gmail.com
- **Ubicación**: Granada, España

## 📜 Licencia

© 2025 Ink & Soul by Asunaah. Todos los derechos reservados.

---

**Versión**: 1.0  
**Fecha**: 2025-10-31  
**Autor**: Hawaiiiiii (Erik)
**Stack**: React + TypeScript + Supabase + Stripe
