// Generated by cargo: do not edit by hand

// If usage of .Call()/.Kall() functions in the package's R code changes, update
// this file by rerunning "cargo::register_calls(DIR)", where DIR is the root
// directory of this package.

/*
// Below is commented-out skeleton code that you can copy to your
// 'src/rustlib/src/lib.rs' file. You can change the body and arguments
// names of the functions, but changing the function name necessitates
// a corresponding change in the R code.

mod registration;
use roxido::*;

#[roxido]
fn compute_expected_loss(Z: SEXP, Zs: SEXP, nCores: SEXP) -> SEXP {
    unsafe { rbindings::R_NilValue }
}

#[roxido]
fn compute_loss(Z1: SEXP, Z2: SEXP) -> SEXP {
    unsafe { rbindings::R_NilValue }
}

#[roxido]
fn fangs(Zs: SEXP, nIterations: SEXP, maxNFeatures: SEXP, nCandidates: SEXP, nBests: SEXP, nCores: SEXP, quiet: SEXP) -> SEXP {
    unsafe { rbindings::R_NilValue }
}
*/

use roxido::*;

#[no_mangle]
extern "C" fn R_init_fangs_librust(info: *mut rbindings::DllInfo) {
    let mut call_routines = Vec::with_capacity(3);
    let mut names = Vec::with_capacity(3);
    names.push(std::ffi::CString::new(".compute_expected_loss").unwrap());
    call_routines.push(rbindings::R_CallMethodDef {
        name: names.last().unwrap().as_ptr(),
        fun: unsafe { std::mem::transmute(crate::compute_expected_loss as *const u8) },
        numArgs: 3,
    });
    names.push(std::ffi::CString::new(".compute_loss").unwrap());
    call_routines.push(rbindings::R_CallMethodDef {
        name: names.last().unwrap().as_ptr(),
        fun: unsafe { std::mem::transmute(crate::compute_loss as *const u8) },
        numArgs: 2,
    });
    names.push(std::ffi::CString::new(".fangs").unwrap());
    call_routines.push(rbindings::R_CallMethodDef {
        name: names.last().unwrap().as_ptr(),
        fun: unsafe { std::mem::transmute(crate::fangs as *const u8) },
        numArgs: 7,
    });
    call_routines.push(rbindings::R_CallMethodDef {
        name: std::ptr::null(),
        fun: None,
        numArgs: 0,
    });
    unsafe {
        rbindings::R_registerRoutines(
            info,
            std::ptr::null(),
            call_routines.as_ptr(),
            std::ptr::null(),
            std::ptr::null(),
        );
        rbindings::R_useDynamicSymbols(info, 1);
        rbindings::R_forceSymbols(info, 1);
    }
}

