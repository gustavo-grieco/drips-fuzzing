.PHONY: verify verify-echidna verify-hevm \
	run-echidna run-hevm build-hevm report list

T ?=
ECHIDNA ?= echidna
HEVM ?= hevm

export SOLC_VERSION ?= 0.8.20
export ECHIDNA_HASHCONS ?= 1

# Symbolic properties, as property:contract:config. The harness is test/symbolic/<contract>.t.sol.
# The config is test/symbolic/<config>.yaml for echidna, and the matching HEVM_<config> flags for
# hevm. Each property runs in its own process, one after the other.

# All of them must be verified. Harnesses in test/symbolic/ that are not listed here (the negative
# control, MutantStreamSymAcct, ProveBalConservation*, ProveBalanceAtInFuture) hold properties that
# are expected to fail; they are kept for reference and not run.
VERIFY := \
	prove_split_value_conservation:ProveSplits:verify \
	prove_split_monotonic:ProveSplits:verify-arith \
	prove_split_mutating_conservation:ProveSplits:verify \
	prove_split_view_eq_actual:ProveSplits:verify \
	prove_split_exact_formula:ProveSplitsExtra:verify \
	prove_split_zero:ProveSplitsExtra:verify \
	prove_split_full_weight:ProveSplitsExtra:verify-arith \
	prove_split_multi_conservation:ProveSplitsMulti:verify \
	prove_collectable_after_split:ProveSplitsMutating:verify \
	prove_receiver_got_split:ProveSplitsMutating:verify \
	prove_collect_zeroes:ProveSplitsMutating:verify \
	prove_splittable_additivity:ProveSplitsMutating:verify \
	prove_split_zeroes_splittable:ProveSplitsMutating:verify \
	prove_view_eq_actual_symweight:ProveSplitsMutatingSym:verify \
	prove_splittable_after_symweight:ProveSplitsMutatingSym:verify \
	prove_collectable_after_symweight:ProveSplitsMutatingSym:verify \
	prove_receiver_got_symweight:ProveSplitsMutatingSym:verify \
	prove_collect_zeroes_symweight:ProveSplitsMutatingSym:verify \
	prove_conservation_symweight:ProveSplitsSymbolic:verify-arith \
	prove_exact_symweight:ProveSplitsSymbolic:verify \
	prove_monotonic_symweight:ProveSplitsSymbolic:verify-arith \
	prove_view_eq_actual_2sym:ProveSplitsMultiSym:verify \
	prove_conservation_2sym:ProveSplitsMultiSym:verify-arith \
	prove_receivers_sum_2sym:ProveSplitsMultiSym:verify-arith \
	prove_conservation_2sym_lean:ProveSplitsMultiSym:verify-arith \
	prove_view_eq_actual_3sym:ProveSplitsMulti3:verify \
	prove_conservation_3sym:ProveSplitsMulti3:verify-arith \
	prove_receivers_sum_3sym:ProveSplitsMulti3:verify-arith \
	prove_view_eq_actual_symacct:ProveSplitsSymAcct:verify-arith \
	prove_config_roundtrip:ProveStreamConfig:verify \
	prove_config_order_lexicographic:ProveConfigOrder:verify \
	prove_config_order_irreflexive:ProveConfigOrder:verify \
	prove_amtpersec_min_enforced:ProveMinAmtPerSec:verify \
	prove_deposit_exact:ProveStreamBalance:verify \
	prove_withdraw_clamped_empty:ProveStreamBalance:verify \
	prove_balance_tracks_delta:ProveStreamBalance:verify \
	prove_withdraw_clamped:ProveStreamBalance:verify \
	prove_active_balance_le_deposit:ProveStreamActive:verify \
	prove_active_balance_exact:ProveStreamActive:verify \
	prove_active_balance_monotonic:ProveStreamActive:verify-arith \
	prove_active_exact_multicycle:ProveStreamActive:verify-arith \
	prove_deposit_exact_symacct:ProveStreamSymAcct:verify-arith \
	prove_active_exact_symacct:ProveStreamSymAcct:verify-arith \
	prove_balance_symacct_empty:ProveStreamSymAcct:verify-arith \
	prove_sym_deposit_initial:ProveSymDeposit:verify \
	prove_setsplits_no_revert:ProveNoRevert:verify \
	prove_split_no_revert:ProveNoRevert:verify \
	prove_collect_no_revert:ProveNoRevert:verify \
	prove_give_no_revert:ProveNoRevert:verify \
	prove_setbalance_no_revert:ProveNoRevert:verify \
	prove_withdrawall_no_revert:ProveNoRevert:verify \
	prove_addsplits_no_revert:ProveNoRevert:verify \
	prove_setstreams_no_revert_zerobal:ProveNoRevert:verify \
	prove_addstream_no_revert_zerobal:ProveNoRevert:verify \
	prove_removestream_no_revert_zerobal:ProveNoRevert:verify \
	prove_receive_accounting:ProveReceive:verify \
	prove_receive_no_revert:ProveReceive:verify \
	prove_receive_view_consistency:ProveReceive:verify \
	prove_receive_view_eq_actual:ProveReceive:verify \
	prove_no_pre_update_squeeze:ProveSqueeze:verify-arith \
	prove_squeeze_view_eq_actual:ProveSqueezePair:verify-arith \
	prove_squeeze_view_eq_actual_symacct:ProveSqueezePair:verify-arith \
	prove_squeeze_default_no_revert:ProveSqueezePair:verify-arith \
	prove_squeeze_vmstore:ProveSqueezeVmStore:verify \
	prove_real_squeeze_accounting:ProveRealSqueeze:verify \
	prove_real_no_pre_update:ProveRealSqueeze:verify

# Per-property settings on top of the config: harder SMT queries (symbolic account keys, the full
# deployment) get a longer solver timeout, and the N=3 splits run fewer solvers to fit in memory.
LONG_QUERIES := prove_view_eq_actual_symacct prove_deposit_exact_symacct prove_active_exact_symacct \
	prove_balance_symacct_empty prove_real_squeeze_accounting prove_real_no_pre_update
FEW_SOLVERS := prove_conservation_3sym prove_receivers_sum_3sym

# hevm flags for each config, matching the yaml and the hevm settings echidna uses internally
# (max width 5, max depth = symExecMaxExplore, 2^12-byte buffers, only deployed addresses)
HEVM_verify       := --max-iterations 15
HEVM_verify-arith := --max-iterations 15 --abstract-arith
HEVM_FLAGS := --solver bitwuzla --max-buf-size 12 --max-width 5 --max-depth 50 --only-deployed \
	--loop-detection-heuristic StackBased

entry = $(filter $(1):%,$(VERIFY))
field = $(word $(2),$(subst :, ,$(call entry,$(1))))
names = $(foreach e,$(1),$(firstword $(subst :, ,$(e))))
smt_timeout = $(if $(filter $(1),$(LONG_QUERIES)),500,120)
solvers = $(if $(filter $(1),$(FEW_SOLVERS)),3,5)

# make verify-echidna             every VERIFY property, one by one, then the report
# make verify-echidna T=prove_x   a single property (from the list)
# make verify-hevm [T=prove_x]    the same with hevm
verify: verify-echidna

verify-echidna:
ifeq ($(strip $(T)),)
	@for p in $(call names,$(VERIFY)); do $(MAKE) --no-print-directory run-echidna T=$$p; done
	@$(MAKE) --no-print-directory report
else
	@$(MAKE) --no-print-directory run-echidna T=$(T)
endif

verify-hevm: build-hevm
ifeq ($(strip $(T)),)
	@for p in $(call names,$(VERIFY)); do $(MAKE) --no-print-directory run-hevm T=$$p; done
	@$(MAKE) --no-print-directory report
else
	@$(MAKE) --no-print-directory run-hevm T=$(T)
endif

run-echidna:
ifeq ($(strip $(call entry,$(T))),)
	$(error unknown property T=$(T), see make list)
endif
	@mkdir -p logs
	$(ECHIDNA) test/symbolic/$(call field,$(T),2).t.sol --contract $(call field,$(T),2) \
		--config test/symbolic/$(call field,$(T),3).yaml --sym-exec-target $(T) \
		--sym-exec-timeout $(call smt_timeout,$(T)) --sym-exec-n-solvers $(call solvers,$(T)) \
		| tee logs/verify-echidna-$(T).log

# hevm reads the forge artifacts, which need the AST
build-hevm:
	@forge clean 2> /dev/null
	@forge build --ast 2> /dev/null

run-hevm:
ifeq ($(strip $(call entry,$(T))),)
	$(error unknown property T=$(T), see make list)
endif
	@mkdir -p logs
	$(HEVM) test --match '^$(T)$$' $(HEVM_FLAGS) $(HEVM_$(call field,$(T),3)) \
		--smt-timeout $(call smt_timeout,$(T)) --num-solvers $(call solvers,$(T)) \
		| tee logs/verify-hevm-$(T).log

# Result of every property that has a log, per tool. Fails if any differs from its expected outcome.
report:
	@bad=0; \
	for tool in echidna hevm; do \
	for p in $(call names,$(VERIFY)); do want=verified; $(REPORT_ONE); done; \
	done; \
	exit $$bad

# echidna prints "prove_x(uint256): verified ✅"; hevm prints "[PASS] prove_x" in color
define REPORT_ONE
log=logs/verify-$$tool-$$p.log; [ -f $$log ] || continue; \
if [ $$tool = echidna ]; then got=$$(grep -m1 "^$$p(.*): " $$log | sed 's/^[^:]*: *//'); \
else got=$$(sed 's/\x1b\[[0-9;]*m//g' $$log | grep -m1 -E "^ *\[[A-Z]+\] $$p$$" | sed -E 's/^ *\[([A-Z]+)\].*/\1/; s/^PASS$$/verified/; s/^FAIL$$/failed/'); fi; \
case "$$got" in $$want*) mark=ok;; *) mark=UNEXPECTED; bad=1;; esac; \
printf '%-12s %-8s %-42s %s\n' "$$mark" "$$tool" "$$p" "$${got:-no result}"
endef

list:
	@for e in $(VERIFY); do echo "verify   $$e"; done
