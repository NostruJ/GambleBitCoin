# ­ƒÄ▓ Streaming Prediction Market

Una aplicaci├│n real-time de mercado de predicci├│n de criptomonedas construida con Node.js, Socket.IO, Redis e integraci├│n de Binance API. Los usuarios predicen movimientos de precios (UP, DOWN, o HOLD) en rondas de 20 segundos y compiten en un leaderboard.

## ­ƒÄ« ┬┐C├│mo Funciona el Juego?

### Flujo de Juego

#### 1´©ÅÔâú **Login**
```
Usuario entra a http://localhost:3000
    Ôåô
Ingresa nombre de usuario (├║nico y persistente)
    Ôåô
Selecciona mercado (ETHUSDT, SOLUSDT, o BNBUSDT)
    Ôåô
Presiona "Join Room"
    Ôåô
Ô£à Usuario conectado con 2000 cr├®ditos iniciales
```

#### 2´©ÅÔâú **Ronda (20 segundos)**

```
ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ
Ôöé RONDA EN VIVO - 20 segundos                              Ôöé
Ôö£ÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöñ
Ôöé                                                           Ôöé
Ôöé 20-15s: Ronda abierta - PUEDES APOSTAR                  Ôöé
Ôöé         Precio: $3,245.50                                Ôöé
Ôöé         Timer: 20s ÔåÉ Normal (verde)                      Ôöé
Ôöé                                                           Ôöé
Ôöé         [UP 50 cr├®ditos] [DOWN 50] [HOLD 50]            Ôöé
Ôöé         ÔåÆ Apuesta aceptada Ô£ô                             Ôöé
Ôöé                                                           Ôöé
Ôöé 14-11s: Ronda abierta - Esperando final                 Ôöé
Ôöé         Timer: 14s ÔåÉ Normal                              Ôöé
Ôöé                                                           Ôöé
Ôöé 10-6s:  Ronda abierta - Timer AMARILLO                  Ôöé
Ôöé         Timer: 10s ÔåÉ Amarillo (ÔÜá´©Å apres├║rate)            Ôöé
Ôöé                                                           Ôöé
Ôöé 5-0s:   BLOQUEO DE APUESTAS - Rojo                      Ôöé
Ôöé         Timer: 5s ÔåÉ ROJO (­ƒö┤ no puedes apostar)         Ôöé
Ôöé         Botones deshabilitados                           Ôöé
Ôöé         "Bet lock active (last 5s)"                      Ôöé
Ôöé                                                           Ôöé
Ôöé 0s:     RONDA TERMINA                                    Ôöé
Ôöé         Precio final: $3,248.75                          Ôöé
Ôöé         Resultado: UP Ô£ô                                  Ôöé
Ôöé                                                           Ôöé
ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ
```

### ­ƒôè Opciones de Apuesta

| Opci├│n | Descripci├│n | Gana Cuando |
|--------|-------------|-------------|
| **UP** ­ƒôê | Precio sube | `Precio Final > Precio Inicial` |
| **DOWN** ­ƒôë | Precio baja | `Precio Final < Precio Inicial` |
| **HOLD** ÔÅ©´©Å | Precio se mantiene | `Precio Final = Precio Inicial` (┬▒tick size) |

### ­ƒÆ░ Sistema de Payouts

```
Apuesta: 50 cr├®ditos
Ganadoras por opci├│n: 10 usuarios

Payout base para ganadores:
ÔööÔöÇ 50 ├ù 2 = 100 cr├®ditos

Bonus por velocidad (top 2):
Ôö£ÔöÇ 1´©ÅÔâú Primero en apostar: 100 ├ù 1.08 = 108 cr├®ditos (+8%)
Ôö£ÔöÇ 2´©ÅÔâú Segundo en apostar:  100 ├ù 1.06 = 106 cr├®ditos (+6%)
ÔööÔöÇ 3´©ÅÔâú+ Resto:              100 cr├®ditos (sin bonus)

Perdedores: Pierden los cr├®ditos apostados
Empate (HOLD): Solo ganadores HOLD reciben payout
```

### ­ƒæñ Sistema de Usuarios

```
Primer Login:
ÔööÔöÇ Nombre: "juan" ÔåÆ ID ├║nico persistente
ÔööÔöÇ Balance: 2000 cr├®ditos iniciales
ÔööÔöÇ Guardado en localStorage: pm_user_name = "juan"

Reconexi├│n:
ÔööÔöÇ Nombre pre-rellenado autom├íticamente
ÔööÔöÇ Recupera su balance anterior (sesi├│n persistente)
ÔööÔöÇ UUID fue reemplazado por nombre como identificador

Bloqueo de Usuario:
ÔööÔöÇ Balance Ôëñ 0 ÔåÆ Usuario bloqueado
ÔööÔöÇ Mensaje: "Has perdido por completo. No puedes seguir apostando."
ÔööÔöÇ Botones de apuesta deshabilitados
```

### ­ƒôê Gr├ífico en Tiempo Real

```
Caracter├¡sticas:
Ôö£ÔöÇ Actualizaci├│n: Cada 5 segundos
Ôö£ÔöÇ Puntos almacenados: 120 (10 minutos de datos)
Ôö£ÔöÇ Colores din├ímicos:
Ôöé  Ôö£ÔöÇ Verde ­ƒƒó: Precio subiendo
Ôöé  Ôö£ÔöÇ Rojo ­ƒö┤: Precio bajando
Ôöé  ÔööÔöÇ Amarillo ­ƒƒí: Precio estable
Ôö£ÔöÇ Interpolaci├│n suave (Bezier curves)
ÔööÔöÇ Responsive: Se adapta a cualquier tama├▒o de pantalla
```

### ­ƒÆ¼ Chat en Vivo

```
Caracter├¡sticas:
Ôö£ÔöÇ Auto-scroll: Se queda al final autom├íticamente
Ôö£ÔöÇ Scroll manual: Muestra bot├│n "Latest" para volver al final
Ôö£ÔöÇ Mensajes instant├íneos: Socket.IO en tiempo real
Ôö£ÔöÇ Eventos del sistema: Mostramos "usuario X se uni├│"
ÔööÔöÇ Historial: ├Ültimos 100 mensajes
```

### ­ƒÅå Leaderboard (Sala)

```
TOP 10 POR SALA:
#1  john        - $5,234.50
#2  maria       - $4,892.00
#3  pedro       - $3,456.75
#4  ana         - $2,100.00
...
```

## ­ƒÜÇ Quick Start

### Prerequisitos
- **Node.js** 16+
- **Redis** corriendo en `localhost:6379`
- **Kafka** (opcional) en `localhost:9092`
- **Python** 3.13 (para Binance stream)

### Instalaci├│n

```bash
# Clonar repositorio
git clone https://github.com/Hollowlightmouse/GambleBitCoin.git
cd GambleBitCoin

# Instalar dependencias
npm install

# Configurar .env
cp .env.example .env
# Editar .env con credenciales de Binance
```

### Variables de Entorno (`.env`)

```env
# Puerto
PORT=3000

# Redis
REDIS_URL=redis://localhost:6379

# Kafka (opcional)
KAFKA_BROKERS=localhost:9092

# Binance API
BINANCE_API_KEY=your_api_key
BINANCE_API_SECRET=your_api_secret
USE_PY_BINANCE=true

# Configuraci├│n del Juego
ROUND_SECONDS=20          # Duraci├│n de ronda en segundos
LOCK_SECONDS=5            # ├Ültimos 5 segundos bloqueados
INITIAL_BALANCE=2000      # Saldo inicial
BET_MIN=10                # Apuesta m├¡nima
BET_MAX=300               # Apuesta m├íxima
ROUND_HISTORY_LIMIT=100   # Historial guardado

# Chat
CHAT_LIMIT=100            # ├Ültimos 100 mensajes

# Caracter├¡sticas
ENABLE_PRICE_FALLBACK=true   # Generador sint├®tico si Binance falla
KAFKA_ENABLED=true            # Auditor├¡a de eventos
```

### Iniciar

```bash
npm start
```

El navegador se abrir├í autom├íticamente en `http://localhost:3000`

## ­ƒÅù´©Å Arquitectura del Sistema

```
CLIENT (Browser)
    Ôåô Socket.IO
    Ôö£ÔöÇ join_user { name }
    Ôö£ÔöÇ join_market { symbol }
    Ôö£ÔöÇ place_bet { side, amount }
    ÔööÔöÇ send_chat_message { text }
    Ôåæ
    Ôö£ÔöÇ user_joined { user }
    Ôö£ÔöÇ market_joined { symbol, user, round, chat }
    Ôö£ÔöÇ price_tick { price }
    Ôö£ÔöÇ round_started / round_timer / round_locked / round_ended
    Ôö£ÔöÇ leaderboard_updated
    Ôö£ÔöÇ chat_message / user_action
    ÔööÔöÇ bet_accepted / bet_rejected / user_blocked

SERVER (Node.js)
    Ôö£ÔöÇ Socket Handlers
    Ôöé  Ôö£ÔöÇ join_user ÔåÆ UserService.findOrCreateUser(name)
    Ôöé  Ôö£ÔöÇ join_market ÔåÆ MarketService.getState(symbol)
    Ôöé  Ôö£ÔöÇ place_bet ÔåÆ BetService.placeBet()
    Ôöé  ÔööÔöÇ send_chat_message ÔåÆ ChatService.postMessage()
    Ôöé
    Ôö£ÔöÇ Market Service (Round Loop - cada 1s)
    Ôöé  Ôö£ÔöÇ openRound() ÔåÆ Genera nueva ronda
    Ôöé  Ôö£ÔöÇ onPriceTick() ÔåÆ Actualiza precio actual
    Ôöé  ÔööÔöÇ settleRound() ÔåÆ Calcula ganadores + payouts
    Ôöé
    Ôö£ÔöÇ Streams
    Ôöé  Ôö£ÔöÇ Python Binance ÔåÆ Precios reales (WebSocket)
    Ôöé  ÔööÔöÇ Fallback Generator ÔåÆ Si Binance Ôëñ12s sin datos
    Ôöé
    ÔööÔöÇ Redis Repository
       Ôö£ÔöÇ user:{name} ÔåÆ { id, name, balance, blocked }
       Ôö£ÔöÇ round:{symbol}:current ÔåÆ { id, startPrice, endPrice, result }
       Ôö£ÔöÇ round:{roundId}:{symbol}:bets ÔåÆ { userId: Bet }
       Ôö£ÔöÇ chat:{symbol}:messages ÔåÆ [ChatMessage]
       ÔööÔöÇ leaderboard:{symbol} ÔåÆ Sorted Set por balance
```

## ­ƒöî API y Socket Events

### Socket.IO - Cliente ÔåÆ Servidor

```javascript
// Login
socket.emit("join_user", { name: "juan" });

// Entrar a mercado
socket.emit("join_market", { symbol: "ETHUSDT" });

// Apostar
socket.emit("place_bet", { symbol: "ETHUSDT", side: "up", amount: 50 });

// Chat
socket.emit("send_chat_message", { symbol: "ETHUSDT", text: "┬íVamos!" });
```

### Socket.IO - Servidor ÔåÆ Cliente

```javascript
// Usuario conectado
socket.on("user_joined", ({ user }) => {
  // { id: "juan", name: "juan", balance: 2000, blocked: false }
});

// Mercado conectado (estado inicial)
socket.on("market_joined", ({ symbol, user, round, chat, roomBoard }) => {
  // symbol: "ETHUSDT"
  // user: { id, name, balance, blocked }
  // round: { id, startPrice, endPrice, result, status }
  // chat: [{ id, userName, text, ts }]
  // roomBoard: [{ id, name, score }]
});

// Tick de precio (cada ~500ms)
socket.on("price_tick", ({ symbol, price }) => {
  // price: 3245.50
});

// Ronda iniciada
socket.on("round_started", ({ symbol, round, secondsLeft }) => {
  // round: { id, startPrice, endAt, lockAt }
  // secondsLeft: 20
});

// Timer cada segundo
socket.on("round_timer", ({ symbol, secondsLeft, lock }) => {
  // secondsLeft: 15, lock: false
});

// Apuesta bloqueada
socket.on("round_locked", ({ symbol }) => {
  // Los ├║ltimos 5 segundos
});

// Ronda terminada con payouts
socket.on("round_ended", ({ symbol, round, payouts }) => {
  // round: { id, startPrice, endPrice, result }
  // payouts: [{ userId, userName, betSide, amount, won, payout, balance, bonusMultiplier }]
});

// Leaderboard actualizado
socket.on("leaderboard_updated", ({ symbol, roomBoard }) => {
  // roomBoard: [{ id, name, score }]
});

// Mensaje de chat
socket.on("chat_message", ({ symbol, userName, text, ts }) => {
  // userName: "juan", text: "┬íUP!"
});

// Acci├│n de usuario (sistema)
socket.on("user_action", ({ symbol, message }) => {
  // message: "juan joined ETHUSDT"
});

// Apuesta aceptada
socket.on("bet_accepted", ({ balance, blocked }) => {
  // balance: 1950 (despu├®s de apostar 50)
});

// Apuesta rechazada
socket.on("bet_rejected", ({ message }) => {
  // message: "Round is not open"
});

// Usuario bloqueado (balance Ôëñ 0)
socket.on("user_blocked", ({ message, balance }) => {
  // message: "Has perdido por completo..."
  // balance: 0
});

// Error general
socket.on("error_message", ({ message }) => {
  // message: error description
});
```

## ­ƒÆ¥ Almacenamiento de Datos

### Redis

```
user:{name}
  ÔööÔöÇ { id, name, balance, blocked, createdAt }
  
username:{name} ÔåÆ {id}
  ÔööÔöÇ ├ìndice para b├║squedas r├ípidas por nombre

round:{symbol}:current
  ÔööÔöÇ { id, symbol, startPrice, endPrice, result, status, startAt, endAt, lockAt, locked }

round:{symbol}:history
  ÔööÔöÇ [{ id, symbol, startPrice, endPrice, result, closedAt, bets }]

round:{roundId}:{symbol}:bets
  ÔööÔöÇ { userId: { id, roundId, symbol, userId, userName, side, amount, timestamp } }

round:{roundId}:{symbol}:speed:{side}
  ÔööÔöÇ Sorted Set para bonus de velocidad (timestamp ÔåÆ userId)

chat:{symbol}:messages
  ÔööÔöÇ [{ id, symbol, userName, text, ts }]

leaderboard:{symbol}
  ÔööÔöÇ Sorted Set { balance: "userId|userName" }
```

### Kafka (Auditor├¡a)

```
market.prices.raw
  ÔööÔöÇ { symbol, price, ts, source }

market.bets.events
  ÔööÔöÇ { type, symbol, roundId, userId, userName, side, amount, balance, ts }

market.round.events
  ÔööÔöÇ { type, symbol, roundId, startPrice, endPrice, result, ts }
```

## ­ƒô▒ Dise├▒o Responsive

```
Breakpoints y comportamiento:

Desktop (1200px+)
Ôö£ÔöÇ Layout: 2 columnas (1.25fr 1fr)
Ôö£ÔöÇ Izquierda: Precio, Timer, Round, Leaderboard
ÔööÔöÇ Derecha: Chat, Panel de Apuestas

Tablet (800-1200px)
Ôö£ÔöÇ Layout: 1 columna
Ôö£ÔöÇ Todos los elementos apilados verticalmente
ÔööÔöÇ Fuentes escaladas con clamp()

Mobile (480-800px)
Ôö£ÔöÇ Layout: Ultra-compacto
Ôö£ÔöÇ Gr├ífico reducido
Ôö£ÔöÇ Chat y botones optimizados
ÔööÔöÇ Precio y timer reducidos

M├│vil peque├▒o (<480px)
Ôö£ÔöÇ M├¡nimo espacio utilizado
Ôö£ÔöÇ Fuentes m├¡nimas legibles
Ôö£ÔöÇ Botones tocables
ÔööÔöÇ Todo funciona sin horizontal scroll
```

### Unidades Responsivas

```css
/* Tama├▒os que escalan autom├íticamente */
font-size: clamp(12px, 2vw, 16px);      /* Escala con viewport */
padding: clamp(8px, 2vw, 12px);         /* Espacios din├ímicos */
gap: clamp(6px, 1.5vw, 10px);          /* Brechas fluidas */
max-height: clamp(120px, 25vh, 180px); /* Altura relativa */
```

## ­ƒöä Flujo Completo de una Ronda

```
1. INICIO (t=0)
   Ôö£ÔöÇ marketService.openRound(symbol)
   Ôö£ÔöÇ Round.startPrice = precio actual
   Ôö£ÔöÇ Emite: "round_started"
   ÔööÔöÇ Estado: "open"

2. APUESTAS ABIERTAS (t=0-14s)
   Ôö£ÔöÇ Usuarios pueden apostar
   Ôö£ÔöÇ betService.placeBet() guarda bets
   Ôö£ÔöÇ Socket emite: "user_action"
   ÔööÔöÇ Precio se actualiza: "price_tick"

3. TIMER AMARILLO (t=10-14s)
   Ôö£ÔöÇ Emite: "round_timer" con lock=false
   Ôö£ÔöÇ UI cambia timer a amarillo
   ÔööÔöÇ Usuarios ven que quedan pocos segundos

4. BLOQUEO (t=15s exactamente)
   Ôö£ÔöÇ Emite: "round_locked"
   Ôö£ÔöÇ UI: Timer rojo, botones deshabilitados
   Ôö£ÔöÇ Mensaje: "Bet lock active (last 5s)"
   ÔööÔöÇ No se aceptan m├ís apuestas

5. TERMINO (t=20s)
   Ôö£ÔöÇ marketService.settleRound(symbol)
   Ôö£ÔöÇ Round.endPrice = precio final
   Ôö£ÔöÇ Round.result = determineResult(start, end)
   Ôö£ÔöÇ Calcula ganadores y payouts
   Ôö£ÔöÇ Actualiza balances en Redis
   Ôö£ÔöÇ Actualiza leaderboards
   Ôö£ÔöÇ Emite: "round_ended" con payouts
   Ôö£ÔöÇ Emite: "leaderboard_updated"
   ÔööÔöÇ Espera 800ms y vuelve a paso 1

Despu├®s de 800ms ÔåÆ Nueva ronda autom├ítica
```

## ­ƒÄ» Cambios Recientes Implementados

### Ô£à Nombre de Usuario ├Ünico
- Eliminamos UUID
- El nombre es el identificador ├║nico
- Sesiones persistentes por nombre
- Pre-llenado autom├ítico en login

### Ô£à Gr├ífico en Tiempo Real
- Actualizaci├│n cada 5 segundos
- 120 puntos almacenados (10 minutos)
- Colores din├ímicos (verde/rojo/amarillo)
- Interpolaci├│n suave
- Posicionado entre Round Details y Leaderboard

### Ô£à Dise├▒o Completamente Responsive
- Funciona en ventanas peque├▒as (50% pantalla)
- M├│vil-friendly desde 320px
- Escalado fluido sin saltos
- Todos los elementos adaptables

### Ô£à Chat Mejorado
- Sin contador de mensajes
- Auto-scroll inteligente
- Bot├│n "Latest" cuando scrolleas arriba
- Env├¡o por Enter o bot├│n

## ­ƒÜÇ Features Principales

Ô£à **Real-time Streaming**: Precios en vivo de Binance  
Ô£à **WebSocket**: Socket.IO para comunicaci├│n bidireccional  
Ô£à **Persistencia**: Usuarios y balance guardados en Redis  
Ô£à **Leaderboard**: Competencia en vivo por sala  
Ô£à **Chat**: Comunicaci├│n instant├ínea  
Ô£à **Gr├ífico**: Visualizaci├│n de precios con Chart.js  
Ô£à **Responsive**: Funciona en cualquier dispositivo  
Ô£à **Kafka**: Auditor├¡a de eventos (opcional)  
Ô£à **Fallback**: Generador de precios si Binance falla  
Ô£à **Auto-login**: Recuperaci├│n de sesi├│n por nombre  

## ­ƒôè Mercados Soportados

- **ETHUSDT** - Ethereum vs USDT
- **SOLUSDT** - Solana vs USDT
- **BNBUSDT** - Binance Coin vs USDT

## ­ƒøá´©Å Desarrollo

### Iniciar con logs
```bash
npm start
# Ver salida en consola
```

### Estructura de carpetas
```
src/
Ôö£ÔöÇÔöÇ config/          # Configuraci├│n
Ôö£ÔöÇÔöÇ models/          # Modelos de datos
Ôö£ÔöÇÔöÇ repositories/    # Acceso a datos (Redis)
Ôö£ÔöÇÔöÇ services/        # L├│gica de negocio
Ôö£ÔöÇÔöÇ controllers/     # Endpoints HTTP
Ôö£ÔöÇÔöÇ sockets/         # Handlers Socket.IO
Ôö£ÔöÇÔöÇ streams/         # Integraci├│n Binance
ÔööÔöÇÔöÇ public/          # Frontend (HTML, CSS, JS)
```

### Logs importantes
```
[app] running on http://localhost:3000
[markets] ETHUSDT, SOLUSDT, BNBUSDT
[stream] python-binance via python
[kafka] mirror producer connected
```

## ­ƒôØ Git Workflow

```bash
# Ver status
git status

# Cambios realizados
git add .

# Commit con mensaje descriptivo
git commit -m "Descripci├│n clara del cambio"

# Subir cambios
git push origin main
```

## ÔÜá´©Å .gitignore Configurado

El repositorio ignora autom├íticamente:
- `node_modules/` - Dependencias
- `.env` - Variables de entorno (credenciales)
- `*.log` - Archivos de log
- `.DS_Store` / `Thumbs.db` - Archivos del sistema
- `README.md` - Documentaci├│n local

## ­ƒôí Streaming Pipeline: Kafka + Flink

> Pipeline de datos en tiempo real que consume precios de Binance, los procesa con l├│gica de ventanas tipo Flink
> y almacena los resultados agregados en Redis para visualizaci├│n.

### Arquitectura del Pipeline

```
ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ    ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ    ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ    ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ
Ôöé  Binance WS  ÔöéÔöÇÔöÇÔöÇÔûÂÔöé  Python Producer ÔöéÔöÇÔöÇÔöÇÔûÂÔöé  Kafka Broker     ÔöéÔöÇÔöÇÔöÇÔûÂÔöé  Flink-Style Job     Ôöé
Ôöé  (Precios)   Ôöé    Ôöé  kafka_producer  Ôöé    Ôöé  binance.trades   Ôöé    Ôöé  (Pure Python)       Ôöé
ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ    ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ    ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ    ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔö¼ÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ
                                                                             Ôöé
                                                                             Ôû╝
ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ    ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ                              ÔöîÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÉ
Ôöé  Streamlit   ÔöéÔùÇÔöÇÔöÇÔöÇÔöé  Redis           ÔöéÔùÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöé  Sink      Ôöé
Ôöé  Dashboard   Ôöé    Ôöé  flink:window:*  Ôöé                              Ôöé  (Redis)   Ôöé
ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ    ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ                              ÔööÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÇÔöÿ
```

### Componentes del Pipeline

#### 1. Productor (Python) ÔåÆ Kafka

`src/streams/binance_py_stream.py` se conecta al WebSocket de Binance usando `python-binance`
y publica cada trade como evento JSON en el t├│pico `binance.trades.raw`:

```json
{"symbol": "ETHUSDT", "price": 3245.50, "qty": 0.5, "ts": 1714420000000}
```

**Credenciales del `.env`:**
- `BINANCE_API_KEY` / `BINANCE_API_SECRET` - Autenticaci├│n Binance
- `BINANCE_TLD` / `BINANCE_WS_TIMEOUT` - Configuraci├│n de conexi├│n
- `KAFKA_BROKERS` - Servidores de Kafka

#### 2. Broker (Kafka)

Kafka recibe los eventos del productor y los distribuye a los consumidores:

- **T├│pico**: `binance.trades.raw`
- **Formato**: JSON
- **Offset**: Latest (solo eventos nuevos)

#### 3. Procesamiento (Flink-Style Pure Python)

`flink_job/flink_streaming_job.py` implementa en Python puro los mismos conceptos de streaming de Apache Flink:

| Concepto | Implementaci├│n |
|---|---|
| **Time Window** | Tumbling event-time windows de 30s (configurable v├¡a `FLINK_WINDOW_SIZE_SEC`) |
| **Watermark** | Bounded Out-of-Orderness de 10s (configurable v├¡a `FLINK_WATERMARK_DELAY_SEC`) |
| **Agregaciones** | `AVG(price)`, `MAX(price)`, `MIN(price)`, `COUNT(*)`, `SUM(qty)` |
| **Runtime** | `python:3.10-slim` (ligero, sin Java/Flink) |

**Clases principales:**

```python
class TradeWindow:
    """Estado de agregaci├│n para una ventana tumbling individual."""
    # Mantiene: prices[], quantities[]
    # Calcula: avg_price, max_price, min_price, trade_count, total_volume

class WatermarkWindowProcessor:
    """Motor de ventanas tumbling con watermarks estilo Flink."""
    # add_trade(symbol, price, qty, event_time_ms)
    # flush_expired_windows() ÔåÆ retorna ventanas cerradas por watermark
```

**L├│gica de ventanas:**

1. Cada trade se asigna a su ventana tumbling seg├║n `event_time_ms // window_size`
2. El watermark se calcula como `max_event_time - watermark_delay`
3. Solo se aceptan trades cuya ventana termine despu├®s del watermark actual
4. Cada intervalo de flush (~10s), se vac├¡an las ventanas expiradas y se escriben a Redis

#### 4. Sink (Redis)

Los resultados de cada ventana se escriben en Redis:

```
Key:    flink:window:ETHUSDT:1714420000000
Fields: symbol, avg_price, max_price, min_price, trade_count, total_volume, window_ts
TTL:    600s (10 minutos)
Index:  flink:window:keys ÔåÆ SET con todas las keys activas
```

#### 5. Dashboard (Streamlit) - BONUS +0.2

`dashboard/app.py` lee los resultados desde Redis y muestra:

- KPIs en tiempo real (total trades, volumen, precio promedio)
- Gr├ífico de precio promedio por s├¡mbolo (Plotly)
- Rango de precios (m├¡nimo-m├íximo) por ventana con fill
- Conteo de trades y volumen por ventana (barras agrupadas)
- Tabla de datos crudos con formato

### Docker Compose Services

| Servicio | Imagen | Funci├│n |
|---|---|---|
| `zookeeper` | confluentinc/cp-zookeeper:7.5.0 | Coordination para Kafka |
| `kafka` | confluentinc/cp-kafka:7.5.0 | Message broker |
| `redis` | redis:7-alpine | Data store |
| `jobmanager` | apache/flink:1.18.1 | Flink UI (puerto 8081) |
| `node-app` | build local | Juego de predicci├│n (puerto 3000) |
| `python-producer` | build local | Binance WS ÔåÆ Kafka |
| `flink-job` | python:3.10-slim | Ventanas tipo Flink ÔåÆ Redis |
| `streamlit` | python:3.13-slim | Dashboard (puerto 8501) |

---

### C├│mo Ejecutar con Docker Compose

> **Todos los servicios se orquestan con un solo comando.**

#### Prerequisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado
- Archivo `.env` configurado en la ra├¡z del proyecto

#### Inicio

```bash
# Levantar todos los servicios
docker-compose up -d

# Ver logs de todos los servicios
docker-compose logs -f

# Ver logs de un servicio espec├¡fico
docker-compose logs -f python-producer
docker-compose logs -f flink-job
docker-compose logs -f streamlit
```

#### Acceder a los Servicios

| Servicio | URL |
|---|---|
| App de Trading | http://localhost:3000 |
| Flink Dashboard | http://localhost:8081 |
| Streamlit Dashboard | http://localhost:8501 |

#### Detener

```bash
# Detener todos los servicios
docker-compose down

# Detener y eliminar vol├║menes
docker-compose down -v
```

---

## ­ƒñØ Soporte

Para problemas o preguntas:
1. Revisar la consola del navegador (F12)
2. Revisar la salida del servidor (terminal)
3. Verificar que todos los servicios de Docker est├®n corriendo: `docker ps`
4. Abrir un issue en GitHub

## ­ƒôä Licencia

MIT

---

**├Ültima actualizaci├│n**: 29/04/2026  
**Versi├│n**: 3.0.0 ÔÇö Streaming pipeline completa (Kafka ÔåÆ Flink-style Python ÔåÆ Redis ÔåÆ Streamlit)
