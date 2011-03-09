##
##  Copyright (c) 2010 The WebM project authors. All Rights Reserved.
##
##  Use of this source code is governed by a BSD-style license
##  that can be found in the LICENSE file in the root of the source
##  tree. An additional intellectual property rights grant can be found
##  in the file PATENTS.  All contributing project authors may
##  be found in the AUTHORS file in the root of the source tree.
##


include $(SRC_PATH_BARE)/$(VP8_PREFIX)vp8_common.mk

VP8_CX_EXPORTS += exports_enc

VP8_CX_SRCS-yes += $(VP8_COMMON_SRCS-yes)
VP8_CX_SRCS-no  += $(VP8_COMMON_SRCS-no)
VP8_CX_SRCS_REMOVE-yes += $(VP8_COMMON_SRCS_REMOVE-yes)
VP8_CX_SRCS_REMOVE-no  += $(VP8_COMMON_SRCS_REMOVE-no)

ifeq ($(ARCH_ARM),yes)
  include $(SRC_PATH_BARE)/$(VP8_PREFIX)vp8cx_arm.mk
endif

VP8_CX_SRCS-yes += vp8_cx_iface.c

# encoder
#INCLUDES += algo/vpx_common/vpx_mem/include
#INCLUDES += common
#INCLUDES += common
#INCLUDES += common
#INCLUDES += algo/vpx_ref/cpu_id/include
#INCLUDES += common
#INCLUDES += encoder

VP8_CX_SRCS-yes += encoder/bitstream.c
VP8_CX_SRCS-yes += encoder/boolhuff.c
VP8_CX_SRCS-yes += encoder/dct.c
VP8_CX_SRCS-yes += encoder/encodeframe.c
VP8_CX_SRCS-yes += encoder/encodeintra.c
VP8_CX_SRCS-yes += encoder/encodemb.c
VP8_CX_SRCS-yes += encoder/encodemv.c
VP8_CX_SRCS-$(CONFIG_MULTITHREAD) += encoder/ethreading.c
VP8_CX_SRCS-yes += encoder/firstpass.c
VP8_CX_SRCS-yes += encoder/generic/csystemdependent.c
VP8_CX_SRCS-yes += encoder/block.h
VP8_CX_SRCS-yes += encoder/boolhuff.h
VP8_CX_SRCS-yes += encoder/bitstream.h
VP8_CX_SRCS-yes += encoder/dct.h
VP8_CX_SRCS-yes += encoder/encodeintra.h
VP8_CX_SRCS-yes += encoder/encodemb.h
VP8_CX_SRCS-yes += encoder/encodemv.h
VP8_CX_SRCS-yes += encoder/firstpass.h
VP8_CX_SRCS-yes += encoder/mcomp.h
VP8_CX_SRCS-yes += encoder/modecosts.h
VP8_CX_SRCS-yes += encoder/onyx_int.h
VP8_CX_SRCS-yes += encoder/pickinter.h
VP8_CX_SRCS-yes += encoder/psnr.h
VP8_CX_SRCS-yes += encoder/quantize.h
VP8_CX_SRCS-yes += encoder/ratectrl.h
VP8_CX_SRCS-yes += encoder/rdopt.h
VP8_CX_SRCS-yes += encoder/tokenize.h
VP8_CX_SRCS-yes += encoder/treewriter.h
VP8_CX_SRCS-yes += encoder/variance.h
VP8_CX_SRCS-yes += encoder/mcomp.c
VP8_CX_SRCS-yes += encoder/modecosts.c
VP8_CX_SRCS-yes += encoder/onyx_if.c
VP8_CX_SRCS-yes += encoder/pickinter.c
VP8_CX_SRCS-yes += encoder/picklpf.c
VP8_CX_SRCS-yes += encoder/psnr.c
VP8_CX_SRCS-yes += encoder/quantize.c
VP8_CX_SRCS-yes += encoder/ratectrl.c
VP8_CX_SRCS-yes += encoder/rdopt.c
VP8_CX_SRCS-yes += encoder/sad_c.c
VP8_CX_SRCS-yes += encoder/segmentation.c
VP8_CX_SRCS-yes += encoder/segmentation.h
VP8_CX_SRCS-$(CONFIG_PSNR) += encoder/ssim.c
VP8_CX_SRCS-yes += encoder/tokenize.c
VP8_CX_SRCS-yes += encoder/treewriter.c
VP8_CX_SRCS-yes += encoder/variance_c.c
VP8_CX_SRCS-$(CONFIG_PSNR) += common/postproc.h
VP8_CX_SRCS-$(CONFIG_PSNR) += common/postproc.c
VP8_CX_SRCS-yes += encoder/temporal_filter.c
VP8_CX_SRCS-yes += encoder/temporal_filter.h

ifeq ($(CONFIG_REALTIME_ONLY),yes)
VP8_CX_SRCS_REMOVE-yes += encoder/firstpass.c
VP8_CX_SRCS_REMOVE-yes += encoder/temporal_filter.c
endif

VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/encodemb_x86.h
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/dct_x86.h
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/mcomp_x86.h
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/variance_x86.h
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/quantize_x86.h
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/temporal_filter_x86.h
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/x86_csystemdependent.c
VP8_CX_SRCS-$(HAVE_MMX) += encoder/x86/variance_mmx.c
VP8_CX_SRCS-$(HAVE_MMX) += encoder/x86/variance_impl_mmx.asm
VP8_CX_SRCS-$(HAVE_MMX) += encoder/x86/sad_mmx.asm
VP8_CX_SRCS-$(HAVE_MMX) += encoder/x86/dct_mmx.asm
VP8_CX_SRCS-$(HAVE_MMX) += encoder/x86/subtract_mmx.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/dct_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/variance_sse2.c
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/variance_impl_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/sad_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/fwalsh_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/quantize_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/subtract_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE2) += encoder/x86/temporal_filter_apply_sse2.asm
VP8_CX_SRCS-$(HAVE_SSE3) += encoder/x86/sad_sse3.asm
VP8_CX_SRCS-$(HAVE_SSSE3) += encoder/x86/sad_ssse3.asm
VP8_CX_SRCS-$(HAVE_SSSE3) += encoder/x86/variance_ssse3.c
VP8_CX_SRCS-$(HAVE_SSSE3) += encoder/x86/variance_impl_ssse3.asm
VP8_CX_SRCS-$(HAVE_SSSE3) += encoder/x86/quantize_ssse3.asm
VP8_CX_SRCS-$(HAVE_SSE4_1) += encoder/x86/sad_sse4.asm
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/quantize_mmx.asm
VP8_CX_SRCS-$(ARCH_X86)$(ARCH_X86_64) += encoder/x86/encodeopt.asm

ifeq ($(CONFIG_REALTIME_ONLY),yes)
VP8_CX_SRCS_REMOVE-$(HAVE_SSE2) += encoder/x86/temporal_filter_apply_sse2.asm
endif


VP8_CX_SRCS-yes := $(filter-out $(VP8_CX_SRCS_REMOVE-yes),$(VP8_CX_SRCS-yes))
