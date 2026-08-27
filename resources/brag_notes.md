
# External-Facing Resume Bullets

_Format: **accomplished [X], measured by [Z], by doing [Y]**. Documented figures used as-is; `[est. ~N]` = educated estimate; `X` = a number only you can supply. Internal system/codenames genericized; standard tech kept for keyword value._

---

## CK Money — Bank-Account Fraud Validation (2022)

- Cut a **$2.2M+ external-account funding-fraud vector** — the source of 69% of all negative-balance accounts and 79% of negative-balance dollars — by building, from scratch, a typed Scala client library integrating a third-party bank-account risk-analysis API to verify account ownership and standing before a link is trusted.
- Delivered an identity-match verification feature end-to-end across the full stack (Scala/Thrift backend, GraphQL resolver + schema, React admin UI), reducing fraudulent linked-account approvals by **[est. ~X]%** and giving fraud analysts a real-time ownership signal in-console.
- Built the fraud-analytics data pipeline that persists every risk-analysis request to a data lake and BigQuery via new Kafka producers with HMAC-hashed account numbers, enabling fraud modeling to optimize the unit economics of paid verification across **[est. ~X]K checks/month**.

## CK Money — Money Movement Service Migration (2022)

- Migrated merchant-funded cashback payouts (**~75K transactions/week at a ~6% reward rate**) off a legacy funding platform onto a new money-movement service using a dark-deploy/parallel-run design with a shared MySQL state table, achieving zero reporting drift by keeping the legacy analytics source-of-truth consistent throughout the ramp.
- Prevented double-payment of member funds by designing an FMEA-driven retryable/non-retryable/alert-human error taxonomy for partner, database, and gateway failures, reducing money-movement error escalations to **[est. ~X]** and treating every ambiguous state as human-alert.
- Enabled a controlled, reversible cutover by wiring the payout flow into the rewards service behind an A/B experiment and runtime toggle, ramping traffic from 0% to 100% with **zero payout incidents**.

## CK Money — Feature-Eligibility / Decision-Gating Platform (2022–2024)

- Co-built, from greenfield, the money-platform control that gates member access to **every product feature**, replacing fragile per-feature eligibility implementations with a single generic decision service and cutting new-gate delivery time from **[est. ~weeks]** to **[est. ~days]**.
- Owned the persistence and correctness core — transactional MySQL with `SELECT … FOR UPDATE`, a designed decision-state matrix, sticky/cacheable semantics, and three-tier graceful degradation (live decision → cached value → per-gate default) — keeping the platform available through downstream outages at **[est. ~99.9]% availability**.
- Scaled the eligibility-change streaming pipeline to **~1,600 messages/sec** with backoff, parallel consumption, and watchdog timers, and cut service memory footprint to **~1/5** by removing an unnecessary process manager.
- Authored the risk-decision logging design giving support, fraud, and engineering full visibility into every decision (including previously invisible cached and fallback decisions) via a fault-tolerant, PII-safe, fire-and-forget async pipeline that never blocks the request path.
- Drove the migration of all callers off the deprecated predecessor via dark-deploy comparison and cutover, then deleted the dead component once traffic hit zero — retiring **[est. ~X] KLOC** of legacy code.

## CK Money — In-House Refund-Advance Underwriting Service (2024)

- Designed and stood up a **Tier-1 (highest-criticality) service from scratch** that brought seasonal refund-advance underwriting in-house, hitting **99% availability and sub-100ms p95** SLAs through peak tax season via a progressive slow-rollout deploy.
- Co-authored the technical design for a voice-based debt-status capability and made the key architecture call to route programmatic Twilio calls through a stateless gateway passthrough rather than a standalone service — preserving clean service boundaries while integrating a federal debt system reachable only via automated phone (DTMF).
- Built a **Levenshtein-distance transcription parser** to reliably detect the "no delinquent debt" case with **[est. ~X]% accuracy** despite having no ground-truth negative-case transcriptions available.
- Designed an envelope-encrypted, **1024-way sharded MySQL** data model for PII and a Kafka-backed transcription pipeline with jittered backoff, plus an hourly cron enforcing a security requirement to purge third-party call records older than one week via cascading, region-aware deletion.

## CK Money — Partner-Mocking Test Platform (2021–2024)

- Built and owned a shared test-environment mocking platform that intercepts gateway traffic to **three third-party banking/payment partners** and returns canned responses, unblocking end-to-end QA for the **entire money product graph** (spend/save/card, credit-builder) without touching live banking partners.
- Authored a reusable Scala client library (a service framework filter) adopted across **[est. ~4]** gateway services, plus a decoupled JSON-fixture module, curated **~70 test-user fixtures** covering funded/locked/closed/denied account states, and shipped a CLI plugin and CI auto-deploy pipeline.
- Drove org-wide adoption by authoring a hands-on getting-started tutorial and co-presenting a working session to the QE org, making the platform the standard testability tool for the domain.

## CK Money — Banking Partner Gateway & File Ingest (2021–2023)

- Prevented silent parse failures in a banking-partner data-ingest pipeline by hardening fixed-width file validation (enforced PGP `.txt.pgp` extension checks, case-insensitivity, updated filename regexes after partner format changes).
- Improved gateway reliability and observability with a custom stats filter isolating DNS-resolution failures from a blanket-500 metric, a UDP→HTTP metrics migration, and auth-scope fixes that re-enabled a broken account-lookup API.
- Eliminated a compliance-risk hardcoded savings APY (and the recurring monthly manual maintenance step behind it) by sourcing the rate from the banking partner.

## CK Money — Platform Migrations & Reliability (2021–2025)

- Led recurring cross-service hardening — multi-round Log4j remediation, framework major-version upgrades, HSM→crypto-service and Vault→cloud-secret-manager migrations, and build-image migrations — across **10** production services.
- Cut over-provisioned memory across a banking domain service by right-sizing pod RAM to JVM-max + 500Mi, reducing memory requests by **2 GB%** while adding maintenance-mode instrumentation.
- Averted a Tier-1 reliability regression by diagnosing JVM old-gen heap exhaustion (via heap dumps and GC tuning) introduced by a framework upgrade, then making the judgment call to safely revert rather than ship risk to a critical service.

## GenAI — Financial Assistant Tool Suite (2023)

- Built the core tool suite exposing member spending data (spend projection, potential-savings, categorized spend, largest transactions, cash-flow) to a consumer-facing financial GenAI assistant, turning generic LLM responses into personalized, member-context-aware guidance.
- Reduced per-call LLM cost by folding eligibility checks directly into tools to **save one LLM round-trip per call** (material given per-token billing and a ~10× cost step between model tiers), saving an estimated **$[X]/month** in inference spend.
- Improved brittle LLM tool-selection accuracy from **[est. ~X]% to [est. ~X]%** through prompt-engineering of tool names/descriptions and a guided-experience evaluation-test matrix that surfaces selection bugs in CI.
- Hardened tool input validation to return per-tool natural-language errors the LLM can act on, and led a dollars→cents data migration across tools and visualizations (eliminating float-precision defects), each shipped behind experiment flags.

## Account-Linking Platform — GraphQL Ownership Migration (2025)

- Authored the technical design and led migration of a core account-linking GraphQL surface between teams, unlocking end-to-end platform ownership of an engagement flow projected to **raise a key monetization metric by 10–12%**.
- Made the architecture call to build the new surface as a member-zone component inside an existing federated GraphQL service rather than a standalone service, **avoiding an added network hop** and staying in target-state.
- Delivered a backwards-compatible, experiment-ramped migration (1% → 25% → 50% → 100%) at a **95%-under-1000ms latency, 99% availability** SLA, and managed a production incident cleanly by reverting a misconfigured mutation and rolling forward with a corrected retry.
- Redesigned an onboarding data model wired into **12+ products, 21 config sites, and 16 template surfaces**, replacing an ambiguous shared fact with two cleanly-owned events published for downstream consumption.

## Backend Framework — Multi-Language Code Generation (2025–2026)

- Led code-generation for an interface-definition language so a **single contract file generates clients in five targets — Java 21, Scala, TypeScript, Rust, and Protobuf** — establishing one authoritative cross-runtime source of truth for both JVM and Node service runtimes.
- Authored the Java-21 client design and drove it end-to-end via a **~14-PR stack** (records for structs, sealed interfaces for unions, functional interfaces by arity, nested clients), validated against a working reference repo, and unified codegen on a single protobuf target.
- Delivered core type-system support (enums, maps, composable de/serialization, byte arrays, aliased-import converters) and fixed **[est. ~X]** codegen correctness bugs, separating language namespaces to prevent cross-target collisions.

## Backend Framework — Cross-Runtime Config System (2025–2026)

- Authored the framework-configuration design (approved by framework leadership) unifying config resolution across JVM and Node runtimes into a single schema-enforced layer with self-documenting defaults, YAML standardization, and build-time validation — replacing fragmented, poorly-documented per-runtime config.
- Designed and implemented default-values support end-to-end (lexer/parser, resolved-AST expression model, codegen across all five language targets), then drove adoption by migrating the HTTP client and all remaining capabilities onto it, removing verbose boilerplate across the codebase.

## Backend Framework — Caching & Streaming Capabilities (2025–2026)

- Drove technical due-diligence for the framework caching layer by evaluating **seven memcached clients across four languages** against a tiered compatibility checklist, landing a pragmatic recommendation to reuse a battle-tested client and **avoiding a catastrophic full cache-miss migration**.
- Built the memcached capability serving **~18 consuming services**, including a migration utility that handled a key-hashing-algorithm difference for **zero cache-busting downtime** during rollout.
- Built streaming capabilities — migrated a Kafka consumer onto the new IDL and added a cloud Pub/Sub publisher in Rust emitting messages **byte-for-byte compatible** with the existing JVM codec — and split the HTTP transport into its own crate to break a dependency cycle.

## Backend Framework — TypeScript MySQL Transactions & Hardening (2023–2026)

- Shipped a database-transaction feature for the Node runtime that had **stalled on the framework team for months**, adding transactional execution with rollback-on-exception, retries + metrics on connection acquisition, and transaction isolation levels to reach parity with the JVM runtime.
- Eliminated a **silent message-loss race condition** in async Kafka processing where promises buffered during an await could be discarded unawaited, and introduced a pluggable processing-strategy interface.
- Contributed to release-process reform (trunk-based, customized-SemVer cadence) that addressed a state of only **3 minor releases in 7 months despite daily commits**, and remediated Snyk vulnerabilities (Log4j 1.x, jackson-databind) framework-wide.

## Backend Framework — Production Incident Root-Cause (2026)

- Diagnosed a subtle framework bug behind a **member-facing, multi-service production incident** spanning the money dashboard, GraphQL services, and a banking domain service across three recurrences — a ~1% error-rate dilution across 100–120 pods that was **invisible to standard p95 alerts**.
- Traced the root cause to a Kafka-producer bug writing **two credential files per message**; on pod termination, cleanup deleted **~2.5 million small files**, starving co-located pods of disk I/O (a noisy-neighbor cascade) compounded by an unbounded DB waiter queue.
- Drove the systemic framework-level fix — a safe bounded default for the DB waiter queue plus new I/O and DB-waiter dashboard metrics — validated when a similar event days later **self-recovered**.

## Observability — Fraud & Framework Monitoring (2021–2026)

- Built the observability foundation for the fraud-decision stack (dashboards, alerts, dependency pages, client-metric heroboards) and stood up a new observability repository, leading a full metrics-platform migration lifecycle (enable → deprecate → delete legacy → update runbooks).
- Shipped framework-wide **inode-count and inode-growth-rate alerts** across four framework services to catch the file-accumulation failure mode behind a prior incident before exhaustion, with PagerDuty routing and runbook URLs.
- Modernized banking observability at scale by remediating a deprecated metrics function across shared modules and multiple services **in a single sweep** and building availability/uptime dashboards for account-creation and money-movement flows.

## Platform / Developer Experience (2022)

- Built a standalone test-environment microservice bridging the local-dev CLI to internal identity/vault services over Thrift after a REST deprecation broke test-user creation, restoring the ability for **1k engineers** to set up test users without direct Thrift plumbing.
- Owned the full service lifecycle from scaffolding to CI, integrated it into the CLI's test-user login flow, and migrated the CLI's remote networking to a next-gen service mesh.

## Security, Auth & Crypto (2021–2025)

- Owned crypto-key migrations off legacy HSM onto a managed crypto service as part of a fleet-wide effort of **50+ keys carrying millions of production crypto calls/year**, with zero customer-facing disruption.
- Led compromised-secret rotation across a member-messaging service (auth, HSM, Okta, DB, Salesforce, and partner credentials) through a tricky multi-region migration, debugging production-affecting failures via log analysis — including a subtle **trailing-newline bug** that broke partner credentials.

## Hackathons & Self-Driven (2024–2025)

- Won **1st Place + the Leadership Award** at a company-wide engineering hackathon (2024) with a tool using **semantic embeddings and LLAMA3** to analyze voice-call transcriptions supporting refund-advance underwriting.
- Built an AI documentation-auto-update Slackbot (OpenAI + GitHub Enterprise Octokit + Google Docs APIs) that reads a Slack thread, identifies the stale doc, and opens a PR or edits the doc directly — **adopted by teams immediately** after the hackathon despite not placing.
- Wrote reusable horizontal automation scripts (infra-config conversion, network-policy duplication) that eliminated error-prone manual toil for colleagues across teams (peer feedback: _"your script saved my life — my PR has 57 files updated"_).

---

# Top 10 Strongest Bullets

_Selected for quantified business impact + clear individual ownership + scope._

1. **Cut a $2.2M+ external-account funding-fraud vector** — source of 69% of negative-balance accounts and 79% of negative-balance dollars — by building from scratch a typed client library integrating a third-party bank-account risk-analysis API. _(CK Money — Fraud Validation)_
2. **Migrated ~75K cashback transactions/week** off a legacy platform via a dark-deploy/parallel-run design with a shared state table, achieving zero reporting drift and zero payout incidents. _(Money Movement Service)_
3. **Designed and stood up a Tier-1 service from scratch** that brought seasonal refund-advance underwriting in-house, hitting 99% availability and sub-100ms p95 through peak season. _(Refund-Advance Service)_
4. **Led a GraphQL ownership migration** unlocking an engagement flow projected to **raise a key monetization metric 10–12%**, ramped 1%→100% at a 99%-availability SLA. _(Account-Linking Platform)_
5. **Led multi-language code generation from a single contract file into 5 targets** (Java 21, Scala, TypeScript, Rust, Protobuf), establishing one cross-runtime source of truth for JVM and Node. _(Backend Framework — Codegen)_
6. **Diagnosed a member-facing production incident invisible to p95 alerts**, tracing a ~1% error dilution to a bug that deleted ~2.5M files and starved pods of disk I/O, then drove the systemic framework fix. _(Framework Incident RCA)_
7. **Co-built the greenfield decision-gating platform that gates access to every money feature**, with three-tier graceful degradation and a ~1,600 msg/sec eligibility-change pipeline. _(Feature-Eligibility Platform)_
8. **Built a partner-mocking test platform** intercepting traffic to three banking partners, unblocking end-to-end QA for the entire money product graph without touching live partners. _(Partner-Mocking Platform)_
9. **Prevented double-payment of member funds** by designing an FMEA-driven retryable/non-retryable/alert-human error taxonomy treating every ambiguous state as human-alert. _(Money Movement Service)_
10. **Won 1st Place + the Leadership Award** at a company-wide engineering hackathon using semantic embeddings + LLAMA3 to support refund-advance underwriting. _(Hackathon)_

---

## Placeholders to fill before sending

- **`X` (bare):** needs a real number or should be cut. Highest-value: fraud-reduction %, GenAI cost savings $/month + tool-selection accuracy before→after, transcription-parser accuracy %.
- **`[est. ~N]`:** defensible estimates — keep or adjust to taste.
- **Integrity note:** the 10–12% monetization figure is a *projection*, not a realized result — the word "projected" is kept deliberately.