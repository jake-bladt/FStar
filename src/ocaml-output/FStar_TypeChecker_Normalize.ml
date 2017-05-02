
open Prims
type step =
| Beta
| Iota
| Zeta
| Exclude of step
| WHNF
| Primops
| Eager_unfolding
| Inlining
| NoDeltaSteps
| UnfoldUntil of FStar_Syntax_Syntax.delta_depth
| PureSubtermsWithinComputations
| Simplify
| EraseUniverses
| AllowUnboundUniverses
| Reify
| CompressUvars
| NoFullNorm


let uu___is_Beta : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Beta -> begin
true
end
| uu____10 -> begin
false
end))


let uu___is_Iota : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Iota -> begin
true
end
| uu____14 -> begin
false
end))


let uu___is_Zeta : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Zeta -> begin
true
end
| uu____18 -> begin
false
end))


let uu___is_Exclude : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Exclude (_0) -> begin
true
end
| uu____23 -> begin
false
end))


let __proj__Exclude__item___0 : step  ->  step = (fun projectee -> (match (projectee) with
| Exclude (_0) -> begin
_0
end))


let uu___is_WHNF : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| WHNF -> begin
true
end
| uu____34 -> begin
false
end))


let uu___is_Primops : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Primops -> begin
true
end
| uu____38 -> begin
false
end))


let uu___is_Eager_unfolding : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Eager_unfolding -> begin
true
end
| uu____42 -> begin
false
end))


let uu___is_Inlining : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Inlining -> begin
true
end
| uu____46 -> begin
false
end))


let uu___is_NoDeltaSteps : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NoDeltaSteps -> begin
true
end
| uu____50 -> begin
false
end))


let uu___is_UnfoldUntil : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnfoldUntil (_0) -> begin
true
end
| uu____55 -> begin
false
end))


let __proj__UnfoldUntil__item___0 : step  ->  FStar_Syntax_Syntax.delta_depth = (fun projectee -> (match (projectee) with
| UnfoldUntil (_0) -> begin
_0
end))


let uu___is_PureSubtermsWithinComputations : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| PureSubtermsWithinComputations -> begin
true
end
| uu____66 -> begin
false
end))


let uu___is_Simplify : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Simplify -> begin
true
end
| uu____70 -> begin
false
end))


let uu___is_EraseUniverses : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| EraseUniverses -> begin
true
end
| uu____74 -> begin
false
end))


let uu___is_AllowUnboundUniverses : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| AllowUnboundUniverses -> begin
true
end
| uu____78 -> begin
false
end))


let uu___is_Reify : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Reify -> begin
true
end
| uu____82 -> begin
false
end))


let uu___is_CompressUvars : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CompressUvars -> begin
true
end
| uu____86 -> begin
false
end))


let uu___is_NoFullNorm : step  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NoFullNorm -> begin
true
end
| uu____90 -> begin
false
end))


type steps =
step Prims.list

type primitive_step =
{name : FStar_Ident.lid; arity : Prims.int; strong_reduction_ok : Prims.bool; interpretation : FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.term Prims.option}

type closure =
| Clos of (closure Prims.list * FStar_Syntax_Syntax.term * (closure Prims.list * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo * Prims.bool)
| Univ of FStar_Syntax_Syntax.universe
| Dummy


let uu___is_Clos : closure  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Clos (_0) -> begin
true
end
| uu____158 -> begin
false
end))


let __proj__Clos__item___0 : closure  ->  (closure Prims.list * FStar_Syntax_Syntax.term * (closure Prims.list * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo * Prims.bool) = (fun projectee -> (match (projectee) with
| Clos (_0) -> begin
_0
end))


let uu___is_Univ : closure  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Univ (_0) -> begin
true
end
| uu____197 -> begin
false
end))


let __proj__Univ__item___0 : closure  ->  FStar_Syntax_Syntax.universe = (fun projectee -> (match (projectee) with
| Univ (_0) -> begin
_0
end))


let uu___is_Dummy : closure  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Dummy -> begin
true
end
| uu____208 -> begin
false
end))


type env =
closure Prims.list


let closure_to_string : closure  ->  Prims.string = (fun uu___129_212 -> (match (uu___129_212) with
| Clos (uu____213, t, uu____215, uu____216) -> begin
(FStar_Syntax_Print.term_to_string t)
end
| Univ (uu____227) -> begin
"Univ"
end
| Dummy -> begin
"dummy"
end))

type cfg =
{steps : steps; tcenv : FStar_TypeChecker_Env.env; delta_level : FStar_TypeChecker_Env.delta_level Prims.list; primitive_steps : primitive_step Prims.list}


type branches =
(FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term Prims.option * FStar_Syntax_Syntax.term) Prims.list


type subst_t =
FStar_Syntax_Syntax.subst_elt Prims.list

type stack_elt =
| Arg of (closure * FStar_Syntax_Syntax.aqual * FStar_Range.range)
| UnivArgs of (FStar_Syntax_Syntax.universe Prims.list * FStar_Range.range)
| MemoLazy of (env * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo
| Match of (env * branches * FStar_Range.range)
| Abs of (env * FStar_Syntax_Syntax.binders * env * (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option * FStar_Range.range)
| App of (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual * FStar_Range.range)
| Meta of (FStar_Syntax_Syntax.metadata * FStar_Range.range)
| Let of (env * FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.letbinding * FStar_Range.range)
| Steps of (steps * primitive_step Prims.list * FStar_TypeChecker_Env.delta_level Prims.list)
| Debug of FStar_Syntax_Syntax.term


let uu___is_Arg : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Arg (_0) -> begin
true
end
| uu____340 -> begin
false
end))


let __proj__Arg__item___0 : stack_elt  ->  (closure * FStar_Syntax_Syntax.aqual * FStar_Range.range) = (fun projectee -> (match (projectee) with
| Arg (_0) -> begin
_0
end))


let uu___is_UnivArgs : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnivArgs (_0) -> begin
true
end
| uu____364 -> begin
false
end))


let __proj__UnivArgs__item___0 : stack_elt  ->  (FStar_Syntax_Syntax.universe Prims.list * FStar_Range.range) = (fun projectee -> (match (projectee) with
| UnivArgs (_0) -> begin
_0
end))


let uu___is_MemoLazy : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| MemoLazy (_0) -> begin
true
end
| uu____388 -> begin
false
end))


let __proj__MemoLazy__item___0 : stack_elt  ->  (env * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo = (fun projectee -> (match (projectee) with
| MemoLazy (_0) -> begin
_0
end))


let uu___is_Match : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Match (_0) -> begin
true
end
| uu____415 -> begin
false
end))


let __proj__Match__item___0 : stack_elt  ->  (env * branches * FStar_Range.range) = (fun projectee -> (match (projectee) with
| Match (_0) -> begin
_0
end))


let uu___is_Abs : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Abs (_0) -> begin
true
end
| uu____444 -> begin
false
end))


let __proj__Abs__item___0 : stack_elt  ->  (env * FStar_Syntax_Syntax.binders * env * (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option * FStar_Range.range) = (fun projectee -> (match (projectee) with
| Abs (_0) -> begin
_0
end))


let uu___is_App : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| App (_0) -> begin
true
end
| uu____483 -> begin
false
end))


let __proj__App__item___0 : stack_elt  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual * FStar_Range.range) = (fun projectee -> (match (projectee) with
| App (_0) -> begin
_0
end))


let uu___is_Meta : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Meta (_0) -> begin
true
end
| uu____506 -> begin
false
end))


let __proj__Meta__item___0 : stack_elt  ->  (FStar_Syntax_Syntax.metadata * FStar_Range.range) = (fun projectee -> (match (projectee) with
| Meta (_0) -> begin
_0
end))


let uu___is_Let : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Let (_0) -> begin
true
end
| uu____528 -> begin
false
end))


let __proj__Let__item___0 : stack_elt  ->  (env * FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.letbinding * FStar_Range.range) = (fun projectee -> (match (projectee) with
| Let (_0) -> begin
_0
end))


let uu___is_Steps : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Steps (_0) -> begin
true
end
| uu____557 -> begin
false
end))


let __proj__Steps__item___0 : stack_elt  ->  (steps * primitive_step Prims.list * FStar_TypeChecker_Env.delta_level Prims.list) = (fun projectee -> (match (projectee) with
| Steps (_0) -> begin
_0
end))


let uu___is_Debug : stack_elt  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Debug (_0) -> begin
true
end
| uu____584 -> begin
false
end))


let __proj__Debug__item___0 : stack_elt  ->  FStar_Syntax_Syntax.term = (fun projectee -> (match (projectee) with
| Debug (_0) -> begin
_0
end))


type stack =
stack_elt Prims.list


let mk = (fun t r -> (FStar_Syntax_Syntax.mk t None r))


let set_memo = (fun r t -> (

let uu____632 = (FStar_ST.read r)
in (match (uu____632) with
| Some (uu____637) -> begin
(failwith "Unexpected set_memo: thunk already evaluated")
end
| None -> begin
(FStar_ST.write r (Some (t)))
end)))


let env_to_string : closure Prims.list  ->  Prims.string = (fun env -> (

let uu____646 = (FStar_List.map closure_to_string env)
in (FStar_All.pipe_right uu____646 (FStar_String.concat "; "))))


let stack_elt_to_string : stack_elt  ->  Prims.string = (fun uu___130_651 -> (match (uu___130_651) with
| Arg (c, uu____653, uu____654) -> begin
(

let uu____655 = (closure_to_string c)
in (FStar_Util.format1 "Closure %s" uu____655))
end
| MemoLazy (uu____656) -> begin
"MemoLazy"
end
| Abs (uu____660, bs, uu____662, uu____663, uu____664) -> begin
(

let uu____671 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs))
in (FStar_Util.format1 "Abs %s" uu____671))
end
| UnivArgs (uu____676) -> begin
"UnivArgs"
end
| Match (uu____680) -> begin
"Match"
end
| App (t, uu____685, uu____686) -> begin
(

let uu____687 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format1 "App %s" uu____687))
end
| Meta (m, uu____689) -> begin
"Meta"
end
| Let (uu____690) -> begin
"Let"
end
| Steps (uu____695, uu____696, uu____697) -> begin
"Steps"
end
| Debug (t) -> begin
(

let uu____703 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format1 "Debug %s" uu____703))
end))


let stack_to_string : stack_elt Prims.list  ->  Prims.string = (fun s -> (

let uu____709 = (FStar_List.map stack_elt_to_string s)
in (FStar_All.pipe_right uu____709 (FStar_String.concat "; "))))


let log : cfg  ->  (Prims.unit  ->  Prims.unit)  ->  Prims.unit = (fun cfg f -> (

let uu____723 = (FStar_TypeChecker_Env.debug cfg.tcenv (FStar_Options.Other ("Norm")))
in (match (uu____723) with
| true -> begin
(f ())
end
| uu____724 -> begin
()
end)))


let is_empty = (fun uu___131_732 -> (match (uu___131_732) with
| [] -> begin
true
end
| uu____734 -> begin
false
end))


let lookup_bvar = (fun env x -> try
(match (()) with
| () -> begin
(FStar_List.nth env x.FStar_Syntax_Syntax.index)
end)
with
| uu____752 -> begin
(

let uu____753 = (

let uu____754 = (FStar_Syntax_Print.db_to_string x)
in (FStar_Util.format1 "Failed to find %s\n" uu____754))
in (failwith uu____753))
end)


let downgrade_ghost_effect_name : FStar_Ident.lident  ->  FStar_Ident.lident Prims.option = (fun l -> (match ((FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Ghost_lid)) with
| true -> begin
Some (FStar_Syntax_Const.effect_Pure_lid)
end
| uu____760 -> begin
(match ((FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GTot_lid)) with
| true -> begin
Some (FStar_Syntax_Const.effect_Tot_lid)
end
| uu____762 -> begin
(match ((FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GHOST_lid)) with
| true -> begin
Some (FStar_Syntax_Const.effect_PURE_lid)
end
| uu____764 -> begin
None
end)
end)
end))


let norm_universe : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe = (fun cfg env u -> (

let norm_univs = (fun us -> (

let us1 = (FStar_Util.sort_with FStar_Syntax_Util.compare_univs us)
in (

let uu____785 = (FStar_List.fold_left (fun uu____794 u1 -> (match (uu____794) with
| (cur_kernel, cur_max, out) -> begin
(

let uu____809 = (FStar_Syntax_Util.univ_kernel u1)
in (match (uu____809) with
| (k_u, n1) -> begin
(

let uu____818 = (FStar_Syntax_Util.eq_univs cur_kernel k_u)
in (match (uu____818) with
| true -> begin
((cur_kernel), (u1), (out))
end
| uu____824 -> begin
((k_u), (u1), ((cur_max)::out))
end))
end))
end)) ((FStar_Syntax_Syntax.U_zero), (FStar_Syntax_Syntax.U_zero), ([])) us1)
in (match (uu____785) with
| (uu____828, u1, out) -> begin
(FStar_List.rev ((u1)::out))
end))))
in (

let rec aux = (fun u1 -> (

let u2 = (FStar_Syntax_Subst.compress_univ u1)
in (match (u2) with
| FStar_Syntax_Syntax.U_bvar (x) -> begin
try
(match (()) with
| () -> begin
(

let uu____844 = (FStar_List.nth env x)
in (match (uu____844) with
| Univ (u3) -> begin
(aux u3)
end
| Dummy -> begin
(u2)::[]
end
| uu____847 -> begin
(failwith "Impossible: universe variable bound to a term")
end))
end)
with
| uu____851 -> begin
(

let uu____852 = (FStar_All.pipe_right cfg.steps (FStar_List.contains AllowUnboundUniverses))
in (match (uu____852) with
| true -> begin
(FStar_Syntax_Syntax.U_unknown)::[]
end
| uu____854 -> begin
(failwith "Universe variable not found")
end))
end
end
| (FStar_Syntax_Syntax.U_zero) | (FStar_Syntax_Syntax.U_unif (_)) | (FStar_Syntax_Syntax.U_name (_)) | (FStar_Syntax_Syntax.U_unknown) -> begin
(u2)::[]
end
| FStar_Syntax_Syntax.U_max ([]) -> begin
(FStar_Syntax_Syntax.U_zero)::[]
end
| FStar_Syntax_Syntax.U_max (us) -> begin
(

let us1 = (

let uu____862 = (FStar_List.collect aux us)
in (FStar_All.pipe_right uu____862 norm_univs))
in (match (us1) with
| (u_k)::(hd1)::rest -> begin
(

let rest1 = (hd1)::rest
in (

let uu____873 = (FStar_Syntax_Util.univ_kernel u_k)
in (match (uu____873) with
| (FStar_Syntax_Syntax.U_zero, n1) -> begin
(

let uu____878 = (FStar_All.pipe_right rest1 (FStar_List.for_all (fun u3 -> (

let uu____881 = (FStar_Syntax_Util.univ_kernel u3)
in (match (uu____881) with
| (uu____884, m) -> begin
(n1 <= m)
end)))))
in (match (uu____878) with
| true -> begin
rest1
end
| uu____887 -> begin
us1
end))
end
| uu____888 -> begin
us1
end)))
end
| uu____891 -> begin
us1
end))
end
| FStar_Syntax_Syntax.U_succ (u3) -> begin
(

let uu____894 = (aux u3)
in (FStar_List.map (fun _0_29 -> FStar_Syntax_Syntax.U_succ (_0_29)) uu____894))
end)))
in (

let uu____896 = (FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses))
in (match (uu____896) with
| true -> begin
FStar_Syntax_Syntax.U_unknown
end
| uu____897 -> begin
(

let uu____898 = (aux u)
in (match (uu____898) with
| ([]) | ((FStar_Syntax_Syntax.U_zero)::[]) -> begin
FStar_Syntax_Syntax.U_zero
end
| (FStar_Syntax_Syntax.U_zero)::(u1)::[] -> begin
u1
end
| (FStar_Syntax_Syntax.U_zero)::us -> begin
FStar_Syntax_Syntax.U_max (us)
end
| (u1)::[] -> begin
u1
end
| us -> begin
FStar_Syntax_Syntax.U_max (us)
end))
end)))))


let rec closure_as_term : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env t -> ((log cfg (fun uu____995 -> (

let uu____996 = (FStar_Syntax_Print.tag_of_term t)
in (

let uu____997 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 ">>> %s Closure_as_term %s\n" uu____996 uu____997)))));
(match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
t
end
| uu____998 -> begin
(

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____1001) -> begin
(failwith "Impossible")
end
| (FStar_Syntax_Syntax.Tm_unknown) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) -> begin
t1
end
| FStar_Syntax_Syntax.Tm_uvar (uu____1025) -> begin
t1
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(

let uu____1035 = (

let uu____1036 = (norm_universe cfg env u)
in FStar_Syntax_Syntax.Tm_type (uu____1036))
in (mk uu____1035 t1.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_uinst (t2, us) -> begin
(

let uu____1043 = (FStar_List.map (norm_universe cfg env) us)
in (FStar_Syntax_Syntax.mk_Tm_uinst t2 uu____1043))
end
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(

let uu____1045 = (lookup_bvar env x)
in (match (uu____1045) with
| Univ (uu____1046) -> begin
(failwith "Impossible: term variable is bound to a universe")
end
| Dummy -> begin
t1
end
| Clos (env1, t0, r, uu____1050) -> begin
(closure_as_term cfg env1 t0)
end))
end
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let head2 = (closure_as_term_delayed cfg env head1)
in (

let args1 = (closures_as_args_delayed cfg env args)
in (mk (FStar_Syntax_Syntax.Tm_app (((head2), (args1)))) t1.FStar_Syntax_Syntax.pos)))
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, lopt) -> begin
(

let uu____1118 = (closures_as_binders_delayed cfg env bs)
in (match (uu____1118) with
| (bs1, env1) -> begin
(

let body1 = (closure_as_term_delayed cfg env1 body)
in (

let uu____1138 = (

let uu____1139 = (

let uu____1154 = (close_lcomp_opt cfg env1 lopt)
in ((bs1), (body1), (uu____1154)))
in FStar_Syntax_Syntax.Tm_abs (uu____1139))
in (mk uu____1138 t1.FStar_Syntax_Syntax.pos)))
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____1184 = (closures_as_binders_delayed cfg env bs)
in (match (uu____1184) with
| (bs1, env1) -> begin
(

let c1 = (close_comp cfg env1 c)
in (mk (FStar_Syntax_Syntax.Tm_arrow (((bs1), (c1)))) t1.FStar_Syntax_Syntax.pos))
end))
end
| FStar_Syntax_Syntax.Tm_refine (x, phi) -> begin
(

let uu____1215 = (

let uu____1222 = (

let uu____1226 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____1226)::[])
in (closures_as_binders_delayed cfg env uu____1222))
in (match (uu____1215) with
| (x1, env1) -> begin
(

let phi1 = (closure_as_term_delayed cfg env1 phi)
in (

let uu____1240 = (

let uu____1241 = (

let uu____1246 = (

let uu____1247 = (FStar_List.hd x1)
in (FStar_All.pipe_right uu____1247 Prims.fst))
in ((uu____1246), (phi1)))
in FStar_Syntax_Syntax.Tm_refine (uu____1241))
in (mk uu____1240 t1.FStar_Syntax_Syntax.pos)))
end))
end
| FStar_Syntax_Syntax.Tm_ascribed (t11, (annot, tacopt), lopt) -> begin
(

let annot1 = (match (annot) with
| FStar_Util.Inl (t2) -> begin
(

let uu____1315 = (closure_as_term_delayed cfg env t2)
in FStar_Util.Inl (uu____1315))
end
| FStar_Util.Inr (c) -> begin
(

let uu____1329 = (close_comp cfg env c)
in FStar_Util.Inr (uu____1329))
end)
in (

let tacopt1 = (FStar_Util.map_opt tacopt (closure_as_term_delayed cfg env))
in (

let uu____1344 = (

let uu____1345 = (

let uu____1363 = (closure_as_term_delayed cfg env t11)
in ((uu____1363), (((annot1), (tacopt1))), (lopt)))
in FStar_Syntax_Syntax.Tm_ascribed (uu____1345))
in (mk uu____1344 t1.FStar_Syntax_Syntax.pos))))
end
| FStar_Syntax_Syntax.Tm_meta (t', FStar_Syntax_Syntax.Meta_pattern (args)) -> begin
(

let uu____1401 = (

let uu____1402 = (

let uu____1407 = (closure_as_term_delayed cfg env t')
in (

let uu____1410 = (

let uu____1411 = (FStar_All.pipe_right args (FStar_List.map (closures_as_args_delayed cfg env)))
in FStar_Syntax_Syntax.Meta_pattern (uu____1411))
in ((uu____1407), (uu____1410))))
in FStar_Syntax_Syntax.Tm_meta (uu____1402))
in (mk uu____1401 t1.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', FStar_Syntax_Syntax.Meta_monadic (m, tbody)) -> begin
(

let uu____1453 = (

let uu____1454 = (

let uu____1459 = (closure_as_term_delayed cfg env t')
in (

let uu____1462 = (

let uu____1463 = (

let uu____1468 = (closure_as_term_delayed cfg env tbody)
in ((m), (uu____1468)))
in FStar_Syntax_Syntax.Meta_monadic (uu____1463))
in ((uu____1459), (uu____1462))))
in FStar_Syntax_Syntax.Tm_meta (uu____1454))
in (mk uu____1453 t1.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, tbody)) -> begin
(

let uu____1487 = (

let uu____1488 = (

let uu____1493 = (closure_as_term_delayed cfg env t')
in (

let uu____1496 = (

let uu____1497 = (

let uu____1503 = (closure_as_term_delayed cfg env tbody)
in ((m1), (m2), (uu____1503)))
in FStar_Syntax_Syntax.Meta_monadic_lift (uu____1497))
in ((uu____1493), (uu____1496))))
in FStar_Syntax_Syntax.Tm_meta (uu____1488))
in (mk uu____1487 t1.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', m) -> begin
(

let uu____1516 = (

let uu____1517 = (

let uu____1522 = (closure_as_term_delayed cfg env t')
in ((uu____1522), (m)))
in FStar_Syntax_Syntax.Tm_meta (uu____1517))
in (mk uu____1516 t1.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let env0 = env
in (

let env1 = (FStar_List.fold_left (fun env1 uu____1543 -> (Dummy)::env1) env lb.FStar_Syntax_Syntax.lbunivs)
in (

let typ = (closure_as_term_delayed cfg env1 lb.FStar_Syntax_Syntax.lbtyp)
in (

let def = (closure_as_term cfg env1 lb.FStar_Syntax_Syntax.lbdef)
in (

let body1 = (match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inr (uu____1554) -> begin
body
end
| FStar_Util.Inl (uu____1555) -> begin
(closure_as_term cfg ((Dummy)::env0) body)
end)
in (

let lb1 = (

let uu___144_1557 = lb
in {FStar_Syntax_Syntax.lbname = uu___144_1557.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = uu___144_1557.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = typ; FStar_Syntax_Syntax.lbeff = uu___144_1557.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = def})
in (mk (FStar_Syntax_Syntax.Tm_let (((((false), ((lb1)::[]))), (body1)))) t1.FStar_Syntax_Syntax.pos)))))))
end
| FStar_Syntax_Syntax.Tm_let ((uu____1564, lbs), body) -> begin
(

let norm_one_lb = (fun env1 lb -> (

let env_univs = (FStar_List.fold_right (fun uu____1588 env2 -> (Dummy)::env2) lb.FStar_Syntax_Syntax.lbunivs env1)
in (

let env2 = (

let uu____1593 = (FStar_Syntax_Syntax.is_top_level lbs)
in (match (uu____1593) with
| true -> begin
env_univs
end
| uu____1595 -> begin
(FStar_List.fold_right (fun uu____1597 env2 -> (Dummy)::env2) lbs env_univs)
end))
in (

let uu___145_1600 = lb
in (

let uu____1601 = (closure_as_term cfg env_univs lb.FStar_Syntax_Syntax.lbtyp)
in (

let uu____1604 = (closure_as_term cfg env2 lb.FStar_Syntax_Syntax.lbdef)
in {FStar_Syntax_Syntax.lbname = uu___145_1600.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = uu___145_1600.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = uu____1601; FStar_Syntax_Syntax.lbeff = uu___145_1600.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = uu____1604}))))))
in (

let lbs1 = (FStar_All.pipe_right lbs (FStar_List.map (norm_one_lb env)))
in (

let body1 = (

let body_env = (FStar_List.fold_right (fun uu____1615 env1 -> (Dummy)::env1) lbs1 env)
in (closure_as_term cfg body_env body))
in (mk (FStar_Syntax_Syntax.Tm_let (((((true), (lbs1))), (body1)))) t1.FStar_Syntax_Syntax.pos))))
end
| FStar_Syntax_Syntax.Tm_match (head1, branches) -> begin
(

let head2 = (closure_as_term cfg env head1)
in (

let norm_one_branch = (fun env1 uu____1670 -> (match (uu____1670) with
| (pat, w_opt, tm) -> begin
(

let rec norm_pat = (fun env2 p -> (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_constant (uu____1716) -> begin
((p), (env2))
end
| FStar_Syntax_Syntax.Pat_disj ([]) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Pat_disj ((hd1)::tl1) -> begin
(

let uu____1736 = (norm_pat env2 hd1)
in (match (uu____1736) with
| (hd2, env') -> begin
(

let tl2 = (FStar_All.pipe_right tl1 (FStar_List.map (fun p1 -> (

let uu____1772 = (norm_pat env2 p1)
in (Prims.fst uu____1772)))))
in (((

let uu___146_1784 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_disj ((hd2)::tl2); FStar_Syntax_Syntax.ty = uu___146_1784.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___146_1784.FStar_Syntax_Syntax.p})), (env')))
end))
end
| FStar_Syntax_Syntax.Pat_cons (fv, pats) -> begin
(

let uu____1801 = (FStar_All.pipe_right pats (FStar_List.fold_left (fun uu____1835 uu____1836 -> (match (((uu____1835), (uu____1836))) with
| ((pats1, env3), (p1, b)) -> begin
(

let uu____1901 = (norm_pat env3 p1)
in (match (uu____1901) with
| (p2, env4) -> begin
(((((p2), (b)))::pats1), (env4))
end))
end)) (([]), (env2))))
in (match (uu____1801) with
| (pats1, env3) -> begin
(((

let uu___147_1967 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_cons (((fv), ((FStar_List.rev pats1)))); FStar_Syntax_Syntax.ty = uu___147_1967.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___147_1967.FStar_Syntax_Syntax.p})), (env3))
end))
end
| FStar_Syntax_Syntax.Pat_var (x) -> begin
(

let x1 = (

let uu___148_1981 = x
in (

let uu____1982 = (closure_as_term cfg env2 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___148_1981.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___148_1981.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____1982}))
in (((

let uu___149_1988 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_var (x1); FStar_Syntax_Syntax.ty = uu___149_1988.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___149_1988.FStar_Syntax_Syntax.p})), ((Dummy)::env2)))
end
| FStar_Syntax_Syntax.Pat_wild (x) -> begin
(

let x1 = (

let uu___150_1993 = x
in (

let uu____1994 = (closure_as_term cfg env2 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___150_1993.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___150_1993.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____1994}))
in (((

let uu___151_2000 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_wild (x1); FStar_Syntax_Syntax.ty = uu___151_2000.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___151_2000.FStar_Syntax_Syntax.p})), ((Dummy)::env2)))
end
| FStar_Syntax_Syntax.Pat_dot_term (x, t2) -> begin
(

let x1 = (

let uu___152_2010 = x
in (

let uu____2011 = (closure_as_term cfg env2 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___152_2010.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___152_2010.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____2011}))
in (

let t3 = (closure_as_term cfg env2 t2)
in (((

let uu___153_2018 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_dot_term (((x1), (t3))); FStar_Syntax_Syntax.ty = uu___153_2018.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___153_2018.FStar_Syntax_Syntax.p})), (env2))))
end))
in (

let uu____2021 = (norm_pat env1 pat)
in (match (uu____2021) with
| (pat1, env2) -> begin
(

let w_opt1 = (match (w_opt) with
| None -> begin
None
end
| Some (w) -> begin
(

let uu____2045 = (closure_as_term cfg env2 w)
in Some (uu____2045))
end)
in (

let tm1 = (closure_as_term cfg env2 tm)
in ((pat1), (w_opt1), (tm1))))
end)))
end))
in (

let uu____2050 = (

let uu____2051 = (

let uu____2067 = (FStar_All.pipe_right branches (FStar_List.map (norm_one_branch env)))
in ((head2), (uu____2067)))
in FStar_Syntax_Syntax.Tm_match (uu____2051))
in (mk uu____2050 t1.FStar_Syntax_Syntax.pos))))
end))
end);
))
and closure_as_term_delayed : cfg  ->  closure Prims.list  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax = (fun cfg env t -> (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
t
end
| uu____2120 -> begin
(closure_as_term cfg env t)
end))
and closures_as_args_delayed : cfg  ->  closure Prims.list  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list = (fun cfg env args -> (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
args
end
| uu____2136 -> begin
(FStar_List.map (fun uu____2146 -> (match (uu____2146) with
| (x, imp) -> begin
(

let uu____2161 = (closure_as_term_delayed cfg env x)
in ((uu____2161), (imp)))
end)) args)
end))
and closures_as_binders_delayed : cfg  ->  closure Prims.list  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) Prims.list * closure Prims.list) = (fun cfg env bs -> (

let uu____2173 = (FStar_All.pipe_right bs (FStar_List.fold_left (fun uu____2197 uu____2198 -> (match (((uu____2197), (uu____2198))) with
| ((env1, out), (b, imp)) -> begin
(

let b1 = (

let uu___154_2242 = b
in (

let uu____2243 = (closure_as_term_delayed cfg env1 b.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___154_2242.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___154_2242.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____2243}))
in (

let env2 = (Dummy)::env1
in ((env2), ((((b1), (imp)))::out))))
end)) ((env), ([]))))
in (match (uu____2173) with
| (env1, bs1) -> begin
(((FStar_List.rev bs1)), (env1))
end)))
and close_comp : cfg  ->  closure Prims.list  ->  (FStar_Syntax_Syntax.comp', Prims.unit) FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.comp', Prims.unit) FStar_Syntax_Syntax.syntax = (fun cfg env c -> (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
c
end
| uu____2290 -> begin
(match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uopt) -> begin
(

let uu____2302 = (closure_as_term_delayed cfg env t)
in (

let uu____2303 = (FStar_Option.map (norm_universe cfg env) uopt)
in (FStar_Syntax_Syntax.mk_Total' uu____2302 uu____2303)))
end
| FStar_Syntax_Syntax.GTotal (t, uopt) -> begin
(

let uu____2313 = (closure_as_term_delayed cfg env t)
in (

let uu____2314 = (FStar_Option.map (norm_universe cfg env) uopt)
in (FStar_Syntax_Syntax.mk_GTotal' uu____2313 uu____2314)))
end
| FStar_Syntax_Syntax.Comp (c1) -> begin
(

let rt = (closure_as_term_delayed cfg env c1.FStar_Syntax_Syntax.result_typ)
in (

let args = (closures_as_args_delayed cfg env c1.FStar_Syntax_Syntax.effect_args)
in (

let flags = (FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags (FStar_List.map (fun uu___132_2330 -> (match (uu___132_2330) with
| FStar_Syntax_Syntax.DECREASES (t) -> begin
(

let uu____2334 = (closure_as_term_delayed cfg env t)
in FStar_Syntax_Syntax.DECREASES (uu____2334))
end
| f -> begin
f
end))))
in (

let uu____2338 = (

let uu___155_2339 = c1
in (

let uu____2340 = (FStar_List.map (norm_universe cfg env) c1.FStar_Syntax_Syntax.comp_univs)
in {FStar_Syntax_Syntax.comp_univs = uu____2340; FStar_Syntax_Syntax.effect_name = uu___155_2339.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = rt; FStar_Syntax_Syntax.effect_args = args; FStar_Syntax_Syntax.flags = flags}))
in (FStar_Syntax_Syntax.mk_Comp uu____2338)))))
end)
end))
and filter_out_lcomp_cflags : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.cflags Prims.list = (fun lc -> (FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags (FStar_List.filter (fun uu___133_2344 -> (match (uu___133_2344) with
| FStar_Syntax_Syntax.DECREASES (uu____2345) -> begin
false
end
| uu____2348 -> begin
true
end)))))
and close_lcomp_opt : cfg  ->  closure Prims.list  ->  (FStar_Syntax_Syntax.lcomp, (FStar_Ident.lident * FStar_Syntax_Syntax.cflags Prims.list)) FStar_Util.either Prims.option  ->  (FStar_Syntax_Syntax.lcomp, (FStar_Ident.lident * FStar_Syntax_Syntax.cflags Prims.list)) FStar_Util.either Prims.option = (fun cfg env lopt -> (match (lopt) with
| Some (FStar_Util.Inl (lc)) -> begin
(

let flags = (filter_out_lcomp_cflags lc)
in (

let uu____2376 = (FStar_Syntax_Util.is_total_lcomp lc)
in (match (uu____2376) with
| true -> begin
Some (FStar_Util.Inr (((FStar_Syntax_Const.effect_Tot_lid), (flags))))
end
| uu____2392 -> begin
(

let uu____2393 = (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc)
in (match (uu____2393) with
| true -> begin
Some (FStar_Util.Inr (((FStar_Syntax_Const.effect_GTot_lid), (flags))))
end
| uu____2409 -> begin
Some (FStar_Util.Inr (((lc.FStar_Syntax_Syntax.eff_name), (flags))))
end))
end)))
end
| uu____2419 -> begin
lopt
end))


let built_in_primitive_steps : primitive_step Prims.list = (

let const_as_tm = (fun c p -> (mk (FStar_Syntax_Syntax.Tm_constant (c)) p))
in (

let interp_math_op = (fun f args -> (match (args) with
| ((a1, uu____2459))::((a2, uu____2461))::[] -> begin
(

let uu____2482 = (

let uu____2485 = (

let uu____2486 = (FStar_Syntax_Subst.compress a1)
in uu____2486.FStar_Syntax_Syntax.n)
in (

let uu____2489 = (

let uu____2490 = (FStar_Syntax_Subst.compress a2)
in uu____2490.FStar_Syntax_Syntax.n)
in ((uu____2485), (uu____2489))))
in (match (uu____2482) with
| (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (i, None)), FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (j, None))) -> begin
(

let uu____2506 = (

let uu____2509 = (

let uu____2510 = (FStar_Util.int_of_string i)
in (

let uu____2511 = (FStar_Util.int_of_string j)
in (f uu____2510 uu____2511)))
in (const_as_tm uu____2509 a2.FStar_Syntax_Syntax.pos))
in Some (uu____2506))
end
| uu____2514 -> begin
None
end))
end
| uu____2517 -> begin
(failwith "Unexpected number of arguments")
end))
in (

let interp_bounded_op = (fun f args -> (match (args) with
| ((a1, uu____2542))::((a2, uu____2544))::[] -> begin
(

let uu____2565 = (

let uu____2568 = (

let uu____2569 = (FStar_Syntax_Subst.compress a1)
in uu____2569.FStar_Syntax_Syntax.n)
in (

let uu____2572 = (

let uu____2573 = (FStar_Syntax_Subst.compress a2)
in uu____2573.FStar_Syntax_Syntax.n)
in ((uu____2568), (uu____2572))))
in (match (uu____2565) with
| (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv1); FStar_Syntax_Syntax.tk = uu____2578; FStar_Syntax_Syntax.pos = uu____2579; FStar_Syntax_Syntax.vars = uu____2580}, (({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (i, None)); FStar_Syntax_Syntax.tk = uu____2582; FStar_Syntax_Syntax.pos = uu____2583; FStar_Syntax_Syntax.vars = uu____2584}, uu____2585))::[]), FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv2); FStar_Syntax_Syntax.tk = uu____2587; FStar_Syntax_Syntax.pos = uu____2588; FStar_Syntax_Syntax.vars = uu____2589}, (({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (j, None)); FStar_Syntax_Syntax.tk = uu____2591; FStar_Syntax_Syntax.pos = uu____2592; FStar_Syntax_Syntax.vars = uu____2593}, uu____2594))::[])) when ((FStar_Util.ends_with (FStar_Ident.text_of_lid fv1.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) "int_to_t") && (FStar_Util.ends_with (FStar_Ident.text_of_lid fv2.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) "int_to_t")) -> begin
(

let n1 = (

let uu____2658 = (

let uu____2659 = (FStar_Util.int_of_string i)
in (

let uu____2660 = (FStar_Util.int_of_string j)
in (f uu____2659 uu____2660)))
in (const_as_tm uu____2658 a2.FStar_Syntax_Syntax.pos))
in (

let uu____2661 = (

let uu____2664 = (mk (FStar_Syntax_Syntax.Tm_fvar (fv1)) a2.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Util.mk_app uu____2664 ((((n1), (None)))::[])))
in Some (uu____2661)))
end
| uu____2682 -> begin
None
end))
end
| uu____2685 -> begin
(failwith "Unexpected number of arguments")
end))
in (

let as_primitive_step = (fun arity mk1 uu____2719 -> (match (uu____2719) with
| (l, f) -> begin
(

let uu____2747 = (mk1 f)
in {name = l; arity = arity; strong_reduction_ok = true; interpretation = uu____2747})
end))
in (

let int_as_const = (fun i -> (

let uu____2755 = (

let uu____2761 = (FStar_Util.string_of_int i)
in ((uu____2761), (None)))
in FStar_Const.Const_int (uu____2755)))
in (

let bool_as_const = (fun b -> FStar_Const.Const_bool (b))
in (

let basic_arith = (FStar_List.map (as_primitive_step (Prims.parse_int "2") interp_math_op) ((((FStar_Syntax_Const.op_Addition), ((fun x y -> (int_as_const (x + y))))))::(((FStar_Syntax_Const.op_Subtraction), ((fun x y -> (int_as_const (x - y))))))::(((FStar_Syntax_Const.op_Multiply), ((fun x y -> (int_as_const (x * y))))))::(((FStar_Syntax_Const.op_Division), ((fun x y -> (int_as_const (x / y))))))::(((FStar_Syntax_Const.op_LT), ((fun x y -> (bool_as_const (x < y))))))::(((FStar_Syntax_Const.op_LTE), ((fun x y -> (bool_as_const (x <= y))))))::(((FStar_Syntax_Const.op_GT), ((fun x y -> (bool_as_const (x > y))))))::(((FStar_Syntax_Const.op_GTE), ((fun x y -> (bool_as_const (x >= y))))))::(((FStar_Syntax_Const.op_Modulus), ((fun x y -> (int_as_const (x mod y))))))::[]))
in (

let bounded_arith = (

let uu____2912 = (

let uu____2920 = (FStar_List.map (fun m -> (

let uu____2937 = (

let uu____2944 = (FStar_Syntax_Const.p2l (("FStar")::(m)::("add")::[]))
in ((uu____2944), ((fun x y -> (int_as_const (x + y))))))
in (

let uu____2951 = (

let uu____2959 = (

let uu____2966 = (FStar_Syntax_Const.p2l (("FStar")::(m)::("sub")::[]))
in ((uu____2966), ((fun x y -> (int_as_const (x - y))))))
in (

let uu____2973 = (

let uu____2981 = (

let uu____2988 = (FStar_Syntax_Const.p2l (("FStar")::(m)::("mul")::[]))
in ((uu____2988), ((fun x y -> (int_as_const (x * y))))))
in (uu____2981)::[])
in (uu____2959)::uu____2973))
in (uu____2937)::uu____2951))) (("Int8")::("UInt8")::("Int16")::("UInt16")::("Int32")::("UInt32")::("Int64")::("UInt64")::("UInt128")::[]))
in (FStar_List.flatten uu____2920))
in (FStar_List.map (as_primitive_step (Prims.parse_int "2") interp_bounded_op) uu____2912))
in (

let unary_string_ops = (

let mk1 = (fun x -> (mk x FStar_Range.dummyRange))
in (

let name = (fun l -> (

let uu____3045 = (

let uu____3046 = (FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.Delta_constant None)
in FStar_Syntax_Syntax.Tm_fvar (uu____3046))
in (mk1 uu____3045)))
in (

let ctor = (fun l -> (

let uu____3053 = (

let uu____3054 = (FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.Delta_constant (Some (FStar_Syntax_Syntax.Data_ctor)))
in FStar_Syntax_Syntax.Tm_fvar (uu____3054))
in (mk1 uu____3053)))
in (

let interp = (fun args -> (match (args) with
| ((a, uu____3063))::[] -> begin
(

let uu____3076 = (

let uu____3077 = (FStar_Syntax_Subst.compress a)
in uu____3077.FStar_Syntax_Syntax.n)
in (match (uu____3076) with
| FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string (bytes, uu____3082)) -> begin
(

let s = (FStar_Util.string_of_bytes bytes)
in (

let char_t = (name FStar_Syntax_Const.char_lid)
in (

let nil_char = (

let uu____3092 = (

let uu____3093 = (

let uu____3094 = (ctor FStar_Syntax_Const.nil_lid)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____3094 ((FStar_Syntax_Syntax.U_zero)::[])))
in (

let uu____3095 = (

let uu____3096 = (FStar_Syntax_Syntax.iarg char_t)
in (uu____3096)::[])
in (FStar_Syntax_Syntax.mk_Tm_app uu____3093 uu____3095)))
in (uu____3092 None FStar_Range.dummyRange))
in (

let uu____3101 = (

let uu____3102 = (FStar_String.list_of_string s)
in (FStar_List.fold_right (fun c a1 -> (

let uu____3108 = (

let uu____3109 = (

let uu____3110 = (ctor FStar_Syntax_Const.cons_lid)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____3110 ((FStar_Syntax_Syntax.U_zero)::[])))
in (

let uu____3111 = (

let uu____3112 = (FStar_Syntax_Syntax.iarg char_t)
in (

let uu____3113 = (

let uu____3115 = (

let uu____3116 = (mk1 (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char (c))))
in (FStar_Syntax_Syntax.as_arg uu____3116))
in (

let uu____3117 = (

let uu____3119 = (FStar_Syntax_Syntax.as_arg a1)
in (uu____3119)::[])
in (uu____3115)::uu____3117))
in (uu____3112)::uu____3113))
in (FStar_Syntax_Syntax.mk_Tm_app uu____3109 uu____3111)))
in (uu____3108 None FStar_Range.dummyRange))) uu____3102 nil_char))
in Some (uu____3101)))))
end
| uu____3124 -> begin
None
end))
end
| uu____3125 -> begin
(failwith "Unexpected number of arguments")
end))
in (

let uu____3127 = (

let uu____3128 = (FStar_Syntax_Const.p2l (("FStar")::("String")::("list_of_string")::[]))
in {name = uu____3128; arity = (Prims.parse_int "1"); strong_reduction_ok = true; interpretation = interp})
in (uu____3127)::[])))))
in (FStar_List.append basic_arith (FStar_List.append bounded_arith unary_string_ops)))))))))))


let equality_ops : primitive_step Prims.list = (

let interp_bool = (fun args -> (match (args) with
| ((_typ, uu____3138))::((a1, uu____3140))::((a2, uu____3142))::[] -> begin
(

let uu____3171 = (FStar_Syntax_Util.eq_tm a1 a2)
in (match (uu____3171) with
| FStar_Syntax_Util.Equal -> begin
(

let uu____3173 = (mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool (true))) a2.FStar_Syntax_Syntax.pos)
in Some (uu____3173))
end
| FStar_Syntax_Util.NotEqual -> begin
(

let uu____3178 = (mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool (false))) a2.FStar_Syntax_Syntax.pos)
in Some (uu____3178))
end
| uu____3183 -> begin
None
end))
end
| uu____3184 -> begin
(failwith "Unexpected number of arguments")
end))
in (

let interp_prop = (fun args -> (match (args) with
| (((_typ, _))::((a1, _))::((a2, _))::[]) | (((_typ, _))::(_)::((a1, _))::((a2, _))::[]) -> begin
(

let uu____3263 = (FStar_Syntax_Util.eq_tm a1 a2)
in (match (uu____3263) with
| FStar_Syntax_Util.Equal -> begin
Some (FStar_Syntax_Util.t_true)
end
| FStar_Syntax_Util.NotEqual -> begin
Some (FStar_Syntax_Util.t_false)
end
| uu____3265 -> begin
None
end))
end
| uu____3266 -> begin
(failwith "Unexpected number of arguments")
end))
in (

let decidable_equality = {name = FStar_Syntax_Const.op_Eq; arity = (Prims.parse_int "3"); strong_reduction_ok = true; interpretation = interp_bool}
in (

let propositional_equality = {name = FStar_Syntax_Const.eq2_lid; arity = (Prims.parse_int "3"); strong_reduction_ok = true; interpretation = interp_prop}
in (

let hetero_propositional_equality = {name = FStar_Syntax_Const.eq3_lid; arity = (Prims.parse_int "4"); strong_reduction_ok = true; interpretation = interp_prop}
in (decidable_equality)::(propositional_equality)::(hetero_propositional_equality)::[])))))


let reduce_primops : cfg  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg tm -> (

let uu____3277 = (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains Primops cfg.steps))
in (match (uu____3277) with
| true -> begin
tm
end
| uu____3278 -> begin
(

let uu____3279 = (FStar_Syntax_Util.head_and_args tm)
in (match (uu____3279) with
| (head1, args) -> begin
(

let uu____3305 = (

let uu____3306 = (FStar_Syntax_Util.un_uinst head1)
in uu____3306.FStar_Syntax_Syntax.n)
in (match (uu____3305) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(

let uu____3310 = (FStar_List.tryFind (fun ps -> (FStar_Syntax_Syntax.fv_eq_lid fv ps.name)) cfg.primitive_steps)
in (match (uu____3310) with
| None -> begin
tm
end
| Some (prim_step) -> begin
(match (((FStar_List.length args) < prim_step.arity)) with
| true -> begin
tm
end
| uu____3321 -> begin
(

let uu____3322 = (prim_step.interpretation args)
in (match (uu____3322) with
| None -> begin
tm
end
| Some (reduced) -> begin
reduced
end))
end)
end))
end
| uu____3325 -> begin
tm
end))
end))
end)))


let reduce_equality : cfg  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg tm -> (reduce_primops (

let uu___156_3332 = cfg
in {steps = (Primops)::[]; tcenv = uu___156_3332.tcenv; delta_level = uu___156_3332.delta_level; primitive_steps = equality_ops}) tm))


let maybe_simplify : cfg  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term = (fun cfg tm -> (

let steps = cfg.steps
in (

let w = (fun t -> (

let uu___157_3354 = t
in {FStar_Syntax_Syntax.n = uu___157_3354.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = uu___157_3354.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = tm.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___157_3354.FStar_Syntax_Syntax.vars}))
in (

let simp_t = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.true_lid) -> begin
Some (true)
end
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.false_lid) -> begin
Some (false)
end
| uu____3373 -> begin
None
end))
in (

let simplify = (fun arg -> (((simp_t (Prims.fst arg))), (arg)))
in (

let uu____3400 = (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains Simplify steps))
in (match (uu____3400) with
| true -> begin
(reduce_primops cfg tm)
end
| uu____3401 -> begin
(match (tm.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, args)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, args)) -> begin
(

let uu____3440 = (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.and_lid)
in (match (uu____3440) with
| true -> begin
(

let uu____3441 = (FStar_All.pipe_right args (FStar_List.map simplify))
in (match (uu____3441) with
| (((Some (true), _))::((_, (arg, _)))::[]) | (((_, (arg, _)))::((Some (true), _))::[]) -> begin
arg
end
| (((Some (false), _))::(_)::[]) | ((_)::((Some (false), _))::[]) -> begin
(w FStar_Syntax_Util.t_false)
end
| uu____3607 -> begin
tm
end))
end
| uu____3616 -> begin
(

let uu____3617 = (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.or_lid)
in (match (uu____3617) with
| true -> begin
(

let uu____3618 = (FStar_All.pipe_right args (FStar_List.map simplify))
in (match (uu____3618) with
| (((Some (true), _))::(_)::[]) | ((_)::((Some (true), _))::[]) -> begin
(w FStar_Syntax_Util.t_true)
end
| (((Some (false), _))::((_, (arg, _)))::[]) | (((_, (arg, _)))::((Some (false), _))::[]) -> begin
arg
end
| uu____3784 -> begin
tm
end))
end
| uu____3793 -> begin
(

let uu____3794 = (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.imp_lid)
in (match (uu____3794) with
| true -> begin
(

let uu____3795 = (FStar_All.pipe_right args (FStar_List.map simplify))
in (match (uu____3795) with
| ((_)::((Some (true), _))::[]) | (((Some (false), _))::(_)::[]) -> begin
(w FStar_Syntax_Util.t_true)
end
| ((Some (true), uu____3884))::((uu____3885, (arg, uu____3887)))::[] -> begin
arg
end
| uu____3928 -> begin
tm
end))
end
| uu____3937 -> begin
(

let uu____3938 = (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.not_lid)
in (match (uu____3938) with
| true -> begin
(

let uu____3939 = (FStar_All.pipe_right args (FStar_List.map simplify))
in (match (uu____3939) with
| ((Some (true), uu____3972))::[] -> begin
(w FStar_Syntax_Util.t_false)
end
| ((Some (false), uu____3996))::[] -> begin
(w FStar_Syntax_Util.t_true)
end
| uu____4020 -> begin
tm
end))
end
| uu____4029 -> begin
(

let uu____4030 = ((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.forall_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.exists_lid))
in (match (uu____4030) with
| true -> begin
(match (args) with
| (((t, _))::[]) | (((_, Some (FStar_Syntax_Syntax.Implicit (_))))::((t, _))::[]) -> begin
(

let uu____4071 = (

let uu____4072 = (FStar_Syntax_Subst.compress t)
in uu____4072.FStar_Syntax_Syntax.n)
in (match (uu____4071) with
| FStar_Syntax_Syntax.Tm_abs ((uu____4075)::[], body, uu____4077) -> begin
(match ((simp_t body)) with
| Some (true) -> begin
(w FStar_Syntax_Util.t_true)
end
| Some (false) -> begin
(w FStar_Syntax_Util.t_false)
end
| uu____4103 -> begin
tm
end)
end
| uu____4105 -> begin
tm
end))
end
| uu____4106 -> begin
tm
end)
end
| uu____4112 -> begin
(reduce_equality cfg tm)
end))
end))
end))
end))
end))
end
| uu____4113 -> begin
tm
end)
end)))))))


let is_norm_request = (fun hd1 args -> (

let uu____4128 = (

let uu____4132 = (

let uu____4133 = (FStar_Syntax_Util.un_uinst hd1)
in uu____4133.FStar_Syntax_Syntax.n)
in ((uu____4132), (args)))
in (match (uu____4128) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), (uu____4138)::(uu____4139)::[]) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.normalize_term)
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), (uu____4142)::[]) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.normalize)
end
| uu____4144 -> begin
false
end)))


let get_norm_request = (fun args -> (match (args) with
| ((_)::((tm, _))::[]) | (((tm, _))::[]) -> begin
tm
end
| uu____4177 -> begin
(failwith "Impossible")
end))


let is_reify_head : stack_elt Prims.list  ->  Prims.bool = (fun uu___134_4184 -> (match (uu___134_4184) with
| (App ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = uu____4186; FStar_Syntax_Syntax.pos = uu____4187; FStar_Syntax_Syntax.vars = uu____4188}, uu____4189, uu____4190))::uu____4191 -> begin
true
end
| uu____4197 -> begin
false
end))


let is_fstar_tactics_quote : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____4202 = (

let uu____4203 = (FStar_Syntax_Util.un_uinst t)
in uu____4203.FStar_Syntax_Syntax.n)
in (match (uu____4202) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.fstar_tactics_quote_lid)
end
| uu____4207 -> begin
false
end)))


let rec norm : cfg  ->  env  ->  stack  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env stack1 t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (

let firstn = (fun k l -> (match (((FStar_List.length l) < k)) with
| true -> begin
((l), ([]))
end
| uu____4321 -> begin
(FStar_Util.first_N k l)
end))
in ((log cfg (fun uu____4323 -> (

let uu____4324 = (FStar_Syntax_Print.tag_of_term t1)
in (

let uu____4325 = (FStar_Syntax_Print.term_to_string t1)
in (

let uu____4326 = (

let uu____4327 = (

let uu____4329 = (firstn (Prims.parse_int "4") stack1)
in (FStar_All.pipe_left Prims.fst uu____4329))
in (stack_to_string uu____4327))
in (FStar_Util.print3 ">>> %s\nNorm %s with top of the stack %s \n" uu____4324 uu____4325 uu____4326))))));
(match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____4341) -> begin
(failwith "Impossible")
end
| (FStar_Syntax_Syntax.Tm_unknown) | (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = FStar_Syntax_Syntax.Delta_constant; FStar_Syntax_Syntax.fv_qual = _})) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Data_ctor)})) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Record_ctor (_))})) -> begin
(rebuild cfg env stack1 t1)
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = uu____4373; FStar_Syntax_Syntax.pos = uu____4374; FStar_Syntax_Syntax.vars = uu____4375}, uu____4376) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.fstar_tactics_embed_lid) -> begin
(rebuild cfg env stack1 t1)
end
| FStar_Syntax_Syntax.Tm_app (hd1, args) when (is_fstar_tactics_quote hd1) -> begin
(

let args1 = (closures_as_args_delayed cfg env args)
in (

let t2 = (

let uu___158_4416 = t1
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_app (((hd1), (args1))); FStar_Syntax_Syntax.tk = uu___158_4416.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___158_4416.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___158_4416.FStar_Syntax_Syntax.vars})
in (

let t3 = (reduce_primops cfg t2)
in (rebuild cfg env stack1 t3))))
end
| FStar_Syntax_Syntax.Tm_app (hd1, args) when (((

let uu____4445 = (FStar_All.pipe_right cfg.steps (FStar_List.contains NoFullNorm))
in (not (uu____4445))) && (is_norm_request hd1 args)) && (not ((FStar_Ident.lid_equals cfg.tcenv.FStar_TypeChecker_Env.curmodule FStar_Syntax_Const.prims_lid)))) -> begin
(

let tm = (get_norm_request args)
in (

let s = (Reify)::(Beta)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(Zeta)::(Iota)::(Primops)::[]
in (

let cfg' = (

let uu___159_4458 = cfg
in {steps = s; tcenv = uu___159_4458.tcenv; delta_level = (FStar_TypeChecker_Env.Unfold (FStar_Syntax_Syntax.Delta_constant))::[]; primitive_steps = uu___159_4458.primitive_steps})
in (

let stack' = (Debug (t1))::(Steps (((cfg.steps), (cfg.primitive_steps), (cfg.delta_level))))::stack1
in (norm cfg' env stack' tm)))))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = uu____4463; FStar_Syntax_Syntax.pos = uu____4464; FStar_Syntax_Syntax.vars = uu____4465}, (a1)::(a2)::rest) -> begin
(

let uu____4499 = (FStar_Syntax_Util.head_and_args t1)
in (match (uu____4499) with
| (hd1, uu____4510) -> begin
(

let t' = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((hd1), ((a1)::[])))) None t1.FStar_Syntax_Syntax.pos)
in (

let t2 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((t'), ((a2)::rest)))) None t1.FStar_Syntax_Syntax.pos)
in (norm cfg env stack1 t2)))
end))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (uu____4565)); FStar_Syntax_Syntax.tk = uu____4566; FStar_Syntax_Syntax.pos = uu____4567; FStar_Syntax_Syntax.vars = uu____4568}, (a)::[]) when ((FStar_All.pipe_right cfg.steps (FStar_List.contains Reify)) && (is_reify_head stack1)) -> begin
(

let uu____4591 = (FStar_List.tl stack1)
in (norm cfg env uu____4591 (Prims.fst a)))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = uu____4594; FStar_Syntax_Syntax.pos = uu____4595; FStar_Syntax_Syntax.vars = uu____4596}, (a)::[]) when (FStar_All.pipe_right cfg.steps (FStar_List.contains Reify)) -> begin
(

let uu____4619 = (FStar_Syntax_Util.head_and_args t1)
in (match (uu____4619) with
| (reify_head, uu____4630) -> begin
(

let a1 = (

let uu____4646 = (FStar_All.pipe_left FStar_Syntax_Util.unascribe (Prims.fst a))
in (FStar_Syntax_Subst.compress uu____4646))
in (match (a1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (uu____4649)); FStar_Syntax_Syntax.tk = uu____4650; FStar_Syntax_Syntax.pos = uu____4651; FStar_Syntax_Syntax.vars = uu____4652}, (a2)::[]) -> begin
(norm cfg env stack1 (Prims.fst a2))
end
| uu____4677 -> begin
(

let stack2 = (App (((reify_head), (None), (t1.FStar_Syntax_Syntax.pos))))::stack1
in (norm cfg env stack2 a1))
end))
end))
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(

let u1 = (norm_universe cfg env u)
in (

let uu____4685 = (mk (FStar_Syntax_Syntax.Tm_type (u1)) t1.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack1 uu____4685)))
end
| FStar_Syntax_Syntax.Tm_uinst (t', us) -> begin
(

let uu____4692 = (FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses))
in (match (uu____4692) with
| true -> begin
(norm cfg env stack1 t')
end
| uu____4693 -> begin
(

let us1 = (

let uu____4695 = (

let uu____4699 = (FStar_List.map (norm_universe cfg env) us)
in ((uu____4699), (t1.FStar_Syntax_Syntax.pos)))
in UnivArgs (uu____4695))
in (

let stack2 = (us1)::stack1
in (norm cfg env stack2 t')))
end))
end
| FStar_Syntax_Syntax.Tm_fvar (f) -> begin
(

let t0 = t1
in (

let should_delta = (FStar_All.pipe_right cfg.delta_level (FStar_Util.for_some (fun uu___135_4708 -> (match (uu___135_4708) with
| FStar_TypeChecker_Env.NoDelta -> begin
false
end
| (FStar_TypeChecker_Env.Inlining) | (FStar_TypeChecker_Env.Eager_unfolding_only) -> begin
true
end
| FStar_TypeChecker_Env.Unfold (l) -> begin
(FStar_TypeChecker_Common.delta_depth_greater_than f.FStar_Syntax_Syntax.fv_delta l)
end))))
in (match ((not (should_delta))) with
| true -> begin
(rebuild cfg env stack1 t1)
end
| uu____4710 -> begin
(

let r_env = (

let uu____4712 = (FStar_Syntax_Syntax.range_of_fv f)
in (FStar_TypeChecker_Env.set_range cfg.tcenv uu____4712))
in (

let uu____4713 = (FStar_TypeChecker_Env.lookup_definition cfg.delta_level r_env f.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____4713) with
| None -> begin
((log cfg (fun uu____4724 -> (FStar_Util.print "Tm_fvar case 2\n" [])));
(rebuild cfg env stack1 t1);
)
end
| Some (us, t2) -> begin
((log cfg (fun uu____4730 -> (

let uu____4731 = (FStar_Syntax_Print.term_to_string t0)
in (

let uu____4732 = (FStar_Syntax_Print.term_to_string t2)
in (FStar_Util.print2 ">>> Unfolded %s to %s\n" uu____4731 uu____4732)))));
(

let n1 = (FStar_List.length us)
in (match ((n1 > (Prims.parse_int "0"))) with
| true -> begin
(match (stack1) with
| (UnivArgs (us', uu____4739))::stack2 -> begin
(

let env1 = (FStar_All.pipe_right us' (FStar_List.fold_left (fun env1 u -> (Univ (u))::env1) env))
in (norm cfg env1 stack2 t2))
end
| uu____4752 when (FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses)) -> begin
(norm cfg env stack1 t2)
end
| uu____4753 -> begin
(

let uu____4754 = (

let uu____4755 = (FStar_Syntax_Print.lid_to_string f.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (FStar_Util.format1 "Impossible: missing universe instantiation on %s" uu____4755))
in (failwith uu____4754))
end)
end
| uu____4760 -> begin
(norm cfg env stack1 t2)
end));
)
end)))
end)))
end
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(

let uu____4762 = (lookup_bvar env x)
in (match (uu____4762) with
| Univ (uu____4763) -> begin
(failwith "Impossible: term variable is bound to a universe")
end
| Dummy -> begin
(failwith "Term variable not found")
end
| Clos (env1, t0, r, fix) -> begin
(match (((not (fix)) || (not ((FStar_List.contains (Exclude (Zeta)) cfg.steps))))) with
| true -> begin
(

let uu____4778 = (FStar_ST.read r)
in (match (uu____4778) with
| Some (env2, t') -> begin
((log cfg (fun uu____4797 -> (

let uu____4798 = (FStar_Syntax_Print.term_to_string t1)
in (

let uu____4799 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print2 "Lazy hit: %s cached to %s\n" uu____4798 uu____4799)))));
(

let uu____4800 = (

let uu____4801 = (FStar_Syntax_Subst.compress t')
in uu____4801.FStar_Syntax_Syntax.n)
in (match (uu____4800) with
| FStar_Syntax_Syntax.Tm_abs (uu____4804) -> begin
(norm cfg env2 stack1 t')
end
| uu____4819 -> begin
(rebuild cfg env2 stack1 t')
end));
)
end
| None -> begin
(norm cfg env1 ((MemoLazy (r))::stack1) t0)
end))
end
| uu____4826 -> begin
(norm cfg env1 stack1 t0)
end)
end))
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, lopt) -> begin
(match (stack1) with
| (UnivArgs (uu____4852))::uu____4853 -> begin
(failwith "Ill-typed term: universes cannot be applied to term abstraction")
end
| (Match (uu____4858))::uu____4859 -> begin
(failwith "Ill-typed term: cannot pattern match an abstraction")
end
| (Arg (c, uu____4865, uu____4866))::stack_rest -> begin
(match (c) with
| Univ (uu____4869) -> begin
(norm cfg ((c)::env) stack_rest t1)
end
| uu____4870 -> begin
(match (bs) with
| [] -> begin
(failwith "Impossible")
end
| (uu____4873)::[] -> begin
(match (lopt) with
| None when (FStar_Options.__unit_tests ()) -> begin
((log cfg (fun uu____4886 -> (

let uu____4887 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" uu____4887))));
(norm cfg ((c)::env) stack_rest body);
)
end
| Some (FStar_Util.Inr (l, cflags)) when (((FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Tot_lid) || (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GTot_lid)) || (FStar_All.pipe_right cflags (FStar_Util.for_some (fun uu___136_4901 -> (match (uu___136_4901) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| uu____4902 -> begin
false
end))))) -> begin
((log cfg (fun uu____4904 -> (

let uu____4905 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" uu____4905))));
(norm cfg ((c)::env) stack_rest body);
)
end
| Some (FStar_Util.Inl (lc)) when (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc) -> begin
((log cfg (fun uu____4916 -> (

let uu____4917 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" uu____4917))));
(norm cfg ((c)::env) stack_rest body);
)
end
| uu____4918 when (FStar_All.pipe_right cfg.steps (FStar_List.contains Reify)) -> begin
(norm cfg ((c)::env) stack_rest body)
end
| uu____4925 -> begin
(

let cfg1 = (

let uu___160_4933 = cfg
in {steps = (WHNF)::(Exclude (Iota))::(Exclude (Zeta))::cfg.steps; tcenv = uu___160_4933.tcenv; delta_level = uu___160_4933.delta_level; primitive_steps = uu___160_4933.primitive_steps})
in (

let uu____4934 = (closure_as_term cfg1 env t1)
in (rebuild cfg1 env stack1 uu____4934)))
end)
end
| (uu____4935)::tl1 -> begin
((log cfg (fun uu____4945 -> (

let uu____4946 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" uu____4946))));
(

let body1 = (mk (FStar_Syntax_Syntax.Tm_abs (((tl1), (body), (lopt)))) t1.FStar_Syntax_Syntax.pos)
in (norm cfg ((c)::env) stack_rest body1));
)
end)
end)
end
| (Steps (s, ps, dl))::stack2 -> begin
(norm (

let uu___161_4970 = cfg
in {steps = s; tcenv = uu___161_4970.tcenv; delta_level = dl; primitive_steps = ps}) env stack2 t1)
end
| (MemoLazy (r))::stack2 -> begin
((set_memo r ((env), (t1)));
(log cfg (fun uu____4983 -> (

let uu____4984 = (FStar_Syntax_Print.term_to_string t1)
in (FStar_Util.print1 "\tSet memo %s\n" uu____4984))));
(norm cfg env stack2 t1);
)
end
| ((Debug (_))::_) | ((Meta (_))::_) | ((Let (_))::_) | ((App (_))::_) | ((Abs (_))::_) | ([]) -> begin
(match ((FStar_List.contains WHNF cfg.steps)) with
| true -> begin
(

let uu____4995 = (closure_as_term cfg env t1)
in (rebuild cfg env stack1 uu____4995))
end
| uu____4996 -> begin
(

let uu____4997 = (FStar_Syntax_Subst.open_term' bs body)
in (match (uu____4997) with
| (bs1, body1, opening) -> begin
(

let lopt1 = (match (lopt) with
| Some (FStar_Util.Inl (l)) -> begin
(

let uu____5026 = (

let uu____5032 = (

let uu____5033 = (

let uu____5034 = (l.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Subst.subst_comp opening uu____5034))
in (FStar_All.pipe_right uu____5033 FStar_Syntax_Util.lcomp_of_comp))
in (FStar_All.pipe_right uu____5032 (fun _0_30 -> FStar_Util.Inl (_0_30))))
in (FStar_All.pipe_right uu____5026 (fun _0_31 -> Some (_0_31))))
end
| uu____5059 -> begin
lopt
end)
in (

let env' = (FStar_All.pipe_right bs1 (FStar_List.fold_left (fun env1 uu____5073 -> (Dummy)::env1) env))
in ((log cfg (fun uu____5078 -> (

let uu____5079 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs1))
in (FStar_Util.print1 "\tShifted %s dummies\n" uu____5079))));
(

let stack2 = (Steps (((cfg.steps), (cfg.primitive_steps), (cfg.delta_level))))::stack1
in (

let cfg1 = (

let uu___162_5089 = cfg
in (

let uu____5090 = (FStar_List.filter (fun ps -> ps.strong_reduction_ok) cfg.primitive_steps)
in {steps = uu___162_5089.steps; tcenv = uu___162_5089.tcenv; delta_level = uu___162_5089.delta_level; primitive_steps = uu____5090}))
in (norm cfg1 env' ((Abs (((env), (bs1), (env'), (lopt1), (t1.FStar_Syntax_Syntax.pos))))::stack2) body1)));
)))
end))
end)
end)
end
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let stack2 = (FStar_All.pipe_right stack1 (FStar_List.fold_right (fun uu____5122 stack2 -> (match (uu____5122) with
| (a, aq) -> begin
(

let uu____5130 = (

let uu____5131 = (

let uu____5135 = (

let uu____5136 = (

let uu____5146 = (FStar_Util.mk_ref None)
in ((env), (a), (uu____5146), (false)))
in Clos (uu____5136))
in ((uu____5135), (aq), (t1.FStar_Syntax_Syntax.pos)))
in Arg (uu____5131))
in (uu____5130)::stack2)
end)) args))
in ((log cfg (fun uu____5168 -> (

let uu____5169 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length args))
in (FStar_Util.print1 "\tPushed %s arguments\n" uu____5169))));
(norm cfg env stack2 head1);
))
end
| FStar_Syntax_Syntax.Tm_refine (x, f) -> begin
(match ((FStar_List.contains WHNF cfg.steps)) with
| true -> begin
(match (((env), (stack1))) with
| ([], []) -> begin
(

let t_x = (norm cfg env [] x.FStar_Syntax_Syntax.sort)
in (

let t2 = (mk (FStar_Syntax_Syntax.Tm_refine ((((

let uu___163_5190 = x
in {FStar_Syntax_Syntax.ppname = uu___163_5190.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___163_5190.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t_x})), (f)))) t1.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack1 t2)))
end
| uu____5191 -> begin
(

let uu____5194 = (closure_as_term cfg env t1)
in (rebuild cfg env stack1 uu____5194))
end)
end
| uu____5195 -> begin
(

let t_x = (norm cfg env [] x.FStar_Syntax_Syntax.sort)
in (

let uu____5197 = (FStar_Syntax_Subst.open_term ((((x), (None)))::[]) f)
in (match (uu____5197) with
| (closing, f1) -> begin
(

let f2 = (norm cfg ((Dummy)::env) [] f1)
in (

let t2 = (

let uu____5213 = (

let uu____5214 = (

let uu____5219 = (FStar_Syntax_Subst.close closing f2)
in (((

let uu___164_5220 = x
in {FStar_Syntax_Syntax.ppname = uu___164_5220.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___164_5220.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t_x})), (uu____5219)))
in FStar_Syntax_Syntax.Tm_refine (uu____5214))
in (mk uu____5213 t1.FStar_Syntax_Syntax.pos))
in (rebuild cfg env stack1 t2)))
end)))
end)
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(match ((FStar_List.contains WHNF cfg.steps)) with
| true -> begin
(

let uu____5233 = (closure_as_term cfg env t1)
in (rebuild cfg env stack1 uu____5233))
end
| uu____5234 -> begin
(

let uu____5235 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____5235) with
| (bs1, c1) -> begin
(

let c2 = (

let uu____5241 = (FStar_All.pipe_right bs1 (FStar_List.fold_left (fun env1 uu____5247 -> (Dummy)::env1) env))
in (norm_comp cfg uu____5241 c1))
in (

let t2 = (

let uu____5254 = (norm_binders cfg env bs1)
in (FStar_Syntax_Util.arrow uu____5254 c2))
in (rebuild cfg env stack1 t2)))
end))
end)
end
| FStar_Syntax_Syntax.Tm_ascribed (t11, (tc, tacopt), l) -> begin
(match (stack1) with
| ((Match (_))::_) | ((Arg (_))::_) | ((App ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _, _))::_) | ((MemoLazy (_))::_) -> begin
(norm cfg env stack1 t11)
end
| uu____5311 -> begin
(

let t12 = (norm cfg env [] t11)
in ((log cfg (fun uu____5314 -> (FStar_Util.print_string "+++ Normalizing ascription \n")));
(

let tc1 = (match (tc) with
| FStar_Util.Inl (t2) -> begin
(

let uu____5327 = (norm cfg env [] t2)
in FStar_Util.Inl (uu____5327))
end
| FStar_Util.Inr (c) -> begin
(

let uu____5335 = (norm_comp cfg env c)
in FStar_Util.Inr (uu____5335))
end)
in (

let tacopt1 = (FStar_Util.map_opt tacopt (norm cfg env []))
in (

let uu____5340 = (mk (FStar_Syntax_Syntax.Tm_ascribed (((t12), (((tc1), (tacopt1))), (l)))) t1.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack1 uu____5340))));
))
end)
end
| FStar_Syntax_Syntax.Tm_match (head1, branches) -> begin
(

let stack2 = (Match (((env), (branches), (t1.FStar_Syntax_Syntax.pos))))::stack1
in (norm cfg env stack2 head1))
end
| FStar_Syntax_Syntax.Tm_let ((uu____5391, ({FStar_Syntax_Syntax.lbname = FStar_Util.Inr (uu____5392); FStar_Syntax_Syntax.lbunivs = uu____5393; FStar_Syntax_Syntax.lbtyp = uu____5394; FStar_Syntax_Syntax.lbeff = uu____5395; FStar_Syntax_Syntax.lbdef = uu____5396})::uu____5397), uu____5398) -> begin
(rebuild cfg env stack1 t1)
end
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let n1 = (FStar_TypeChecker_Env.norm_eff_name cfg.tcenv lb.FStar_Syntax_Syntax.lbeff)
in (

let uu____5424 = ((

let uu____5425 = (FStar_All.pipe_right cfg.steps (FStar_List.contains NoDeltaSteps))
in (not (uu____5425))) && ((FStar_Syntax_Util.is_pure_effect n1) || ((FStar_Syntax_Util.is_ghost_effect n1) && (

let uu____5426 = (FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations))
in (not (uu____5426))))))
in (match (uu____5424) with
| true -> begin
(

let env1 = (

let uu____5429 = (

let uu____5430 = (

let uu____5440 = (FStar_Util.mk_ref None)
in ((env), (lb.FStar_Syntax_Syntax.lbdef), (uu____5440), (false)))
in Clos (uu____5430))
in (uu____5429)::env)
in (norm cfg env1 stack1 body))
end
| uu____5463 -> begin
(

let uu____5464 = (

let uu____5467 = (

let uu____5468 = (

let uu____5469 = (FStar_All.pipe_right lb.FStar_Syntax_Syntax.lbname FStar_Util.left)
in (FStar_All.pipe_right uu____5469 FStar_Syntax_Syntax.mk_binder))
in (uu____5468)::[])
in (FStar_Syntax_Subst.open_term uu____5467 body))
in (match (uu____5464) with
| (bs, body1) -> begin
(

let lb1 = (

let uu___165_5475 = lb
in (

let uu____5476 = (

let uu____5479 = (

let uu____5480 = (FStar_List.hd bs)
in (FStar_All.pipe_right uu____5480 Prims.fst))
in (FStar_All.pipe_right uu____5479 (fun _0_32 -> FStar_Util.Inl (_0_32))))
in (

let uu____5489 = (norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp)
in (

let uu____5492 = (norm cfg env [] lb.FStar_Syntax_Syntax.lbdef)
in {FStar_Syntax_Syntax.lbname = uu____5476; FStar_Syntax_Syntax.lbunivs = uu___165_5475.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = uu____5489; FStar_Syntax_Syntax.lbeff = uu___165_5475.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = uu____5492}))))
in (

let env' = (FStar_All.pipe_right bs (FStar_List.fold_left (fun env1 uu____5502 -> (Dummy)::env1) env))
in (norm cfg env' ((Let (((env), (bs), (lb1), (t1.FStar_Syntax_Syntax.pos))))::stack1) body1)))
end))
end)))
end
| FStar_Syntax_Syntax.Tm_let (lbs, body) when (FStar_List.contains (Exclude (Zeta)) cfg.steps) -> begin
(

let uu____5518 = (closure_as_term cfg env t1)
in (rebuild cfg env stack1 uu____5518))
end
| FStar_Syntax_Syntax.Tm_let (lbs, body) -> begin
(

let uu____5531 = (FStar_List.fold_right (fun lb uu____5553 -> (match (uu____5553) with
| (rec_env, memos, i) -> begin
(

let f_i = (

let uu____5592 = (

let uu___166_5593 = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in {FStar_Syntax_Syntax.ppname = uu___166_5593.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = i; FStar_Syntax_Syntax.sort = uu___166_5593.FStar_Syntax_Syntax.sort})
in (FStar_Syntax_Syntax.bv_to_tm uu____5592))
in (

let fix_f_i = (mk (FStar_Syntax_Syntax.Tm_let (((lbs), (f_i)))) t1.FStar_Syntax_Syntax.pos)
in (

let memo = (FStar_Util.mk_ref None)
in (

let rec_env1 = (Clos (((env), (fix_f_i), (memo), (true))))::rec_env
in ((rec_env1), ((memo)::memos), ((i + (Prims.parse_int "1"))))))))
end)) (Prims.snd lbs) ((env), ([]), ((Prims.parse_int "0"))))
in (match (uu____5531) with
| (rec_env, memos, uu____5653) -> begin
(

let uu____5668 = (FStar_List.map2 (fun lb memo -> (FStar_ST.write memo (Some (((rec_env), (lb.FStar_Syntax_Syntax.lbdef)))))) (Prims.snd lbs) memos)
in (

let body_env = (FStar_List.fold_right (fun lb env1 -> (

let uu____5710 = (

let uu____5711 = (

let uu____5721 = (FStar_Util.mk_ref None)
in ((rec_env), (lb.FStar_Syntax_Syntax.lbdef), (uu____5721), (false)))
in Clos (uu____5711))
in (uu____5710)::env1)) (Prims.snd lbs) env)
in (norm cfg body_env stack1 body)))
end))
end
| FStar_Syntax_Syntax.Tm_meta (head1, m) -> begin
(match (m) with
| FStar_Syntax_Syntax.Meta_monadic (m1, t2) -> begin
(

let should_reify = (match (stack1) with
| (App ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = uu____5759; FStar_Syntax_Syntax.pos = uu____5760; FStar_Syntax_Syntax.vars = uu____5761}, uu____5762, uu____5763))::uu____5764 -> begin
(FStar_All.pipe_right cfg.steps (FStar_List.contains Reify))
end
| uu____5770 -> begin
false
end)
in (match ((not (should_reify))) with
| true -> begin
(

let t3 = (norm cfg env [] t2)
in (

let stack2 = (Steps (((cfg.steps), (cfg.primitive_steps), (cfg.delta_level))))::stack1
in (

let cfg1 = (

let uu____5777 = (FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations))
in (match (uu____5777) with
| true -> begin
(

let uu___167_5778 = cfg
in {steps = (PureSubtermsWithinComputations)::(Primops)::(AllowUnboundUniverses)::(EraseUniverses)::(Exclude (Zeta))::(NoDeltaSteps)::[]; tcenv = uu___167_5778.tcenv; delta_level = (FStar_TypeChecker_Env.Inlining)::(FStar_TypeChecker_Env.Eager_unfolding_only)::[]; primitive_steps = uu___167_5778.primitive_steps})
end
| uu____5779 -> begin
(

let uu___168_5780 = cfg
in {steps = (FStar_List.append ((NoDeltaSteps)::(Exclude (Zeta))::[]) cfg.steps); tcenv = uu___168_5780.tcenv; delta_level = (FStar_TypeChecker_Env.NoDelta)::[]; primitive_steps = uu___168_5780.primitive_steps})
end))
in (norm cfg1 env ((Meta (((FStar_Syntax_Syntax.Meta_monadic (((m1), (t3)))), (t3.FStar_Syntax_Syntax.pos))))::stack2) head1))))
end
| uu____5781 -> begin
(

let uu____5782 = (

let uu____5783 = (FStar_Syntax_Subst.compress head1)
in uu____5783.FStar_Syntax_Syntax.n)
in (match (uu____5782) with
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let ed = (FStar_TypeChecker_Env.get_effect_decl cfg.tcenv m1)
in (

let uu____5797 = ed.FStar_Syntax_Syntax.bind_repr
in (match (uu____5797) with
| (uu____5798, bind_repr) -> begin
(match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inr (uu____5802) -> begin
(failwith "Cannot reify a top-level let binding")
end
| FStar_Util.Inl (x) -> begin
(

let is_return = (fun e -> (

let uu____5809 = (

let uu____5810 = (FStar_Syntax_Subst.compress e)
in uu____5810.FStar_Syntax_Syntax.n)
in (match (uu____5809) with
| FStar_Syntax_Syntax.Tm_meta (e1, FStar_Syntax_Syntax.Meta_monadic (uu____5815, uu____5816)) -> begin
(

let uu____5825 = (

let uu____5826 = (FStar_Syntax_Subst.compress e1)
in uu____5826.FStar_Syntax_Syntax.n)
in (match (uu____5825) with
| FStar_Syntax_Syntax.Tm_meta (e2, FStar_Syntax_Syntax.Meta_monadic_lift (uu____5831, msrc, uu____5833)) when (FStar_Syntax_Util.is_pure_effect msrc) -> begin
(

let uu____5842 = (FStar_Syntax_Subst.compress e2)
in Some (uu____5842))
end
| uu____5843 -> begin
None
end))
end
| uu____5844 -> begin
None
end)))
in (

let uu____5845 = (is_return lb.FStar_Syntax_Syntax.lbdef)
in (match (uu____5845) with
| Some (e) -> begin
(

let lb1 = (

let uu___169_5849 = lb
in {FStar_Syntax_Syntax.lbname = uu___169_5849.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = uu___169_5849.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = uu___169_5849.FStar_Syntax_Syntax.lbtyp; FStar_Syntax_Syntax.lbeff = FStar_Syntax_Const.effect_PURE_lid; FStar_Syntax_Syntax.lbdef = e})
in (

let uu____5850 = (FStar_List.tl stack1)
in (

let uu____5851 = (

let uu____5852 = (

let uu____5855 = (

let uu____5856 = (

let uu____5864 = (FStar_Syntax_Util.mk_reify body)
in ((((false), ((lb1)::[]))), (uu____5864)))
in FStar_Syntax_Syntax.Tm_let (uu____5856))
in (FStar_Syntax_Syntax.mk uu____5855))
in (uu____5852 None head1.FStar_Syntax_Syntax.pos))
in (norm cfg env uu____5850 uu____5851))))
end
| None -> begin
(

let uu____5881 = (

let uu____5882 = (is_return body)
in (match (uu____5882) with
| Some ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_bvar (y); FStar_Syntax_Syntax.tk = uu____5885; FStar_Syntax_Syntax.pos = uu____5886; FStar_Syntax_Syntax.vars = uu____5887}) -> begin
(FStar_Syntax_Syntax.bv_eq x y)
end
| uu____5892 -> begin
false
end))
in (match (uu____5881) with
| true -> begin
(norm cfg env stack1 lb.FStar_Syntax_Syntax.lbdef)
end
| uu____5894 -> begin
(

let head2 = (FStar_All.pipe_left FStar_Syntax_Util.mk_reify lb.FStar_Syntax_Syntax.lbdef)
in (

let body1 = (FStar_All.pipe_left FStar_Syntax_Util.mk_reify body)
in (

let body2 = (

let uu____5912 = (

let uu____5915 = (

let uu____5916 = (

let uu____5931 = (

let uu____5933 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____5933)::[])
in ((uu____5931), (body1), (Some (FStar_Util.Inr (((m1), ([])))))))
in FStar_Syntax_Syntax.Tm_abs (uu____5916))
in (FStar_Syntax_Syntax.mk uu____5915))
in (uu____5912 None body1.FStar_Syntax_Syntax.pos))
in (

let close1 = (closure_as_term cfg env)
in (

let bind_inst = (

let uu____5966 = (

let uu____5967 = (FStar_Syntax_Subst.compress bind_repr)
in uu____5967.FStar_Syntax_Syntax.n)
in (match (uu____5966) with
| FStar_Syntax_Syntax.Tm_uinst (bind1, (uu____5973)::(uu____5974)::[]) -> begin
(

let uu____5980 = (

let uu____5983 = (

let uu____5984 = (

let uu____5989 = (

let uu____5991 = (

let uu____5992 = (close1 lb.FStar_Syntax_Syntax.lbtyp)
in (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv uu____5992))
in (

let uu____5993 = (

let uu____5995 = (

let uu____5996 = (close1 t2)
in (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv uu____5996))
in (uu____5995)::[])
in (uu____5991)::uu____5993))
in ((bind1), (uu____5989)))
in FStar_Syntax_Syntax.Tm_uinst (uu____5984))
in (FStar_Syntax_Syntax.mk uu____5983))
in (uu____5980 None t2.FStar_Syntax_Syntax.pos))
end
| uu____6008 -> begin
(failwith "NIY : Reification of indexed effects")
end))
in (

let reified = (

let uu____6014 = (

let uu____6017 = (

let uu____6018 = (

let uu____6028 = (

let uu____6030 = (FStar_Syntax_Syntax.as_arg lb.FStar_Syntax_Syntax.lbtyp)
in (

let uu____6031 = (

let uu____6033 = (FStar_Syntax_Syntax.as_arg t2)
in (

let uu____6034 = (

let uu____6036 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (

let uu____6037 = (

let uu____6039 = (FStar_Syntax_Syntax.as_arg head2)
in (

let uu____6040 = (

let uu____6042 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (

let uu____6043 = (

let uu____6045 = (FStar_Syntax_Syntax.as_arg body2)
in (uu____6045)::[])
in (uu____6042)::uu____6043))
in (uu____6039)::uu____6040))
in (uu____6036)::uu____6037))
in (uu____6033)::uu____6034))
in (uu____6030)::uu____6031))
in ((bind_inst), (uu____6028)))
in FStar_Syntax_Syntax.Tm_app (uu____6018))
in (FStar_Syntax_Syntax.mk uu____6017))
in (uu____6014 None t2.FStar_Syntax_Syntax.pos))
in (

let uu____6057 = (FStar_List.tl stack1)
in (norm cfg env uu____6057 reified))))))))
end))
end)))
end)
end)))
end
| FStar_Syntax_Syntax.Tm_app (head_app, args) -> begin
(

let ed = (FStar_TypeChecker_Env.get_effect_decl cfg.tcenv m1)
in (

let uu____6075 = ed.FStar_Syntax_Syntax.bind_repr
in (match (uu____6075) with
| (uu____6076, bind_repr) -> begin
(

let maybe_unfold_action = (fun head2 -> (

let maybe_extract_fv = (fun t3 -> (

let t4 = (

let uu____6099 = (

let uu____6100 = (FStar_Syntax_Subst.compress t3)
in uu____6100.FStar_Syntax_Syntax.n)
in (match (uu____6099) with
| FStar_Syntax_Syntax.Tm_uinst (t4, uu____6106) -> begin
t4
end
| uu____6111 -> begin
head2
end))
in (

let uu____6112 = (

let uu____6113 = (FStar_Syntax_Subst.compress t4)
in uu____6113.FStar_Syntax_Syntax.n)
in (match (uu____6112) with
| FStar_Syntax_Syntax.Tm_fvar (x) -> begin
Some (x)
end
| uu____6118 -> begin
None
end))))
in (

let uu____6119 = (maybe_extract_fv head2)
in (match (uu____6119) with
| Some (x) when (

let uu____6125 = (FStar_Syntax_Syntax.lid_of_fv x)
in (FStar_TypeChecker_Env.is_action cfg.tcenv uu____6125)) -> begin
(

let head3 = (norm cfg env [] head2)
in (

let action_unfolded = (

let uu____6129 = (maybe_extract_fv head3)
in (match (uu____6129) with
| Some (uu____6132) -> begin
Some (true)
end
| uu____6133 -> begin
Some (false)
end))
in ((head3), (action_unfolded))))
end
| uu____6136 -> begin
((head2), (None))
end))))
in ((

let is_arg_impure = (fun uu____6147 -> (match (uu____6147) with
| (e, q) -> begin
(

let uu____6152 = (

let uu____6153 = (FStar_Syntax_Subst.compress e)
in uu____6153.FStar_Syntax_Syntax.n)
in (match (uu____6152) with
| FStar_Syntax_Syntax.Tm_meta (e0, FStar_Syntax_Syntax.Meta_monadic_lift (m11, m2, t')) -> begin
(not ((FStar_Syntax_Util.is_pure_effect m11)))
end
| uu____6168 -> begin
false
end))
end))
in (

let uu____6169 = (

let uu____6170 = (

let uu____6174 = (FStar_Syntax_Syntax.as_arg head_app)
in (uu____6174)::args)
in (FStar_Util.for_some is_arg_impure uu____6170))
in (match (uu____6169) with
| true -> begin
(

let uu____6177 = (

let uu____6178 = (FStar_Syntax_Print.term_to_string head1)
in (FStar_Util.format1 "Incompability between typechecker and normalizer; this monadic application contains impure terms %s\n" uu____6178))
in (failwith uu____6177))
end
| uu____6179 -> begin
()
end)));
(

let uu____6180 = (maybe_unfold_action head_app)
in (match (uu____6180) with
| (head_app1, found_action) -> begin
(

let mk1 = (fun tm -> (FStar_Syntax_Syntax.mk tm None t2.FStar_Syntax_Syntax.pos))
in (

let body = (mk1 (FStar_Syntax_Syntax.Tm_app (((head_app1), (args)))))
in (

let body1 = (match (found_action) with
| None -> begin
(FStar_Syntax_Util.mk_reify body)
end
| Some (false) -> begin
(mk1 (FStar_Syntax_Syntax.Tm_meta (((body), (FStar_Syntax_Syntax.Meta_monadic (((m1), (t2))))))))
end
| Some (true) -> begin
body
end)
in (

let uu____6215 = (FStar_List.tl stack1)
in (norm cfg env uu____6215 body1)))))
end));
))
end)))
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_monadic_lift (msrc, mtgt, t')) -> begin
(

let lifted = (reify_lift cfg.tcenv e msrc mtgt t')
in (

let uu____6229 = (FStar_List.tl stack1)
in (norm cfg env uu____6229 lifted)))
end
| FStar_Syntax_Syntax.Tm_match (e, branches) -> begin
(

let branches1 = (FStar_All.pipe_right branches (FStar_List.map (fun uu____6312 -> (match (uu____6312) with
| (pat, wopt, tm) -> begin
(

let uu____6350 = (FStar_Syntax_Util.mk_reify tm)
in ((pat), (wopt), (uu____6350)))
end))))
in (

let tm = (mk (FStar_Syntax_Syntax.Tm_match (((e), (branches1)))) t2.FStar_Syntax_Syntax.pos)
in (

let uu____6376 = (FStar_List.tl stack1)
in (norm cfg env uu____6376 tm))))
end
| uu____6377 -> begin
(norm cfg env stack1 head1)
end))
end))
end
| FStar_Syntax_Syntax.Meta_monadic_lift (m1, m', t2) -> begin
(

let should_reify = (match (stack1) with
| (App ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = uu____6386; FStar_Syntax_Syntax.pos = uu____6387; FStar_Syntax_Syntax.vars = uu____6388}, uu____6389, uu____6390))::uu____6391 -> begin
(FStar_All.pipe_right cfg.steps (FStar_List.contains Reify))
end
| uu____6397 -> begin
false
end)
in (match (should_reify) with
| true -> begin
(

let uu____6398 = (FStar_List.tl stack1)
in (

let uu____6399 = (reify_lift cfg.tcenv head1 m1 m' t2)
in (norm cfg env uu____6398 uu____6399)))
end
| uu____6400 -> begin
(

let t3 = (norm cfg env [] t2)
in (

let uu____6402 = (((FStar_Syntax_Util.is_pure_effect m1) || (FStar_Syntax_Util.is_ghost_effect m1)) && (FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations)))
in (match (uu____6402) with
| true -> begin
(

let stack2 = (Steps (((cfg.steps), (cfg.primitive_steps), (cfg.delta_level))))::stack1
in (

let cfg1 = (

let uu___170_6408 = cfg
in {steps = (PureSubtermsWithinComputations)::(Primops)::(AllowUnboundUniverses)::(EraseUniverses)::(Exclude (Zeta))::[]; tcenv = uu___170_6408.tcenv; delta_level = (FStar_TypeChecker_Env.Inlining)::(FStar_TypeChecker_Env.Eager_unfolding_only)::[]; primitive_steps = uu___170_6408.primitive_steps})
in (norm cfg1 env ((Meta (((FStar_Syntax_Syntax.Meta_monadic_lift (((m1), (m'), (t3)))), (head1.FStar_Syntax_Syntax.pos))))::stack2) head1)))
end
| uu____6409 -> begin
(norm cfg env ((Meta (((FStar_Syntax_Syntax.Meta_monadic_lift (((m1), (m'), (t3)))), (head1.FStar_Syntax_Syntax.pos))))::stack1) head1)
end)))
end))
end
| uu____6410 -> begin
(match (stack1) with
| (uu____6411)::uu____6412 -> begin
(match (m) with
| FStar_Syntax_Syntax.Meta_labeled (l, r, uu____6416) -> begin
(norm cfg env ((Meta (((m), (r))))::stack1) head1)
end
| FStar_Syntax_Syntax.Meta_pattern (args) -> begin
(

let args1 = (norm_pattern_args cfg env args)
in (norm cfg env ((Meta (((FStar_Syntax_Syntax.Meta_pattern (args1)), (t1.FStar_Syntax_Syntax.pos))))::stack1) head1))
end
| uu____6431 -> begin
(norm cfg env stack1 head1)
end)
end
| [] -> begin
(

let head2 = (norm cfg env [] head1)
in (

let m1 = (match (m) with
| FStar_Syntax_Syntax.Meta_pattern (args) -> begin
(

let uu____6441 = (norm_pattern_args cfg env args)
in FStar_Syntax_Syntax.Meta_pattern (uu____6441))
end
| uu____6448 -> begin
m
end)
in (

let t2 = (mk (FStar_Syntax_Syntax.Tm_meta (((head2), (m1)))) t1.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack1 t2))))
end)
end)
end);
))))
and reify_lift : FStar_TypeChecker_Env.env  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.monad_name  ->  FStar_Syntax_Syntax.monad_name  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term = (fun env e msrc mtgt t -> (match ((FStar_Syntax_Util.is_pure_effect msrc)) with
| true -> begin
(

let ed = (FStar_TypeChecker_Env.get_effect_decl env mtgt)
in (

let uu____6462 = ed.FStar_Syntax_Syntax.return_repr
in (match (uu____6462) with
| (uu____6463, return_repr) -> begin
(

let return_inst = (

let uu____6470 = (

let uu____6471 = (FStar_Syntax_Subst.compress return_repr)
in uu____6471.FStar_Syntax_Syntax.n)
in (match (uu____6470) with
| FStar_Syntax_Syntax.Tm_uinst (return_tm, (uu____6477)::[]) -> begin
(

let uu____6483 = (

let uu____6486 = (

let uu____6487 = (

let uu____6492 = (

let uu____6494 = (env.FStar_TypeChecker_Env.universe_of env t)
in (uu____6494)::[])
in ((return_tm), (uu____6492)))
in FStar_Syntax_Syntax.Tm_uinst (uu____6487))
in (FStar_Syntax_Syntax.mk uu____6486))
in (uu____6483 None e.FStar_Syntax_Syntax.pos))
end
| uu____6506 -> begin
(failwith "NIY : Reification of indexed effects")
end))
in (

let uu____6509 = (

let uu____6512 = (

let uu____6513 = (

let uu____6523 = (

let uu____6525 = (FStar_Syntax_Syntax.as_arg t)
in (

let uu____6526 = (

let uu____6528 = (FStar_Syntax_Syntax.as_arg e)
in (uu____6528)::[])
in (uu____6525)::uu____6526))
in ((return_inst), (uu____6523)))
in FStar_Syntax_Syntax.Tm_app (uu____6513))
in (FStar_Syntax_Syntax.mk uu____6512))
in (uu____6509 None e.FStar_Syntax_Syntax.pos)))
end)))
end
| uu____6540 -> begin
(

let uu____6541 = (FStar_TypeChecker_Env.monad_leq env msrc mtgt)
in (match (uu____6541) with
| None -> begin
(

let uu____6543 = (FStar_Util.format2 "Impossible : trying to reify a lift between unrelated effects (%s and %s)" (FStar_Ident.text_of_lid msrc) (FStar_Ident.text_of_lid mtgt))
in (failwith uu____6543))
end
| Some ({FStar_TypeChecker_Env.msource = uu____6544; FStar_TypeChecker_Env.mtarget = uu____6545; FStar_TypeChecker_Env.mlift = {FStar_TypeChecker_Env.mlift_wp = uu____6546; FStar_TypeChecker_Env.mlift_term = None}}) -> begin
(failwith "Impossible : trying to reify a non-reifiable lift (from %s to %s)")
end
| Some ({FStar_TypeChecker_Env.msource = uu____6557; FStar_TypeChecker_Env.mtarget = uu____6558; FStar_TypeChecker_Env.mlift = {FStar_TypeChecker_Env.mlift_wp = uu____6559; FStar_TypeChecker_Env.mlift_term = Some (lift)}}) -> begin
(

let uu____6577 = (FStar_Syntax_Util.mk_reify e)
in (lift t FStar_Syntax_Syntax.tun uu____6577))
end))
end))
and norm_pattern_args : cfg  ->  env  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list Prims.list  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list Prims.list = (fun cfg env args -> (FStar_All.pipe_right args (FStar_List.map (FStar_List.map (fun uu____6607 -> (match (uu____6607) with
| (a, imp) -> begin
(

let uu____6614 = (norm cfg env [] a)
in ((uu____6614), (imp)))
end))))))
and norm_comp : cfg  ->  env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun cfg env comp -> (

let comp1 = (ghost_to_pure_aux cfg env comp)
in (match (comp1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uopt) -> begin
(

let uu___171_6629 = comp1
in (

let uu____6632 = (

let uu____6633 = (

let uu____6639 = (norm cfg env [] t)
in (

let uu____6640 = (FStar_Option.map (norm_universe cfg env) uopt)
in ((uu____6639), (uu____6640))))
in FStar_Syntax_Syntax.Total (uu____6633))
in {FStar_Syntax_Syntax.n = uu____6632; FStar_Syntax_Syntax.tk = uu___171_6629.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___171_6629.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___171_6629.FStar_Syntax_Syntax.vars}))
end
| FStar_Syntax_Syntax.GTotal (t, uopt) -> begin
(

let uu___172_6655 = comp1
in (

let uu____6658 = (

let uu____6659 = (

let uu____6665 = (norm cfg env [] t)
in (

let uu____6666 = (FStar_Option.map (norm_universe cfg env) uopt)
in ((uu____6665), (uu____6666))))
in FStar_Syntax_Syntax.GTotal (uu____6659))
in {FStar_Syntax_Syntax.n = uu____6658; FStar_Syntax_Syntax.tk = uu___172_6655.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___172_6655.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___172_6655.FStar_Syntax_Syntax.vars}))
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let norm_args = (fun args -> (FStar_All.pipe_right args (FStar_List.map (fun uu____6697 -> (match (uu____6697) with
| (a, i) -> begin
(

let uu____6704 = (norm cfg env [] a)
in ((uu____6704), (i)))
end)))))
in (

let flags = (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags (FStar_List.map (fun uu___137_6709 -> (match (uu___137_6709) with
| FStar_Syntax_Syntax.DECREASES (t) -> begin
(

let uu____6713 = (norm cfg env [] t)
in FStar_Syntax_Syntax.DECREASES (uu____6713))
end
| f -> begin
f
end))))
in (

let uu___173_6717 = comp1
in (

let uu____6720 = (

let uu____6721 = (

let uu___174_6722 = ct
in (

let uu____6723 = (FStar_List.map (norm_universe cfg env) ct.FStar_Syntax_Syntax.comp_univs)
in (

let uu____6724 = (norm cfg env [] ct.FStar_Syntax_Syntax.result_typ)
in (

let uu____6727 = (norm_args ct.FStar_Syntax_Syntax.effect_args)
in {FStar_Syntax_Syntax.comp_univs = uu____6723; FStar_Syntax_Syntax.effect_name = uu___174_6722.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = uu____6724; FStar_Syntax_Syntax.effect_args = uu____6727; FStar_Syntax_Syntax.flags = flags}))))
in FStar_Syntax_Syntax.Comp (uu____6721))
in {FStar_Syntax_Syntax.n = uu____6720; FStar_Syntax_Syntax.tk = uu___173_6717.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___173_6717.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___173_6717.FStar_Syntax_Syntax.vars}))))
end)))
and ghost_to_pure_aux : cfg  ->  env  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.comp', Prims.unit) FStar_Syntax_Syntax.syntax = (fun cfg env c -> (

let norm1 = (fun t -> (norm (

let uu___175_6744 = cfg
in {steps = (Eager_unfolding)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(AllowUnboundUniverses)::[]; tcenv = uu___175_6744.tcenv; delta_level = uu___175_6744.delta_level; primitive_steps = uu___175_6744.primitive_steps}) env [] t))
in (

let non_info = (fun t -> (

let uu____6749 = (norm1 t)
in (FStar_Syntax_Util.non_informative uu____6749)))
in (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____6752) -> begin
c
end
| FStar_Syntax_Syntax.GTotal (t, uopt) when (non_info t) -> begin
(

let uu___176_6766 = c
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Total (((t), (uopt))); FStar_Syntax_Syntax.tk = uu___176_6766.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___176_6766.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___176_6766.FStar_Syntax_Syntax.vars})
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let l = (FStar_TypeChecker_Env.norm_eff_name cfg.tcenv ct.FStar_Syntax_Syntax.effect_name)
in (

let uu____6776 = ((FStar_Syntax_Util.is_ghost_effect l) && (non_info ct.FStar_Syntax_Syntax.result_typ))
in (match (uu____6776) with
| true -> begin
(

let ct1 = (match ((downgrade_ghost_effect_name ct.FStar_Syntax_Syntax.effect_name)) with
| Some (pure_eff) -> begin
(

let uu___177_6781 = ct
in {FStar_Syntax_Syntax.comp_univs = uu___177_6781.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = pure_eff; FStar_Syntax_Syntax.result_typ = uu___177_6781.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___177_6781.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = uu___177_6781.FStar_Syntax_Syntax.flags})
end
| None -> begin
(

let ct1 = (FStar_TypeChecker_Env.unfold_effect_abbrev cfg.tcenv c)
in (

let uu___178_6783 = ct1
in {FStar_Syntax_Syntax.comp_univs = uu___178_6783.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = FStar_Syntax_Const.effect_PURE_lid; FStar_Syntax_Syntax.result_typ = uu___178_6783.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___178_6783.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = uu___178_6783.FStar_Syntax_Syntax.flags}))
end)
in (

let uu___179_6784 = c
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Comp (ct1); FStar_Syntax_Syntax.tk = uu___179_6784.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___179_6784.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___179_6784.FStar_Syntax_Syntax.vars}))
end
| uu____6789 -> begin
c
end)))
end
| uu____6790 -> begin
c
end))))
and norm_binder : cfg  ->  env  ->  FStar_Syntax_Syntax.binder  ->  FStar_Syntax_Syntax.binder = (fun cfg env uu____6793 -> (match (uu____6793) with
| (x, imp) -> begin
(

let uu____6796 = (

let uu___180_6797 = x
in (

let uu____6798 = (norm cfg env [] x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___180_6797.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___180_6797.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____6798}))
in ((uu____6796), (imp)))
end))
and norm_binders : cfg  ->  env  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.binders = (fun cfg env bs -> (

let uu____6804 = (FStar_List.fold_left (fun uu____6811 b -> (match (uu____6811) with
| (nbs', env1) -> begin
(

let b1 = (norm_binder cfg env1 b)
in (((b1)::nbs'), ((Dummy)::env1)))
end)) (([]), (env)) bs)
in (match (uu____6804) with
| (nbs, uu____6828) -> begin
(FStar_List.rev nbs)
end)))
and norm_lcomp_opt : cfg  ->  env  ->  (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option  ->  (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option = (fun cfg env lopt -> (match (lopt) with
| Some (FStar_Util.Inl (lc)) -> begin
(

let flags = (filter_out_lcomp_cflags lc)
in (

let uu____6845 = (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc)
in (match (uu____6845) with
| true -> begin
(

let t = (norm cfg env [] lc.FStar_Syntax_Syntax.res_typ)
in (

let uu____6850 = (FStar_Syntax_Util.is_total_lcomp lc)
in (match (uu____6850) with
| true -> begin
(

let uu____6854 = (

let uu____6857 = (

let uu____6858 = (

let uu____6861 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.comp_set_flags uu____6861 flags))
in (FStar_Syntax_Util.lcomp_of_comp uu____6858))
in FStar_Util.Inl (uu____6857))
in Some (uu____6854))
end
| uu____6864 -> begin
(

let uu____6865 = (

let uu____6868 = (

let uu____6869 = (

let uu____6872 = (FStar_Syntax_Syntax.mk_GTotal t)
in (FStar_Syntax_Util.comp_set_flags uu____6872 flags))
in (FStar_Syntax_Util.lcomp_of_comp uu____6869))
in FStar_Util.Inl (uu____6868))
in Some (uu____6865))
end)))
end
| uu____6875 -> begin
Some (FStar_Util.Inr (((lc.FStar_Syntax_Syntax.eff_name), (flags))))
end)))
end
| uu____6885 -> begin
lopt
end))
and rebuild : cfg  ->  env  ->  stack  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env stack1 t -> (match (stack1) with
| [] -> begin
t
end
| (Debug (tm))::stack2 -> begin
((

let uu____6897 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug cfg.tcenv) (FStar_Options.Other ("print_normalized_terms")))
in (match (uu____6897) with
| true -> begin
(

let uu____6898 = (FStar_Syntax_Print.term_to_string tm)
in (

let uu____6899 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "Normalized %s to %s\n" uu____6898 uu____6899)))
end
| uu____6900 -> begin
()
end));
(rebuild cfg env stack2 t);
)
end
| (Steps (s, ps, dl))::stack2 -> begin
(rebuild (

let uu___181_6910 = cfg
in {steps = s; tcenv = uu___181_6910.tcenv; delta_level = dl; primitive_steps = ps}) env stack2 t)
end
| (Meta (m, r))::stack2 -> begin
(

let t1 = (mk (FStar_Syntax_Syntax.Tm_meta (((t), (m)))) r)
in (rebuild cfg env stack2 t1))
end
| (MemoLazy (r))::stack2 -> begin
((set_memo r ((env), (t)));
(log cfg (fun uu____6930 -> (

let uu____6931 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "\tSet memo %s\n" uu____6931))));
(rebuild cfg env stack2 t);
)
end
| (Let (env', bs, lb, r))::stack2 -> begin
(

let body = (FStar_Syntax_Subst.close bs t)
in (

let t1 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((((false), ((lb)::[]))), (body)))) None r)
in (rebuild cfg env' stack2 t1)))
end
| (Abs (env', bs, env'', lopt, r))::stack2 -> begin
(

let bs1 = (norm_binders cfg env' bs)
in (

let lopt1 = (norm_lcomp_opt cfg env'' lopt)
in (

let uu____6968 = (

let uu___182_6969 = (FStar_Syntax_Util.abs bs1 t lopt1)
in {FStar_Syntax_Syntax.n = uu___182_6969.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = uu___182_6969.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = r; FStar_Syntax_Syntax.vars = uu___182_6969.FStar_Syntax_Syntax.vars})
in (rebuild cfg env stack2 uu____6968))))
end
| ((Arg (Univ (_), _, _))::_) | ((Arg (Dummy, _, _))::_) -> begin
(failwith "Impossible")
end
| (UnivArgs (us, r))::stack2 -> begin
(

let t1 = (FStar_Syntax_Syntax.mk_Tm_uinst t us)
in (rebuild cfg env stack2 t1))
end
| (Arg (Clos (env1, tm, m, uu____6991), aq, r))::stack2 -> begin
((log cfg (fun uu____7007 -> (

let uu____7008 = (FStar_Syntax_Print.term_to_string tm)
in (FStar_Util.print1 "Rebuilding with arg %s\n" uu____7008))));
(match ((FStar_List.contains (Exclude (Iota)) cfg.steps)) with
| true -> begin
(match ((FStar_List.contains WHNF cfg.steps)) with
| true -> begin
(

let arg = (closure_as_term cfg env1 tm)
in (

let t1 = (FStar_Syntax_Syntax.extend_app t ((arg), (aq)) None r)
in (rebuild cfg env1 stack2 t1)))
end
| uu____7015 -> begin
(

let stack3 = (App (((t), (aq), (r))))::stack2
in (norm cfg env1 stack3 tm))
end)
end
| uu____7018 -> begin
(

let uu____7019 = (FStar_ST.read m)
in (match (uu____7019) with
| None -> begin
(match ((FStar_List.contains WHNF cfg.steps)) with
| true -> begin
(

let arg = (closure_as_term cfg env1 tm)
in (

let t1 = (FStar_Syntax_Syntax.extend_app t ((arg), (aq)) None r)
in (rebuild cfg env1 stack2 t1)))
end
| uu____7039 -> begin
(

let stack3 = (MemoLazy (m))::(App (((t), (aq), (r))))::stack2
in (norm cfg env1 stack3 tm))
end)
end
| Some (uu____7045, a) -> begin
(

let t1 = (FStar_Syntax_Syntax.extend_app t ((a), (aq)) None r)
in (rebuild cfg env1 stack2 t1))
end))
end);
)
end
| (App (head1, aq, r))::stack2 -> begin
(

let t1 = (FStar_Syntax_Syntax.extend_app head1 ((t), (aq)) None r)
in (

let uu____7067 = (maybe_simplify cfg t1)
in (rebuild cfg env stack2 uu____7067)))
end
| (Match (env1, branches, r))::stack2 -> begin
((log cfg (fun uu____7074 -> (

let uu____7075 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "Rebuilding with match, scrutinee is %s ...\n" uu____7075))));
(

let scrutinee = t
in (

let norm_and_rebuild_match = (fun uu____7080 -> ((log cfg (fun uu____7082 -> (

let uu____7083 = (FStar_Syntax_Print.term_to_string scrutinee)
in (

let uu____7084 = (

let uu____7085 = (FStar_All.pipe_right branches (FStar_List.map (fun uu____7092 -> (match (uu____7092) with
| (p, uu____7098, uu____7099) -> begin
(FStar_Syntax_Print.pat_to_string p)
end))))
in (FStar_All.pipe_right uu____7085 (FStar_String.concat "\n\t")))
in (FStar_Util.print2 "match is irreducible: scrutinee=%s\nbranches=%s\n" uu____7083 uu____7084)))));
(

let whnf = (FStar_List.contains WHNF cfg.steps)
in (

let cfg_exclude_iota_zeta = (

let new_delta = (FStar_All.pipe_right cfg.delta_level (FStar_List.filter (fun uu___138_7109 -> (match (uu___138_7109) with
| (FStar_TypeChecker_Env.Inlining) | (FStar_TypeChecker_Env.Eager_unfolding_only) -> begin
true
end
| uu____7110 -> begin
false
end))))
in (

let steps' = (

let uu____7113 = (FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations))
in (match (uu____7113) with
| true -> begin
(Exclude (Zeta))::[]
end
| uu____7115 -> begin
(Exclude (Iota))::(Exclude (Zeta))::[]
end))
in (

let uu___183_7116 = cfg
in {steps = (FStar_List.append steps' cfg.steps); tcenv = uu___183_7116.tcenv; delta_level = new_delta; primitive_steps = uu___183_7116.primitive_steps})))
in (

let norm_or_whnf = (fun env2 t1 -> (match (whnf) with
| true -> begin
(closure_as_term cfg_exclude_iota_zeta env2 t1)
end
| uu____7126 -> begin
(norm cfg_exclude_iota_zeta env2 [] t1)
end))
in (

let rec norm_pat = (fun env2 p -> (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_constant (uu____7150) -> begin
((p), (env2))
end
| FStar_Syntax_Syntax.Pat_disj ([]) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Pat_disj ((hd1)::tl1) -> begin
(

let uu____7170 = (norm_pat env2 hd1)
in (match (uu____7170) with
| (hd2, env') -> begin
(

let tl2 = (FStar_All.pipe_right tl1 (FStar_List.map (fun p1 -> (

let uu____7206 = (norm_pat env2 p1)
in (Prims.fst uu____7206)))))
in (((

let uu___184_7218 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_disj ((hd2)::tl2); FStar_Syntax_Syntax.ty = uu___184_7218.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___184_7218.FStar_Syntax_Syntax.p})), (env')))
end))
end
| FStar_Syntax_Syntax.Pat_cons (fv, pats) -> begin
(

let uu____7235 = (FStar_All.pipe_right pats (FStar_List.fold_left (fun uu____7269 uu____7270 -> (match (((uu____7269), (uu____7270))) with
| ((pats1, env3), (p1, b)) -> begin
(

let uu____7335 = (norm_pat env3 p1)
in (match (uu____7335) with
| (p2, env4) -> begin
(((((p2), (b)))::pats1), (env4))
end))
end)) (([]), (env2))))
in (match (uu____7235) with
| (pats1, env3) -> begin
(((

let uu___185_7401 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_cons (((fv), ((FStar_List.rev pats1)))); FStar_Syntax_Syntax.ty = uu___185_7401.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___185_7401.FStar_Syntax_Syntax.p})), (env3))
end))
end
| FStar_Syntax_Syntax.Pat_var (x) -> begin
(

let x1 = (

let uu___186_7415 = x
in (

let uu____7416 = (norm_or_whnf env2 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___186_7415.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___186_7415.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____7416}))
in (((

let uu___187_7422 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_var (x1); FStar_Syntax_Syntax.ty = uu___187_7422.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___187_7422.FStar_Syntax_Syntax.p})), ((Dummy)::env2)))
end
| FStar_Syntax_Syntax.Pat_wild (x) -> begin
(

let x1 = (

let uu___188_7427 = x
in (

let uu____7428 = (norm_or_whnf env2 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___188_7427.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___188_7427.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____7428}))
in (((

let uu___189_7434 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_wild (x1); FStar_Syntax_Syntax.ty = uu___189_7434.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___189_7434.FStar_Syntax_Syntax.p})), ((Dummy)::env2)))
end
| FStar_Syntax_Syntax.Pat_dot_term (x, t1) -> begin
(

let x1 = (

let uu___190_7444 = x
in (

let uu____7445 = (norm_or_whnf env2 x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = uu___190_7444.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___190_7444.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____7445}))
in (

let t2 = (norm_or_whnf env2 t1)
in (((

let uu___191_7452 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_dot_term (((x1), (t2))); FStar_Syntax_Syntax.ty = uu___191_7452.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = uu___191_7452.FStar_Syntax_Syntax.p})), (env2))))
end))
in (

let branches1 = (match (env1) with
| [] when whnf -> begin
branches
end
| uu____7456 -> begin
(FStar_All.pipe_right branches (FStar_List.map (fun branch1 -> (

let uu____7459 = (FStar_Syntax_Subst.open_branch branch1)
in (match (uu____7459) with
| (p, wopt, e) -> begin
(

let uu____7477 = (norm_pat env1 p)
in (match (uu____7477) with
| (p1, env2) -> begin
(

let wopt1 = (match (wopt) with
| None -> begin
None
end
| Some (w) -> begin
(

let uu____7501 = (norm_or_whnf env2 w)
in Some (uu____7501))
end)
in (

let e1 = (norm_or_whnf env2 e)
in (FStar_Syntax_Util.branch ((p1), (wopt1), (e1)))))
end))
end)))))
end)
in (

let uu____7506 = (mk (FStar_Syntax_Syntax.Tm_match (((scrutinee), (branches1)))) r)
in (rebuild cfg env1 stack2 uu____7506)))))));
))
in (

let rec is_cons = (fun head1 -> (match (head1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_uinst (h, uu____7516) -> begin
(is_cons h)
end
| (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Data_ctor)})) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Record_ctor (_))})) -> begin
true
end
| uu____7527 -> begin
false
end))
in (

let guard_when_clause = (fun wopt b rest -> (match (wopt) with
| None -> begin
b
end
| Some (w) -> begin
(

let then_branch = b
in (

let else_branch = (mk (FStar_Syntax_Syntax.Tm_match (((scrutinee), (rest)))) r)
in (FStar_Syntax_Util.if_then_else w then_branch else_branch)))
end))
in (

let rec matches_pat = (fun scrutinee1 p -> (

let scrutinee2 = (FStar_Syntax_Util.unmeta scrutinee1)
in (

let uu____7626 = (FStar_Syntax_Util.head_and_args scrutinee2)
in (match (uu____7626) with
| (head1, args) -> begin
(match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_disj (ps) -> begin
(

let mopt = (FStar_Util.find_map ps (fun p1 -> (

let m = (matches_pat scrutinee2 p1)
in (match (m) with
| FStar_Util.Inl (uu____7683) -> begin
Some (m)
end
| FStar_Util.Inr (true) -> begin
Some (m)
end
| FStar_Util.Inr (false) -> begin
None
end))))
in (match (mopt) with
| None -> begin
FStar_Util.Inr (false)
end
| Some (m) -> begin
m
end))
end
| (FStar_Syntax_Syntax.Pat_var (_)) | (FStar_Syntax_Syntax.Pat_wild (_)) -> begin
FStar_Util.Inl ((scrutinee2)::[])
end
| FStar_Syntax_Syntax.Pat_dot_term (uu____7714) -> begin
FStar_Util.Inl ([])
end
| FStar_Syntax_Syntax.Pat_constant (s) -> begin
(match (scrutinee2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_constant (s') when (s = s') -> begin
FStar_Util.Inl ([])
end
| uu____7726 -> begin
(

let uu____7727 = (

let uu____7728 = (is_cons head1)
in (not (uu____7728)))
in FStar_Util.Inr (uu____7727))
end)
end
| FStar_Syntax_Syntax.Pat_cons (fv, arg_pats) -> begin
(

let uu____7742 = (

let uu____7743 = (FStar_Syntax_Util.un_uinst head1)
in uu____7743.FStar_Syntax_Syntax.n)
in (match (uu____7742) with
| FStar_Syntax_Syntax.Tm_fvar (fv') when (FStar_Syntax_Syntax.fv_eq fv fv') -> begin
(matches_args [] args arg_pats)
end
| uu____7750 -> begin
(

let uu____7751 = (

let uu____7752 = (is_cons head1)
in (not (uu____7752)))
in FStar_Util.Inr (uu____7751))
end))
end)
end))))
and matches_args = (fun out a p -> (match (((a), (p))) with
| ([], []) -> begin
FStar_Util.Inl (out)
end
| (((t1, uu____7786))::rest_a, ((p1, uu____7789))::rest_p) -> begin
(

let uu____7817 = (matches_pat t1 p1)
in (match (uu____7817) with
| FStar_Util.Inl (s) -> begin
(matches_args (FStar_List.append out s) rest_a rest_p)
end
| m -> begin
m
end))
end
| uu____7831 -> begin
FStar_Util.Inr (false)
end))
in (

let rec matches = (fun scrutinee1 p -> (match (p) with
| [] -> begin
(norm_and_rebuild_match ())
end
| ((p1, wopt, b))::rest -> begin
(

let uu____7902 = (matches_pat scrutinee1 p1)
in (match (uu____7902) with
| FStar_Util.Inr (false) -> begin
(matches scrutinee1 rest)
end
| FStar_Util.Inr (true) -> begin
(norm_and_rebuild_match ())
end
| FStar_Util.Inl (s) -> begin
((log cfg (fun uu____7912 -> (

let uu____7913 = (FStar_Syntax_Print.pat_to_string p1)
in (

let uu____7914 = (

let uu____7915 = (FStar_List.map FStar_Syntax_Print.term_to_string s)
in (FStar_All.pipe_right uu____7915 (FStar_String.concat "; ")))
in (FStar_Util.print2 "Matches pattern %s with subst = %s\n" uu____7913 uu____7914)))));
(

let env2 = (FStar_List.fold_left (fun env2 t1 -> (

let uu____7924 = (

let uu____7925 = (

let uu____7935 = (FStar_Util.mk_ref (Some ((([]), (t1)))))
in (([]), (t1), (uu____7935), (false)))
in Clos (uu____7925))
in (uu____7924)::env2)) env1 s)
in (

let uu____7958 = (guard_when_clause wopt b rest)
in (norm cfg env2 stack2 uu____7958)));
)
end))
end))
in (

let uu____7959 = (FStar_All.pipe_right cfg.steps (FStar_List.contains (Exclude (Iota))))
in (match (uu____7959) with
| true -> begin
(norm_and_rebuild_match ())
end
| uu____7960 -> begin
(matches scrutinee branches)
end))))))));
)
end))


let config : step Prims.list  ->  FStar_TypeChecker_Env.env  ->  cfg = (fun s e -> (

let d = (FStar_All.pipe_right s (FStar_List.collect (fun uu___139_7973 -> (match (uu___139_7973) with
| UnfoldUntil (k) -> begin
(FStar_TypeChecker_Env.Unfold (k))::[]
end
| Eager_unfolding -> begin
(FStar_TypeChecker_Env.Eager_unfolding_only)::[]
end
| Inlining -> begin
(FStar_TypeChecker_Env.Inlining)::[]
end
| uu____7976 -> begin
[]
end))))
in (

let d1 = (match (d) with
| [] -> begin
(FStar_TypeChecker_Env.NoDelta)::[]
end
| uu____7980 -> begin
d
end)
in {steps = s; tcenv = e; delta_level = d1; primitive_steps = (FStar_List.append built_in_primitive_steps equality_ops)})))


let normalize_with_primitive_steps : primitive_step Prims.list  ->  step Prims.list  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun ps s e t -> (

let c = (config s e)
in (

let c1 = (

let uu___192_8000 = (config s e)
in {steps = uu___192_8000.steps; tcenv = uu___192_8000.tcenv; delta_level = uu___192_8000.delta_level; primitive_steps = (FStar_List.append c.primitive_steps ps)})
in (norm c1 [] [] t))))


let normalize : steps  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun s e t -> (normalize_with_primitive_steps [] s e t))


let normalize_comp : steps  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun s e t -> (

let uu____8019 = (config s e)
in (norm_comp uu____8019 [] t)))


let normalize_universe : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe = (fun env u -> (

let uu____8026 = (config [] env)
in (norm_universe uu____8026 [] u)))


let ghost_to_pure : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun env c -> (

let uu____8033 = (config [] env)
in (ghost_to_pure_aux uu____8033 [] c)))


let ghost_to_pure_lcomp : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.lcomp = (fun env lc -> (

let cfg = (config ((Eager_unfolding)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(EraseUniverses)::(AllowUnboundUniverses)::[]) env)
in (

let non_info = (fun t -> (

let uu____8045 = (norm cfg [] [] t)
in (FStar_Syntax_Util.non_informative uu____8045)))
in (

let uu____8046 = ((FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name) && (non_info lc.FStar_Syntax_Syntax.res_typ))
in (match (uu____8046) with
| true -> begin
(match ((downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name)) with
| Some (pure_eff) -> begin
(

let uu___193_8048 = lc
in {FStar_Syntax_Syntax.eff_name = pure_eff; FStar_Syntax_Syntax.res_typ = uu___193_8048.FStar_Syntax_Syntax.res_typ; FStar_Syntax_Syntax.cflags = uu___193_8048.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = (fun uu____8049 -> (

let uu____8050 = (lc.FStar_Syntax_Syntax.comp ())
in (ghost_to_pure env uu____8050)))})
end
| None -> begin
lc
end)
end
| uu____8051 -> begin
lc
end)))))


let term_to_string : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  Prims.string = (fun env t -> (

let uu____8058 = (normalize ((AllowUnboundUniverses)::[]) env t)
in (FStar_Syntax_Print.term_to_string uu____8058)))


let comp_to_string : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  Prims.string = (fun env c -> (

let uu____8065 = (

let uu____8066 = (config ((AllowUnboundUniverses)::[]) env)
in (norm_comp uu____8066 [] c))
in (FStar_Syntax_Print.comp_to_string uu____8065)))


let normalize_refinement : steps  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun steps env t0 -> (

let t = (normalize (FStar_List.append steps ((Beta)::[])) env t0)
in (

let rec aux = (fun t1 -> (

let t2 = (FStar_Syntax_Subst.compress t1)
in (match (t2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (x, phi) -> begin
(

let t01 = (aux x.FStar_Syntax_Syntax.sort)
in (match (t01.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (y, phi1) -> begin
(

let uu____8103 = (

let uu____8104 = (

let uu____8109 = (FStar_Syntax_Util.mk_conj phi1 phi)
in ((y), (uu____8109)))
in FStar_Syntax_Syntax.Tm_refine (uu____8104))
in (mk uu____8103 t01.FStar_Syntax_Syntax.pos))
end
| uu____8114 -> begin
t2
end))
end
| uu____8115 -> begin
t2
end)))
in (aux t))))


let unfold_whnf : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (normalize ((WHNF)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(Beta)::[]) env t))


let eta_expand_with_type : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term = (fun env e t_e -> (

let uu____8131 = (FStar_Syntax_Util.arrow_formals_comp t_e)
in (match (uu____8131) with
| (formals, c) -> begin
(match (formals) with
| [] -> begin
e
end
| uu____8147 -> begin
(

let uu____8151 = (FStar_Syntax_Util.abs_formals e)
in (match (uu____8151) with
| (actuals, uu____8162, uu____8163) -> begin
(match (((FStar_List.length actuals) = (FStar_List.length formals))) with
| true -> begin
e
end
| uu____8184 -> begin
(

let uu____8185 = (FStar_All.pipe_right formals FStar_Syntax_Util.args_of_binders)
in (match (uu____8185) with
| (binders, args) -> begin
(

let uu____8195 = ((FStar_Syntax_Syntax.mk_Tm_app e args) None e.FStar_Syntax_Syntax.pos)
in (

let uu____8200 = (

let uu____8207 = (FStar_All.pipe_right (FStar_Syntax_Util.lcomp_of_comp c) (fun _0_33 -> FStar_Util.Inl (_0_33)))
in (FStar_All.pipe_right uu____8207 (fun _0_34 -> Some (_0_34))))
in (FStar_Syntax_Util.abs binders uu____8195 uu____8200)))
end))
end)
end))
end)
end)))


let eta_expand : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (

let uu____8243 = (

let uu____8247 = (FStar_ST.read t.FStar_Syntax_Syntax.tk)
in ((uu____8247), (t.FStar_Syntax_Syntax.n)))
in (match (uu____8243) with
| (Some (sort), uu____8254) -> begin
(

let uu____8256 = (mk sort t.FStar_Syntax_Syntax.pos)
in (eta_expand_with_type env t uu____8256))
end
| (uu____8257, FStar_Syntax_Syntax.Tm_name (x)) -> begin
(eta_expand_with_type env t x.FStar_Syntax_Syntax.sort)
end
| uu____8261 -> begin
(

let uu____8265 = (FStar_Syntax_Util.head_and_args t)
in (match (uu____8265) with
| (head1, args) -> begin
(

let uu____8291 = (

let uu____8292 = (FStar_Syntax_Subst.compress head1)
in uu____8292.FStar_Syntax_Syntax.n)
in (match (uu____8291) with
| FStar_Syntax_Syntax.Tm_uvar (uu____8295, thead) -> begin
(

let uu____8309 = (FStar_Syntax_Util.arrow_formals thead)
in (match (uu____8309) with
| (formals, tres) -> begin
(match (((FStar_List.length formals) = (FStar_List.length args))) with
| true -> begin
t
end
| uu____8339 -> begin
(

let uu____8340 = (env.FStar_TypeChecker_Env.type_of (

let uu___194_8344 = env
in {FStar_TypeChecker_Env.solver = uu___194_8344.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___194_8344.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___194_8344.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___194_8344.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___194_8344.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___194_8344.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = None; FStar_TypeChecker_Env.sigtab = uu___194_8344.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___194_8344.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___194_8344.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___194_8344.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___194_8344.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___194_8344.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___194_8344.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___194_8344.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___194_8344.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___194_8344.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___194_8344.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = uu___194_8344.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___194_8344.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___194_8344.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = true; FStar_TypeChecker_Env.qname_and_index = uu___194_8344.FStar_TypeChecker_Env.qname_and_index}) t)
in (match (uu____8340) with
| (uu____8345, ty, uu____8347) -> begin
(eta_expand_with_type env t ty)
end))
end)
end))
end
| uu____8348 -> begin
(

let uu____8349 = (env.FStar_TypeChecker_Env.type_of (

let uu___195_8353 = env
in {FStar_TypeChecker_Env.solver = uu___195_8353.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___195_8353.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___195_8353.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___195_8353.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___195_8353.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___195_8353.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = None; FStar_TypeChecker_Env.sigtab = uu___195_8353.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___195_8353.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___195_8353.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___195_8353.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___195_8353.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___195_8353.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___195_8353.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___195_8353.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___195_8353.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___195_8353.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___195_8353.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = uu___195_8353.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___195_8353.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___195_8353.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = true; FStar_TypeChecker_Env.qname_and_index = uu___195_8353.FStar_TypeChecker_Env.qname_and_index}) t)
in (match (uu____8349) with
| (uu____8354, ty, uu____8356) -> begin
(eta_expand_with_type env t ty)
end))
end))
end))
end)))




