
open Prims
# 34 "FStar.Syntax.Free.fst"
let no_free_vars : FStar_Syntax_Syntax.free_vars = {FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names; FStar_Syntax_Syntax.free_uvars = FStar_Syntax_Syntax.no_uvs; FStar_Syntax_Syntax.free_univs = FStar_Syntax_Syntax.no_universe_uvars}

# 39 "FStar.Syntax.Free.fst"
let singleton_bv : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.free_vars = (fun x -> (let _114_4 = (let _114_3 = (FStar_Syntax_Syntax.new_bv_set ())
in (FStar_Util.set_add x _114_3))
in {FStar_Syntax_Syntax.free_names = _114_4; FStar_Syntax_Syntax.free_uvars = FStar_Syntax_Syntax.no_uvs; FStar_Syntax_Syntax.free_univs = FStar_Syntax_Syntax.no_universe_uvars}))

# 44 "FStar.Syntax.Free.fst"
let singleton_uv : ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax FStar_Syntax_Syntax.uvar_basis FStar_Unionfind.uvar * (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax)  ->  FStar_Syntax_Syntax.free_vars = (fun x -> (let _114_8 = (let _114_7 = (FStar_Syntax_Syntax.new_uv_set ())
in (FStar_Util.set_add x _114_7))
in {FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names; FStar_Syntax_Syntax.free_uvars = _114_8; FStar_Syntax_Syntax.free_univs = FStar_Syntax_Syntax.no_universe_uvars}))

# 49 "FStar.Syntax.Free.fst"
let singleton_univ : FStar_Syntax_Syntax.universe_uvar  ->  FStar_Syntax_Syntax.free_vars = (fun x -> (let _114_12 = (let _114_11 = (FStar_Syntax_Syntax.new_universe_uvar_set ())
in (FStar_Util.set_add x _114_11))
in {FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names; FStar_Syntax_Syntax.free_uvars = FStar_Syntax_Syntax.no_uvs; FStar_Syntax_Syntax.free_univs = _114_12}))

# 54 "FStar.Syntax.Free.fst"
let union : FStar_Syntax_Syntax.free_vars  ->  FStar_Syntax_Syntax.free_vars  ->  FStar_Syntax_Syntax.free_vars = (fun f1 f2 -> (let _114_19 = (FStar_Util.set_union f1.FStar_Syntax_Syntax.free_names f2.FStar_Syntax_Syntax.free_names)
in (let _114_18 = (FStar_Util.set_union f1.FStar_Syntax_Syntax.free_uvars f2.FStar_Syntax_Syntax.free_uvars)
in (let _114_17 = (FStar_Util.set_union f1.FStar_Syntax_Syntax.free_univs f2.FStar_Syntax_Syntax.free_univs)
in {FStar_Syntax_Syntax.free_names = _114_19; FStar_Syntax_Syntax.free_uvars = _114_18; FStar_Syntax_Syntax.free_univs = _114_17}))))

# 60 "FStar.Syntax.Free.fst"
let rec free_univs : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.free_vars = (fun u -> (match ((FStar_Syntax_Subst.compress_univ u)) with
| (FStar_Syntax_Syntax.U_zero) | (FStar_Syntax_Syntax.U_bvar (_)) | (FStar_Syntax_Syntax.U_name (_)) | (FStar_Syntax_Syntax.U_unknown) -> begin
no_free_vars
end
| FStar_Syntax_Syntax.U_succ (u) -> begin
(free_univs u)
end
| FStar_Syntax_Syntax.U_max (us) -> begin
(FStar_List.fold_left (fun out x -> (let _114_24 = (free_univs x)
in (union out _114_24))) no_free_vars us)
end
| FStar_Syntax_Syntax.U_unif (u) -> begin
(singleton_univ u)
end))

# 69 "FStar.Syntax.Free.fst"
let rec free_names_and_uvs' : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.free_vars = (fun tm -> (
# 70 "FStar.Syntax.Free.fst"
let aux_binders = (fun bs acc -> (FStar_All.pipe_right bs (FStar_List.fold_left (fun n _32_31 -> (match (_32_31) with
| (x, _32_30) -> begin
(let _114_40 = (free_names_and_uvars x.FStar_Syntax_Syntax.sort)
in (union n _114_40))
end)) acc)))
in (
# 72 "FStar.Syntax.Free.fst"
let t = (FStar_Syntax_Subst.compress tm)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (_32_34) -> begin
(FStar_All.failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_name (x) -> begin
(singleton_bv x)
end
| FStar_Syntax_Syntax.Tm_uvar (x, t) -> begin
(singleton_uv (x, t))
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(free_univs u)
end
| (FStar_Syntax_Syntax.Tm_bvar (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_unknown) -> begin
no_free_vars
end
| FStar_Syntax_Syntax.Tm_uinst (t, us) -> begin
(
# 92 "FStar.Syntax.Free.fst"
let f = (free_names_and_uvars t)
in (FStar_List.fold_left (fun out u -> (let _114_46 = (free_univs u)
in (union out _114_46))) f us))
end
| FStar_Syntax_Syntax.Tm_abs (bs, t, _32_64) -> begin
(let _114_47 = (free_names_and_uvars t)
in (aux_binders bs _114_47))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(let _114_48 = (free_names_and_uvars_comp c)
in (aux_binders bs _114_48))
end
| FStar_Syntax_Syntax.Tm_refine (bv, t) -> begin
(let _114_49 = (free_names_and_uvars t)
in (aux_binders (((bv, None))::[]) _114_49))
end
| FStar_Syntax_Syntax.Tm_app (t, args) -> begin
(let _114_50 = (free_names_and_uvars t)
in (free_names_and_uvars_args args _114_50))
end
| FStar_Syntax_Syntax.Tm_match (t, pats) -> begin
(let _114_59 = (let _114_58 = (free_names_and_uvars t)
in (FStar_List.fold_left (fun n _32_87 -> (match (_32_87) with
| (p, wopt, t) -> begin
(
# 109 "FStar.Syntax.Free.fst"
let n1 = (match (wopt) with
| None -> begin
no_free_vars
end
| Some (w) -> begin
(free_names_and_uvars w)
end)
in (
# 112 "FStar.Syntax.Free.fst"
let n2 = (free_names_and_uvars t)
in (
# 113 "FStar.Syntax.Free.fst"
let n = (let _114_53 = (union n2 n)
in (union n1 _114_53))
in (let _114_57 = (FStar_Syntax_Syntax.pat_bvs p)
in (FStar_All.pipe_right _114_57 (FStar_List.fold_left (fun n x -> (let _114_56 = (free_names_and_uvars x.FStar_Syntax_Syntax.sort)
in (union n _114_56))) n))))))
end)) _114_58))
in (FStar_All.pipe_right pats _114_59))
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, t2, _32_99) -> begin
(let _114_61 = (free_names_and_uvars t1)
in (let _114_60 = (free_names_and_uvars t2)
in (union _114_61 _114_60)))
end
| FStar_Syntax_Syntax.Tm_let (lbs, t) -> begin
(let _114_68 = (let _114_67 = (free_names_and_uvars t)
in (FStar_List.fold_left (fun n lb -> (let _114_66 = (let _114_65 = (free_names_and_uvars lb.FStar_Syntax_Syntax.lbtyp)
in (let _114_64 = (free_names_and_uvars lb.FStar_Syntax_Syntax.lbdef)
in (union _114_65 _114_64)))
in (union n _114_66))) _114_67))
in (FStar_All.pipe_right (Prims.snd lbs) _114_68))
end
| FStar_Syntax_Syntax.Tm_meta (t, FStar_Syntax_Syntax.Meta_pattern (args)) -> begin
(let _114_69 = (free_names_and_uvars t)
in (FStar_List.fold_right free_names_and_uvars_args args _114_69))
end
| FStar_Syntax_Syntax.Tm_meta (t, _32_115) -> begin
(free_names_and_uvars t)
end))))
and free_names_and_uvars : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.free_vars = (fun t -> (
# 132 "FStar.Syntax.Free.fst"
let t = (FStar_Syntax_Subst.compress t)
in (match ((FStar_ST.read t.FStar_Syntax_Syntax.vars)) with
| Some (n) -> begin
if (should_invalidate_cache n) then begin
(
# 137 "FStar.Syntax.Free.fst"
let _32_122 = (FStar_ST.op_Colon_Equals t.FStar_Syntax_Syntax.vars None)
in (free_names_and_uvars t))
end else begin
n
end
end
| _32_125 -> begin
(
# 140 "FStar.Syntax.Free.fst"
let n = (free_names_and_uvs' t)
in (
# 141 "FStar.Syntax.Free.fst"
let _32_127 = (FStar_ST.op_Colon_Equals t.FStar_Syntax_Syntax.vars (Some (n)))
in n))
end)))
and free_names_and_uvars_args : FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.free_vars  ->  FStar_Syntax_Syntax.free_vars = (fun args acc -> (FStar_All.pipe_right args (FStar_List.fold_left (fun n _32_135 -> (match (_32_135) with
| (x, _32_134) -> begin
(let _114_75 = (free_names_and_uvars x)
in (union n _114_75))
end)) acc)))
and free_names_and_uvars_binders = (fun bs acc -> (FStar_All.pipe_right bs (FStar_List.fold_left (fun n _32_142 -> (match (_32_142) with
| (x, _32_141) -> begin
(let _114_78 = (free_names_and_uvars x.FStar_Syntax_Syntax.sort)
in (union n _114_78))
end)) acc)))
and free_names_and_uvars_comp : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.free_vars = (fun c -> (match ((FStar_ST.read c.FStar_Syntax_Syntax.vars)) with
| Some (n) -> begin
if (should_invalidate_cache n) then begin
(
# 154 "FStar.Syntax.Free.fst"
let _32_146 = (FStar_ST.op_Colon_Equals c.FStar_Syntax_Syntax.vars None)
in (free_names_and_uvars_comp c))
end else begin
n
end
end
| _32_149 -> begin
(
# 157 "FStar.Syntax.Free.fst"
let n = (match (c.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.GTotal (t)) | (FStar_Syntax_Syntax.Total (t)) -> begin
(free_names_and_uvars t)
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(let _114_80 = (free_names_and_uvars ct.FStar_Syntax_Syntax.result_typ)
in (free_names_and_uvars_args ct.FStar_Syntax_Syntax.effect_args _114_80))
end)
in (
# 163 "FStar.Syntax.Free.fst"
let _32_156 = (FStar_ST.op_Colon_Equals c.FStar_Syntax_Syntax.vars (Some (n)))
in n))
end))
and should_invalidate_cache : FStar_Syntax_Syntax.free_vars  ->  Prims.bool = (fun n -> ((let _114_83 = (FStar_All.pipe_right n.FStar_Syntax_Syntax.free_uvars FStar_Util.set_elements)
in (FStar_All.pipe_right _114_83 (FStar_Util.for_some (fun _32_162 -> (match (_32_162) with
| (u, _32_161) -> begin
(match ((FStar_Unionfind.find u)) with
| FStar_Syntax_Syntax.Fixed (_32_164) -> begin
true
end
| _32_167 -> begin
false
end)
end))))) || (let _114_85 = (FStar_All.pipe_right n.FStar_Syntax_Syntax.free_univs FStar_Util.set_elements)
in (FStar_All.pipe_right _114_85 (FStar_Util.for_some (fun u -> (match ((FStar_Unionfind.find u)) with
| Some (_32_170) -> begin
true
end
| None -> begin
false
end)))))))

# 174 "FStar.Syntax.Free.fst"
let names : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.bv FStar_Util.set = (fun t -> (let _114_88 = (free_names_and_uvars t)
in _114_88.FStar_Syntax_Syntax.free_names))

# 175 "FStar.Syntax.Free.fst"
let uvars : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.uvar * FStar_Syntax_Syntax.typ) FStar_Util.set = (fun t -> (let _114_91 = (free_names_and_uvars t)
in _114_91.FStar_Syntax_Syntax.free_uvars))

# 176 "FStar.Syntax.Free.fst"
let univs : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.universe_uvar FStar_Util.set = (fun t -> (let _114_94 = (free_names_and_uvars t)
in _114_94.FStar_Syntax_Syntax.free_univs))

# 177 "FStar.Syntax.Free.fst"
let names_of_binders : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.bv FStar_Util.set = (fun bs -> (let _114_97 = (free_names_and_uvars_binders bs no_free_vars)
in _114_97.FStar_Syntax_Syntax.free_names))




