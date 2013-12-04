.section __DWARF, __debug_abbrev,regular,debug

	.byte 1,17,1,37,8,3,8,27,8,19,11,17,1,18,1,16,6,0,0,2,46,1,3,8,17,1,18,1,64,10,0,0
	.byte 3,5,0,3,8,73,19,2,10,0,0,15,5,0,3,8,73,19,2,6,0,0,4,36,0,11,11,62,11,3,8,0
	.byte 0,5,2,1,3,8,11,15,0,0,17,2,0,3,8,11,15,0,0,6,13,0,3,8,73,19,56,10,0,0,7,22
	.byte 0,3,8,73,19,0,0,8,4,1,3,8,11,15,73,19,0,0,9,40,0,3,8,28,13,0,0,10,57,1,3,8
	.byte 0,0,11,52,0,3,8,73,19,2,10,0,0,12,52,0,3,8,73,19,2,6,0,0,13,15,0,73,19,0,0,14
	.byte 16,0,73,19,0,0,16,28,0,73,19,56,10,0,0,18,46,0,3,8,17,1,18,1,0,0,0
.section __DWARF, __debug_info,regular,debug
Ldebug_info_start:

LDIFF_SYM0=Ldebug_info_end - Ldebug_info_begin
	.long LDIFF_SYM0
Ldebug_info_begin:

	.short 2
	.long 0
	.byte 4,1
	.asciz "Mono AOT Compiler 3.2.3 (mtvs-1.8-series/bfa7186 Mon Nov 11 15:53:20 EST 2013)"
	.asciz "JITted code"
	.asciz ""

	.byte 2,0,0,0,0,0,0,0,0
LDIFF_SYM1=Ldebug_line_start - Ldebug_line_section_start
	.long LDIFF_SYM1
LDIE_I1:

	.byte 4,1,5
	.asciz "sbyte"
LDIE_U1:

	.byte 4,1,7
	.asciz "byte"
LDIE_I2:

	.byte 4,2,5
	.asciz "short"
LDIE_U2:

	.byte 4,2,7
	.asciz "ushort"
LDIE_I4:

	.byte 4,4,5
	.asciz "int"
LDIE_U4:

	.byte 4,4,7
	.asciz "uint"
LDIE_I8:

	.byte 4,8,5
	.asciz "long"
LDIE_U8:

	.byte 4,8,7
	.asciz "ulong"
LDIE_I:

	.byte 4,4,5
	.asciz "intptr"
LDIE_U:

	.byte 4,4,7
	.asciz "uintptr"
LDIE_R4:

	.byte 4,4,4
	.asciz "float"
LDIE_R8:

	.byte 4,8,4
	.asciz "double"
LDIE_BOOLEAN:

	.byte 4,1,2
	.asciz "boolean"
LDIE_CHAR:

	.byte 4,2,8
	.asciz "char"
LDIE_STRING:

	.byte 4,4,1
	.asciz "string"
LDIE_OBJECT:

	.byte 4,4,1
	.asciz "object"
LDIE_SZARRAY:

	.byte 4,4,1
	.asciz "object"
.section __DWARF, __debug_loc,regular,debug
Ldebug_loc_start:
.section __DWARF, __debug_line,regular,debug
Ldebug_line_section_start:
.section __DWARF, __debug_line,regular,debug
Ldebug_line_start:

	.long Ldebug_line_end - . -4
	.short 2
	.long Ldebug_line_header_end - . -4
	.byte 1,1,251,14,13,0,1,1,1,1,0,0,0,1,0,0,1
.section __DWARF, __debug_line,regular,debug
.section __DWARF, __debug_line,regular,debug

	.byte 0
.section __DWARF, __debug_line,regular,debug
	.asciz "xdb.il"

	.byte 0,0,0
.section __DWARF, __debug_line,regular,debug
.section __DWARF, __debug_line,regular,debug

	.byte 0
Ldebug_line_header_end:
.section __DWARF, __debug_line,regular,debug

	.byte 0,1,1
Ldebug_line_end:
.section __DWARF, __debug_frame,regular,debug
	.align 3

LDIFF_SYM2=Lcie0_end - Lcie0_start
	.long LDIFF_SYM2
Lcie0_start:

	.long -1
	.byte 3
	.asciz ""

	.byte 1,124,14
	.align 2
Lcie0_end:
.text
	.align 3
methods:
	.space 16
.text
	.align 2
	.no_dead_strip _ApiDefinition_Messaging__ctor
_ApiDefinition_Messaging__ctor:
.file 1 "/Users/david/Dropbox/Developer/components/monotouch-bindings/GCDiscreetNotification/binding/ios/ObjCRuntime/Messaging.g.cs"
.loc 1 31 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,12,208,77,226,0,0,141,229,12,208,141,226,0,1,189,232,128,128,189,232

Lme_0:
.text
	.align 2
	.no_dead_strip _ApiDefinition_Messaging__cctor
_ApiDefinition_Messaging__cctor:
.loc 1 31 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,4,208,77,226,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 4
	.byte 1,16,159,231,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 0,0,159,231,0,16,128,229,4,208,141,226,0,1,189,232,128,128,189,232

Lme_1:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor
_GCDiscreetNotification_GCDiscreetNotificationView__ctor:
.file 2 "/Users/david/Dropbox/Developer/components/monotouch-bindings/GCDiscreetNotification/binding/ios/GCDiscreetNotification/GCDiscreetNotificationView.g.cs"
.loc 2 92 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 12
	.byte 0,0,159,231,0,16,144,229,10,0,160,225
bl _p_1

	.byte 0,0,154,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,202,229
.loc 2 93 0

	.byte 255,0,0,226,0,0,80,227,10,0,0,10,8,0,154,229
.loc 2 94 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 16
	.byte 1,16,159,231,0,16,145,229
bl _p_3

	.byte 0,16,160,225,10,0,160,225
bl _p_4

	.byte 10,0,0,234
.loc 2 96 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 16
	.byte 1,16,159,231,0,16,145,229
bl _p_6

	.byte 0,16,160,225,10,0,160,225
bl _p_4
.loc 2 98 0

	.byte 0,208,141,226,0,5,189,232,128,128,189,232

Lme_6:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSCoder
_GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSCoder:
.loc 2 105 0

	.byte 128,64,45,233,13,112,160,225,64,5,45,233,4,208,77,226,0,96,160,225,1,160,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 12
	.byte 0,0,159,231,0,16,144,229,6,0,160,225
bl _p_1

	.byte 0,0,150,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,198,229
.loc 2 106 0

	.byte 255,0,0,226,0,0,80,227,12,0,0,10,8,0,150,229
.loc 2 107 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 20
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,32,154,229
bl _p_7

	.byte 0,16,160,225,6,0,160,225
bl _p_4

	.byte 12,0,0,234
.loc 2 109 0

	.byte 6,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 20
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,32,154,229
bl _p_8

	.byte 0,16,160,225,6,0,160,225
bl _p_4
.loc 2 111 0

	.byte 4,208,141,226,64,5,189,232,128,128,189,232

Lme_7:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSObjectFlag
_GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSObjectFlag:
.loc 2 117 0

	.byte 128,64,45,233,13,112,160,225,64,1,45,233,8,208,77,226,0,96,160,225,0,16,141,229,6,0,160,225,0,16,157,229
bl _p_1

	.byte 0,0,150,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,198,229
.loc 2 118 0

	.byte 8,208,141,226,64,1,189,232,128,128,189,232

Lme_8:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor_intptr
_GCDiscreetNotification_GCDiscreetNotificationView__ctor_intptr:
.loc 2 123 0

	.byte 128,64,45,233,13,112,160,225,64,1,45,233,8,208,77,226,0,96,160,225,0,16,141,229,6,0,160,225,0,16,157,229
bl _p_9

	.byte 0,0,150,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,198,229
.loc 2 124 0

	.byte 8,208,141,226,64,1,189,232,128,128,189,232

Lme_9:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_MonoTouch_UIKit_UIView
_GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_MonoTouch_UIKit_UIView:
.loc 2 130 0

	.byte 128,64,45,233,13,112,160,225,48,5,45,233,8,208,77,226,0,80,160,225,0,16,141,229,2,160,160,225,0,0,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 12
	.byte 0,0,159,231,0,16,144,229,5,0,160,225
bl _p_1

	.byte 0,0,157,229,0,0,80,227,64,0,0,10
.loc 2 132 0

	.byte 0,0,90,227,51,0,0,10,0,0,157,229
.loc 2 134 0
bl _p_10

	.byte 0,64,160,225
.loc 2 136 0

	.byte 0,0,149,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,197,229
.loc 2 137 0

	.byte 255,0,0,226,0,0,80,227,13,0,0,10,8,0,149,229
.loc 2 138 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 24
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,48,154,229,4,32,160,225
bl _p_11

	.byte 0,16,160,225,5,0,160,225
bl _p_4

	.byte 13,0,0,234
.loc 2 140 0

	.byte 5,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 24
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,48,154,229,4,32,160,225
bl _p_12

	.byte 0,16,160,225,5,0,160,225
bl _p_4
.loc 2 142 0

	.byte 4,0,160,225
bl _p_13
.loc 2 144 0

	.byte 8,208,141,226,48,5,189,232,128,128,189,232
.loc 2 133 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,11,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231
.loc 2 131 0

	.byte 1,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_a:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_MonoTouch_UIKit_UIView
_GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_MonoTouch_UIKit_UIView:
.loc 2 151 0

	.byte 128,64,45,233,13,112,160,225,48,13,45,233,20,208,77,226,13,176,160,225,0,80,160,225,8,16,139,229,12,32,203,229
	.byte 3,160,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 12
	.byte 0,0,159,231,0,16,144,229,5,0,160,225
bl _p_1

	.byte 8,0,155,229,0,0,80,227,68,0,0,10
.loc 2 153 0

	.byte 0,0,90,227,55,0,0,10,8,0,155,229
.loc 2 155 0
bl _p_10

	.byte 0,64,160,225
.loc 2 157 0

	.byte 0,0,149,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,197,229
.loc 2 158 0

	.byte 255,0,0,226,0,0,80,227,15,0,0,10,8,0,149,229
.loc 2 159 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 28
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,192,154,229,4,32,160,225,12,48,219,229,0,192,141,229
bl _p_16

	.byte 0,16,160,225,5,0,160,225
bl _p_4

	.byte 15,0,0,234
.loc 2 161 0

	.byte 5,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 28
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,192,154,229,4,32,160,225,12,48,219,229,0,192,141,229
bl _p_17

	.byte 0,16,160,225,5,0,160,225
bl _p_4
.loc 2 163 0

	.byte 4,0,160,225
bl _p_13
.loc 2 165 0

	.byte 20,208,139,226,48,13,189,232,128,128,189,232
.loc 2 154 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,11,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231
.loc 2 152 0

	.byte 1,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_b:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_GCDiscreetNotification_GCDNPresentationMode_MonoTouch_UIKit_UIView
_GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_GCDiscreetNotification_GCDNPresentationMode_MonoTouch_UIKit_UIView:
.loc 2 172 0

	.byte 128,64,45,233,13,112,160,225,16,13,45,233,32,208,77,226,13,176,160,225,0,64,160,225,12,16,139,229,16,32,203,229
	.byte 20,48,139,229,56,160,157,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 12
	.byte 0,0,159,231,0,16,144,229,4,0,160,225
bl _p_1

	.byte 12,0,155,229,0,0,80,227,76,0,0,10
.loc 2 174 0

	.byte 0,0,90,227,63,0,0,10,12,0,155,229
.loc 2 176 0
bl _p_10

	.byte 8,0,139,229
.loc 2 178 0

	.byte 0,0,148,229,12,16,144,229,1,0,160,225,0,16,145,229,15,224,160,225,20,241,145,229,0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 8
	.byte 1,16,159,231,0,16,145,229
bl _p_2

	.byte 17,0,196,229
.loc 2 179 0

	.byte 255,0,0,226,0,0,80,227,19,0,0,10,8,0,148,229
.loc 2 180 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 32
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,192,154,229,24,0,139,229,8,32,155,229,16,48,219,229,20,0,155,229
	.byte 0,0,141,229,24,0,155,229,4,192,141,229
bl _p_18

	.byte 0,16,160,225,4,0,160,225
bl _p_4

	.byte 19,0,0,234
.loc 2 182 0

	.byte 4,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 32
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,192,154,229,24,0,139,229,8,32,155,229,16,48,219,229,20,0,155,229
	.byte 0,0,141,229,24,0,155,229,4,192,141,229
bl _p_19

	.byte 0,16,160,225,4,0,160,225
bl _p_4

	.byte 8,0,155,229
.loc 2 184 0
bl _p_13
.loc 2 186 0

	.byte 32,208,139,226,16,13,189,232,128,128,189,232
.loc 2 175 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,11,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231
.loc 2 173 0

	.byte 1,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_c:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView__cctor
_GCDiscreetNotification_GCDiscreetNotificationView__cctor:
.loc 2 32 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,4,208,77,226,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_0:
.long L_OBJC_SELECTOR_REFERENCES_0-(L_OBJC_SELECTOR_0+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 36
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_1:
.long L_OBJC_SELECTOR_REFERENCES_1-(L_OBJC_SELECTOR_1+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 40
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_2:
.long L_OBJC_SELECTOR_REFERENCES_2-(L_OBJC_SELECTOR_2+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 44
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_3:
.long L_OBJC_SELECTOR_REFERENCES_3-(L_OBJC_SELECTOR_3+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 48
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_4:
.long L_OBJC_SELECTOR_REFERENCES_4-(L_OBJC_SELECTOR_4+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 52
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_5:
.long L_OBJC_SELECTOR_REFERENCES_5-(L_OBJC_SELECTOR_5+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 56
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_6:
.long L_OBJC_SELECTOR_REFERENCES_6-(L_OBJC_SELECTOR_6+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 60
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_7:
.long L_OBJC_SELECTOR_REFERENCES_7-(L_OBJC_SELECTOR_7+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 64
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_8:
.long L_OBJC_SELECTOR_REFERENCES_8-(L_OBJC_SELECTOR_8+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 68
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_9:
.long L_OBJC_SELECTOR_REFERENCES_9-(L_OBJC_SELECTOR_9+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 72
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_10:
.long L_OBJC_SELECTOR_REFERENCES_10-(L_OBJC_SELECTOR_10+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 76
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_11:
.long L_OBJC_SELECTOR_REFERENCES_11-(L_OBJC_SELECTOR_11+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 24
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_12:
.long L_OBJC_SELECTOR_REFERENCES_12-(L_OBJC_SELECTOR_12+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 28
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_13:
.long L_OBJC_SELECTOR_REFERENCES_13-(L_OBJC_SELECTOR_13+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 32
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_14:
.long L_OBJC_SELECTOR_REFERENCES_14-(L_OBJC_SELECTOR_14+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 80
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_15:
.long L_OBJC_SELECTOR_REFERENCES_15-(L_OBJC_SELECTOR_15+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 84
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_16:
.long L_OBJC_SELECTOR_REFERENCES_16-(L_OBJC_SELECTOR_16+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 88
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_17:
.long L_OBJC_SELECTOR_REFERENCES_17-(L_OBJC_SELECTOR_17+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 92
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_18:
.long L_OBJC_SELECTOR_REFERENCES_18-(L_OBJC_SELECTOR_18+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 96
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_19:
.long L_OBJC_SELECTOR_REFERENCES_19-(L_OBJC_SELECTOR_19+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 100
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_20:
.long L_OBJC_SELECTOR_REFERENCES_20-(L_OBJC_SELECTOR_20+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 104
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_21:
.long L_OBJC_SELECTOR_REFERENCES_21-(L_OBJC_SELECTOR_21+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 108
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_22:
.long L_OBJC_SELECTOR_REFERENCES_22-(L_OBJC_SELECTOR_22+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 112
	.byte 0,0,159,231,0,16,128,229,0,16,159,229,0,0,0,234
L_OBJC_SELECTOR_23:
.long L_OBJC_SELECTOR_REFERENCES_23-(L_OBJC_SELECTOR_23+12)
	.byte 1,16,159,231,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 116
	.byte 0,0,159,231,0,16,128,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 120
	.byte 0,0,159,231
bl _p_20

	.byte 0,16,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 124
	.byte 0,0,159,231,0,16,128,229,4,208,141,226,0,1,189,232,128,128,189,232

Lme_d:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_ClassHandle
_GCDiscreetNotification_GCDiscreetNotificationView_get_ClassHandle:
.loc 2 85 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,12,208,77,226,0,0,141,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 124
	.byte 0,0,159,231,0,0,144,229,12,208,141,226,0,1,189,232,128,128,189,232

Lme_e:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_ShowAnimated
_GCDiscreetNotification_GCDiscreetNotificationView_ShowAnimated:
.loc 2 192 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,7,0,0,10,8,0,154,229
.loc 2 193 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 80
	.byte 1,16,159,231,0,16,145,229
bl _p_21

	.byte 7,0,0,234
.loc 2 195 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 80
	.byte 1,16,159,231,0,16,145,229
bl _p_22
.loc 2 197 0

	.byte 0,208,141,226,0,5,189,232,128,128,189,232

Lme_f:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_HideAnimated
_GCDiscreetNotification_GCDiscreetNotificationView_HideAnimated:
.loc 2 203 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,7,0,0,10,8,0,154,229
.loc 2 204 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 84
	.byte 1,16,159,231,0,16,145,229
bl _p_21

	.byte 7,0,0,234
.loc 2 206 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 84
	.byte 1,16,159,231,0,16,145,229
bl _p_22
.loc 2 208 0

	.byte 0,208,141,226,0,5,189,232,128,128,189,232

Lme_10:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_hideAnimated_double
_GCDiscreetNotification_GCDiscreetNotificationView_hideAnimated_double:
.loc 2 214 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,16,208,77,226,0,160,160,225,8,16,141,229,12,32,141,229,17,0,218,229
	.byte 0,0,80,227,11,0,0,10,8,0,154,229
.loc 2 215 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 88
	.byte 1,16,159,231,0,16,145,229,2,43,157,237,2,43,13,237,8,32,29,229,4,48,29,229
bl _p_23

	.byte 11,0,0,234
.loc 2 217 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 88
	.byte 1,16,159,231,0,16,145,229,2,43,157,237,2,43,13,237,8,32,29,229,4,48,29,229
bl _p_24
.loc 2 219 0

	.byte 16,208,141,226,0,5,189,232,128,128,189,232

Lme_11:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_Show_bool
_GCDiscreetNotification_GCDiscreetNotificationView_Show_bool:
.loc 2 225 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,8,208,77,226,0,160,160,225,0,16,205,229,17,0,218,229,0,0,80,227
	.byte 8,0,0,10,8,0,154,229
.loc 2 226 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 92
	.byte 1,16,159,231,0,16,145,229,0,32,221,229
bl _p_25

	.byte 8,0,0,234
.loc 2 228 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 92
	.byte 1,16,159,231,0,16,145,229,0,32,221,229
bl _p_26
.loc 2 230 0

	.byte 8,208,141,226,0,5,189,232,128,128,189,232

Lme_12:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_Hide_bool
_GCDiscreetNotification_GCDiscreetNotificationView_Hide_bool:
.loc 2 236 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,8,208,77,226,0,160,160,225,0,16,205,229,17,0,218,229,0,0,80,227
	.byte 8,0,0,10,8,0,154,229
.loc 2 237 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 96
	.byte 1,16,159,231,0,16,145,229,0,32,221,229
bl _p_25

	.byte 8,0,0,234
.loc 2 239 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 96
	.byte 1,16,159,231,0,16,145,229,0,32,221,229
bl _p_26
.loc 2 241 0

	.byte 8,208,141,226,0,5,189,232,128,128,189,232

Lme_13:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAutomaticallyAnimated
_GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAutomaticallyAnimated:
.loc 2 247 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,7,0,0,10,8,0,154,229
.loc 2 248 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 100
	.byte 1,16,159,231,0,16,145,229
bl _p_21

	.byte 7,0,0,234
.loc 2 250 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 100
	.byte 1,16,159,231,0,16,145,229
bl _p_22
.loc 2 252 0

	.byte 0,208,141,226,0,5,189,232,128,128,189,232

Lme_14:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAfter_double
_GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAfter_double:
.loc 2 258 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,16,208,77,226,0,160,160,225,8,16,141,229,12,32,141,229,17,0,218,229
	.byte 0,0,80,227,11,0,0,10,8,0,154,229
.loc 2 259 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 104
	.byte 1,16,159,231,0,16,145,229,2,43,157,237,2,43,13,237,8,32,29,229,4,48,29,229
bl _p_23

	.byte 11,0,0,234
.loc 2 261 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 104
	.byte 1,16,159,231,0,16,145,229,2,43,157,237,2,43,13,237,8,32,29,229,4,48,29,229
bl _p_24
.loc 2 263 0

	.byte 16,208,141,226,0,5,189,232,128,128,189,232

Lme_15:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool
_GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool:
.loc 2 269 0

	.byte 128,64,45,233,13,112,160,225,96,1,45,233,12,208,77,226,0,96,160,225,0,16,141,229,4,32,205,229,0,0,157,229
	.byte 0,0,80,227,30,0,0,10,0,0,157,229
.loc 2 271 0
bl _p_10

	.byte 0,80,160,225
.loc 2 273 0

	.byte 17,0,214,229,0,0,80,227,9,0,0,10,8,0,150,229
.loc 2 274 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 108
	.byte 1,16,159,231,0,16,145,229,5,32,160,225,4,48,221,229
bl _p_27

	.byte 9,0,0,234
.loc 2 276 0

	.byte 6,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 108
	.byte 1,16,159,231,0,16,145,229,5,32,160,225,4,48,221,229
bl _p_28
.loc 2 278 0

	.byte 5,0,160,225
bl _p_13
.loc 2 280 0

	.byte 12,208,141,226,96,1,189,232,128,128,189,232
.loc 2 270 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,1,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_16:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_SetShowActivity_bool_bool
_GCDiscreetNotification_GCDiscreetNotificationView_SetShowActivity_bool_bool:
.loc 2 286 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,8,208,77,226,0,160,160,225,0,16,205,229,4,32,205,229,17,0,218,229
	.byte 0,0,80,227,9,0,0,10,8,0,154,229
.loc 2 287 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 112
	.byte 1,16,159,231,0,16,145,229,0,32,221,229,4,48,221,229
bl _p_29

	.byte 9,0,0,234
.loc 2 289 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 112
	.byte 1,16,159,231,0,16,145,229,0,32,221,229,4,48,221,229
bl _p_30
.loc 2 291 0

	.byte 8,208,141,226,0,5,189,232,128,128,189,232

Lme_17:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool_bool
_GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool_bool:
.loc 2 297 0

	.byte 128,64,45,233,13,112,160,225,96,9,45,233,24,208,77,226,13,176,160,225,0,96,160,225,8,16,139,229,12,32,203,229
	.byte 16,48,203,229,8,0,155,229,0,0,80,227,34,0,0,10,8,0,155,229
.loc 2 299 0
bl _p_10

	.byte 0,80,160,225
.loc 2 301 0

	.byte 17,0,214,229,0,0,80,227,11,0,0,10,8,0,150,229
.loc 2 302 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 116
	.byte 1,16,159,231,0,16,145,229,5,32,160,225,12,48,219,229,16,192,219,229,0,192,141,229
bl _p_31

	.byte 11,0,0,234
.loc 2 304 0

	.byte 6,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 116
	.byte 1,16,159,231,0,16,145,229,5,32,160,225,12,48,219,229,16,192,219,229,0,192,141,229
bl _p_32
.loc 2 306 0

	.byte 5,0,160,225
bl _p_13
.loc 2 308 0

	.byte 24,208,139,226,96,9,189,232,128,128,189,232
.loc 2 298 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,1,16,160,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_18:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_Label
_GCDiscreetNotification_GCDiscreetNotificationView_get_Label:
.loc 2 317 0

	.byte 128,64,45,233,13,112,160,225,96,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,22,0,0,10,8,0,154,229
.loc 2 318 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 36
	.byte 1,16,159,231,0,16,145,229
bl _p_3
bl _p_33

	.byte 0,80,160,225,0,0,85,227,9,0,0,10,0,0,149,229,0,0,144,229,8,0,144,229,16,0,144,229,0,16,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 128
	.byte 1,16,159,231,1,0,80,225,36,0,0,27,5,96,160,225,22,0,0,234
.loc 2 320 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 36
	.byte 1,16,159,231,0,16,145,229
bl _p_6
bl _p_33

	.byte 0,80,160,225,0,0,85,227,9,0,0,10,0,0,149,229,0,0,144,229,8,0,144,229,16,0,144,229,0,16,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 128
	.byte 1,16,159,231,1,0,80,225,12,0,0,27,5,96,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 132
	.byte 0,0,159,231,0,0,208,229
.loc 2 322 0

	.byte 0,0,80,227,0,0,0,26
.loc 2 323 0

	.byte 32,96,138,229
.loc 2 324 0

	.byte 6,0,160,225,0,208,141,226,96,5,189,232,128,128,189,232,14,16,160,225,0,0,159,229
bl _p_34

	.byte 57,2,0,2

Lme_19:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_ActivityIndicator
_GCDiscreetNotification_GCDiscreetNotificationView_get_ActivityIndicator:
.loc 2 336 0

	.byte 128,64,45,233,13,112,160,225,96,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,22,0,0,10,8,0,154,229
.loc 2 337 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 40
	.byte 1,16,159,231,0,16,145,229
bl _p_3
bl _p_33

	.byte 0,80,160,225,0,0,85,227,9,0,0,10,0,0,149,229,0,0,144,229,8,0,144,229,16,0,144,229,0,16,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 136
	.byte 1,16,159,231,1,0,80,225,36,0,0,27,5,96,160,225,22,0,0,234
.loc 2 339 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 40
	.byte 1,16,159,231,0,16,145,229
bl _p_6
bl _p_33

	.byte 0,80,160,225,0,0,85,227,9,0,0,10,0,0,149,229,0,0,144,229,8,0,144,229,16,0,144,229,0,16,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 136
	.byte 1,16,159,231,1,0,80,225,12,0,0,27,5,96,160,225,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 132
	.byte 0,0,159,231,0,0,208,229
.loc 2 341 0

	.byte 0,0,80,227,0,0,0,26
.loc 2 342 0

	.byte 36,96,138,229
.loc 2 343 0

	.byte 6,0,160,225,0,208,141,226,96,5,189,232,128,128,189,232,14,16,160,225,0,0,159,229
bl _p_34

	.byte 57,2,0,2

Lme_1a:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_View
_GCDiscreetNotification_GCDiscreetNotificationView_get_View:
.loc 2 355 0

	.byte 128,64,45,233,13,112,160,225,96,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,22,0,0,10,8,0,154,229
.loc 2 356 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 44
	.byte 1,16,159,231,0,16,145,229
bl _p_3
bl _p_33

	.byte 0,80,160,225,0,0,85,227,9,0,0,10,0,0,149,229,0,0,144,229,8,0,144,229,12,0,144,229,0,16,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 140
	.byte 1,16,159,231,1,0,80,225,31,0,0,27,5,96,160,225,22,0,0,234
.loc 2 358 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 44
	.byte 1,16,159,231,0,16,145,229
bl _p_6
bl _p_33

	.byte 0,80,160,225,0,0,85,227,9,0,0,10,0,0,149,229,0,0,144,229,8,0,144,229,12,0,144,229,0,16,159,229
	.byte 0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 140
	.byte 1,16,159,231,1,0,80,225,7,0,0,27,5,96,160,225
.loc 2 360 0

	.byte 10,0,160,225
bl _p_35
.loc 2 361 0

	.byte 40,96,138,229
.loc 2 362 0

	.byte 6,0,160,225,0,208,141,226,96,5,189,232,128,128,189,232,14,16,160,225,0,0,159,229
bl _p_34

	.byte 57,2,0,2

Lme_1b:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_set_View_MonoTouch_UIKit_UIView
_GCDiscreetNotification_GCDiscreetNotificationView_set_View_MonoTouch_UIKit_UIView:
.loc 2 367 0

	.byte 128,64,45,233,13,112,160,225,64,5,45,233,4,208,77,226,0,96,160,225,1,160,160,225,0,0,90,227,28,0,0,10
.loc 2 369 0

	.byte 17,0,214,229,0,0,80,227,9,0,0,10,8,0,150,229
.loc 2 370 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 48
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,32,154,229
bl _p_36

	.byte 9,0,0,234
.loc 2 372 0

	.byte 6,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 48
	.byte 1,16,159,231,0,16,145,229,0,224,218,229,8,32,154,229
bl _p_37
.loc 2 374 0

	.byte 6,0,160,225
bl _p_35
.loc 2 375 0

	.byte 40,160,134,229
.loc 2 376 0

	.byte 4,208,141,226,64,5,189,232,128,128,189,232
.loc 2 368 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,203,19,0,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_1c:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_PresentationMode
_GCDiscreetNotification_GCDiscreetNotificationView_get_PresentationMode:
.loc 2 383 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,7,0,0,10,8,0,154,229
.loc 2 384 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 52
	.byte 1,16,159,231,0,16,145,229
bl _p_38

	.byte 7,0,0,234
.loc 2 386 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 52
	.byte 1,16,159,231,0,16,145,229
bl _p_39

	.byte 0,208,141,226,0,5,189,232,128,128,189,232

Lme_1d:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_set_PresentationMode_GCDiscreetNotification_GCDNPresentationMode
_GCDiscreetNotification_GCDiscreetNotificationView_set_PresentationMode_GCDiscreetNotification_GCDNPresentationMode:
.loc 2 392 0

	.byte 128,64,45,233,13,112,160,225,64,1,45,233,8,208,77,226,0,96,160,225,0,16,141,229,17,0,214,229,0,0,80,227
	.byte 8,0,0,10,8,0,150,229
.loc 2 393 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 56
	.byte 1,16,159,231,0,16,145,229,0,32,157,229
bl _p_40

	.byte 8,0,0,234
.loc 2 395 0

	.byte 6,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 56
	.byte 1,16,159,231,0,16,145,229,0,32,157,229
bl _p_41
.loc 2 397 0

	.byte 8,208,141,226,64,1,189,232,128,128,189,232

Lme_1e:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_TextLabel
_GCDiscreetNotification_GCDiscreetNotificationView_get_TextLabel:
.loc 2 404 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,8,0,0,10,8,0,154,229
.loc 2 405 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 60
	.byte 1,16,159,231,0,16,145,229
bl _p_3
bl _p_42

	.byte 8,0,0,234
.loc 2 407 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 60
	.byte 1,16,159,231,0,16,145,229
bl _p_6
bl _p_42

	.byte 0,208,141,226,0,5,189,232,128,128,189,232

Lme_1f:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_set_TextLabel_string
_GCDiscreetNotification_GCDiscreetNotificationView_set_TextLabel_string:
.loc 2 413 0

	.byte 128,64,45,233,13,112,160,225,96,1,45,233,12,208,77,226,0,96,160,225,0,16,141,229,0,0,157,229,0,0,80,227
	.byte 28,0,0,10,0,0,157,229
.loc 2 415 0
bl _p_10

	.byte 0,80,160,225
.loc 2 417 0

	.byte 17,0,214,229,0,0,80,227,8,0,0,10,8,0,150,229
.loc 2 418 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 64
	.byte 1,16,159,231,0,16,145,229,5,32,160,225
bl _p_36

	.byte 8,0,0,234
.loc 2 420 0

	.byte 6,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 64
	.byte 1,16,159,231,0,16,145,229,5,32,160,225
bl _p_37
.loc 2 422 0

	.byte 5,0,160,225
bl _p_13
.loc 2 424 0

	.byte 12,208,141,226,96,1,189,232,128,128,189,232
.loc 2 414 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . -12
	.byte 0,0,159,231,203,19,0,227
bl _p_14

	.byte 0,16,160,225,230,1,0,227,0,2,64,227
bl _mono_create_corlib_exception_1
bl _p_15

Lme_20:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_ShowActivity
_GCDiscreetNotification_GCDiscreetNotificationView_get_ShowActivity:
.loc 2 431 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,8,0,0,10,8,0,154,229
.loc 2 432 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 68
	.byte 1,16,159,231,0,16,145,229
bl _p_43

	.byte 255,0,0,226,8,0,0,234
.loc 2 434 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 68
	.byte 1,16,159,231,0,16,145,229
bl _p_44

	.byte 255,0,0,226,0,208,141,226,0,5,189,232,128,128,189,232

Lme_21:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_set_ShowActivity_bool
_GCDiscreetNotification_GCDiscreetNotificationView_set_ShowActivity_bool:
.loc 2 440 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,8,208,77,226,0,160,160,225,0,16,205,229,17,0,218,229,0,0,80,227
	.byte 8,0,0,10,8,0,154,229
.loc 2 441 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 72
	.byte 1,16,159,231,0,16,145,229,0,32,221,229
bl _p_25

	.byte 8,0,0,234
.loc 2 443 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 72
	.byte 1,16,159,231,0,16,145,229,0,32,221,229
bl _p_26
.loc 2 445 0

	.byte 8,208,141,226,0,5,189,232,128,128,189,232

Lme_22:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_get_Showing
_GCDiscreetNotification_GCDiscreetNotificationView_get_Showing:
.loc 2 452 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,0,160,160,225,17,0,218,229,0,0,80,227,8,0,0,10,8,0,154,229
.loc 2 453 0

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 76
	.byte 1,16,159,231,0,16,145,229
bl _p_43

	.byte 255,0,0,226,8,0,0,234
.loc 2 455 0

	.byte 10,0,160,225
bl _p_5

	.byte 0,16,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 76
	.byte 1,16,159,231,0,16,145,229
bl _p_44

	.byte 255,0,0,226,0,208,141,226,0,5,189,232,128,128,189,232

Lme_23:
.text
	.align 2
	.no_dead_strip _GCDiscreetNotification_GCDiscreetNotificationView_Dispose_bool
_GCDiscreetNotification_GCDiscreetNotificationView_Dispose_bool:
.loc 2 463 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,16,208,77,226,0,160,160,225,8,16,205,229,10,0,160,225,8,16,221,229
bl _p_45

	.byte 8,16,154,229
.loc 2 464 0

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 144
	.byte 0,0,159,231,0,0,144,229,0,16,141,229,4,0,141,229,0,0,157,229,4,16,157,229,1,0,80,225,0,0,160,19
	.byte 1,0,160,3,0,0,80,227,5,0,0,10,0,0,160,227
.loc 2 465 0

	.byte 32,0,138,229,0,0,160,227
.loc 2 466 0

	.byte 36,0,138,229,0,0,160,227
.loc 2 467 0

	.byte 40,0,138,229
.loc 2 469 0

	.byte 16,208,141,226,0,5,189,232,128,128,189,232

Lme_24:
.text
	.align 2
	.no_dead_strip _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
_wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr:
.file 3 "<unknown>"
.loc 3 1 0

	.byte 128,64,45,233,13,112,160,225,13,192,160,225,240,95,45,233,80,208,77,226,13,176,160,225,12,0,139,229,16,16,139,229
	.byte 20,32,139,229,24,48,203,229,128,224,157,229,28,224,139,229,132,224,157,229,32,224,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - .
	.byte 0,0,159,231
bl _pthread_getspecific

	.byte 8,0,128,226,40,16,141,226,4,0,129,229,0,192,144,229,0,192,129,229,0,16,128,229,12,208,129,229,20,176,129,229
	.byte 15,192,160,225,16,192,129,229,0,96,160,227,24,0,219,229,0,0,80,227,0,0,0,10,1,96,160,227,12,0,155,229
	.byte 16,16,155,229,20,32,155,229,6,48,160,225,28,192,155,229,0,192,141,229,32,192,155,229,4,192,141,229
bl _p_46

	.byte 8,0,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 148
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,8,0,0,26,8,0,155,229,40,32,139,226,0,192,146,229,4,224,146,229
	.byte 0,192,142,229,88,208,139,226,192,31,189,232,4,208,141,226,128,128,189,232
bl _p_47

	.byte 244,255,255,234

Lme_26:
.text
	.align 2
	.no_dead_strip _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
_wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr:
.loc 3 1 0

	.byte 128,64,45,233,13,112,160,225,13,192,160,225,240,95,45,233,80,208,77,226,13,176,160,225,12,0,139,229,16,16,139,229
	.byte 20,32,139,229,24,48,203,229,128,224,157,229,28,224,139,229,132,224,157,229,32,224,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - .
	.byte 0,0,159,231
bl _pthread_getspecific

	.byte 8,0,128,226,40,16,141,226,4,0,129,229,0,192,144,229,0,192,129,229,0,16,128,229,12,208,129,229,20,176,129,229
	.byte 15,192,160,225,16,192,129,229,0,96,160,227,24,0,219,229,0,0,80,227,0,0,0,10,1,96,160,227,12,0,155,229
	.byte 16,16,155,229,20,32,155,229,6,48,160,225,28,192,155,229,0,192,141,229,32,192,155,229,4,192,141,229
bl _p_48

	.byte 8,0,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 148
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,8,0,0,26,8,0,155,229,40,32,139,226,0,192,146,229,4,224,146,229
	.byte 0,192,142,229,88,208,139,226,192,31,189,232,4,208,141,226,128,128,189,232
bl _p_47

	.byte 244,255,255,234

Lme_27:
.text
	.align 2
	.no_dead_strip _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
_wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool:
.loc 3 1 0

	.byte 128,64,45,233,13,112,160,225,13,192,160,225,240,95,45,233,72,208,77,226,13,176,160,225,8,0,139,229,12,16,139,229
	.byte 16,32,139,229,20,48,203,229,120,224,157,229,24,224,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - .
	.byte 0,0,159,231
bl _pthread_getspecific

	.byte 8,0,128,226,32,16,141,226,4,0,129,229,0,192,144,229,0,192,129,229,0,16,128,229,12,208,129,229,20,176,129,229
	.byte 15,192,160,225,16,192,129,229,0,64,160,227,0,160,160,227,20,0,219,229,0,0,80,227,0,0,0,10,1,64,160,227
	.byte 24,0,219,229,0,0,80,227,0,0,0,10,1,160,160,227,8,0,155,229,12,16,155,229,16,32,155,229,4,48,160,225
	.byte 0,160,141,229
bl _p_49

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 148
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,7,0,0,26,32,32,139,226,0,192,146,229,4,224,146,229,0,192,142,229
	.byte 72,208,139,226,240,31,189,232,4,208,141,226,128,128,189,232
bl _p_47

	.byte 245,255,255,234

Lme_28:
.text
	.align 2
	.no_dead_strip _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
_wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool:
.loc 3 1 0

	.byte 128,64,45,233,13,112,160,225,13,192,160,225,240,95,45,233,72,208,77,226,13,176,160,225,8,0,139,229,12,16,139,229
	.byte 16,32,139,229,20,48,203,229,120,224,157,229,24,224,139,229,0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - .
	.byte 0,0,159,231
bl _pthread_getspecific

	.byte 8,0,128,226,32,16,141,226,4,0,129,229,0,192,144,229,0,192,129,229,0,16,128,229,12,208,129,229,20,176,129,229
	.byte 15,192,160,225,16,192,129,229,0,64,160,227,0,160,160,227,20,0,219,229,0,0,80,227,0,0,0,10,1,64,160,227
	.byte 24,0,219,229,0,0,80,227,0,0,0,10,1,160,160,227,8,0,155,229,12,16,155,229,16,32,155,229,4,48,160,225
	.byte 0,160,141,229
bl _p_50

	.byte 0,0,159,229,0,0,0,234
	.long _mono_aot_GCDiscreetNotification_got - . + 148
	.byte 0,0,159,231,0,0,144,229,0,0,80,227,7,0,0,26,32,32,139,226,0,192,146,229,4,224,146,229,0,192,142,229
	.byte 72,208,139,226,240,31,189,232,4,208,141,226,128,128,189,232
bl _p_47

	.byte 245,255,255,234

Lme_29:
.text
	.align 3
methods_end:

	.long 0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
	bl _ApiDefinition_Messaging__ctor
	bl _ApiDefinition_Messaging__cctor
	bl method_addresses
	bl method_addresses
	bl method_addresses
	bl method_addresses
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSCoder
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSObjectFlag
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor_intptr
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_MonoTouch_UIKit_UIView
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_MonoTouch_UIKit_UIView
	bl _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_GCDiscreetNotification_GCDNPresentationMode_MonoTouch_UIKit_UIView
	bl _GCDiscreetNotification_GCDiscreetNotificationView__cctor
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_ClassHandle
	bl _GCDiscreetNotification_GCDiscreetNotificationView_ShowAnimated
	bl _GCDiscreetNotification_GCDiscreetNotificationView_HideAnimated
	bl _GCDiscreetNotification_GCDiscreetNotificationView_hideAnimated_double
	bl _GCDiscreetNotification_GCDiscreetNotificationView_Show_bool
	bl _GCDiscreetNotification_GCDiscreetNotificationView_Hide_bool
	bl _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAutomaticallyAnimated
	bl _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAfter_double
	bl _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool
	bl _GCDiscreetNotification_GCDiscreetNotificationView_SetShowActivity_bool_bool
	bl _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool_bool
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_Label
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_ActivityIndicator
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_View
	bl _GCDiscreetNotification_GCDiscreetNotificationView_set_View_MonoTouch_UIKit_UIView
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_PresentationMode
	bl _GCDiscreetNotification_GCDiscreetNotificationView_set_PresentationMode_GCDiscreetNotification_GCDNPresentationMode
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_TextLabel
	bl _GCDiscreetNotification_GCDiscreetNotificationView_set_TextLabel_string
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_ShowActivity
	bl _GCDiscreetNotification_GCDiscreetNotificationView_set_ShowActivity_bool
	bl _GCDiscreetNotification_GCDiscreetNotificationView_get_Showing
	bl _GCDiscreetNotification_GCDiscreetNotificationView_Dispose_bool
	bl method_addresses
	bl _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
	bl _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
	bl _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
	bl _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
method_addresses_end:
.section __TEXT, __const
	.align 3
code_offsets:

	.long 0

.text
	.align 3
unbox_trampolines:
unbox_trampolines_end:
.section __TEXT, __const
	.align 3
method_info_offsets:

	.long 42,10,5,2
	.short 0, 14, 24, 34, 50
	.byte 1,3,255,255,255,255,252,0,0,0,9,7,7,4,31,7,7,7,29,4,5,5,5,5,110,5,5,5,5,5,8,8
	.byte 7,5,128,168,5,5,5,5,5,5,255,255,255,255,58,128,202,5,128,212,5
.section __TEXT, __const
	.align 3
extra_method_table:

	.long 11,0,0,0,0,0,0,0
	.long 0,0,238,40,0,0,0,0
	.long 0,0,0,230,39,0,0,0
	.long 0,0,0,0,246,41,0,222
	.long 38,0
.section __TEXT, __const
	.align 3
extra_method_info_offsets:

	.long 4,38,222,39,230,40,238,41
	.long 246
.section __TEXT, __const
	.align 3
class_name_table:

	.short 11, 1, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 2, 0, 3, 0, 0
	.short 0, 0, 0, 0, 0, 4, 0
.section __TEXT, __const
	.align 3
got_info_offsets:

	.long 41,10,5,2
	.short 0, 11, 22, 33, 44
	.byte 128,254,2,1,1,1,7,4,6,6,6,129,36,4,4,4,4,4,4,4,4,4,129,76,4,4,4,4,4,4,4,4
	.byte 4,129,116,4,4,4,4,4,5,6,5,5,129,164
.section __TEXT, __const
	.align 3
ex_info_offsets:

	.long 42,10,5,2
	.short 0, 16, 27, 38, 54
	.byte 130,236,3,255,255,255,253,17,0,0,0,130,242,3,3,3,130,254,3,3,4,3,3,3,3,4,4,131,32,3,4,4
	.byte 4,4,4,4,4,3,131,69,3,3,4,3,4,3,255,255,255,252,167,131,93,4,131,101,4
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 18,12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24,18,12,13,0,72,14,8,135,2,68,14,12,136
	.byte 3,142,1,68,14,16,17,12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,22,12,13,0,72,14,8,135
	.byte 2,68,14,20,134,5,136,4,138,3,142,1,68,14,24,20,12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142
	.byte 1,68,14,24,24,12,13,0,72,14,8,135,2,68,14,24,132,6,133,5,136,4,138,3,142,1,68,14,32,29,12,13
	.byte 0,72,14,8,135,2,68,14,28,132,7,133,6,136,5,138,4,139,3,142,1,68,14,48,68,13,11,27,12,13,0,72
	.byte 14,8,135,2,68,14,24,132,6,136,5,138,4,139,3,142,1,68,14,56,68,13,11,20,12,13,0,72,14,8,135,2
	.byte 68,14,16,136,4,138,3,142,1,68,14,32,20,12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14
	.byte 24,22,12,13,0,72,14,8,135,2,68,14,20,133,5,134,4,136,3,142,1,68,14,32,27,12,13,0,72,14,8,135
	.byte 2,68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,48,68,13,11,21,12,13,0,72,14,8,135,2,68,14,24
	.byte 133,6,134,5,136,4,138,3,142,1,36,12,13,0,72,14,8,135,2,72,14,48,132,12,133,11,134,10,136,8,137,7
	.byte 138,6,139,5,140,4,142,3,68,14,128,1,68,13,11,35,12,13,0,72,14,8,135,2,72,14,48,132,12,133,11,134
	.byte 10,136,8,137,7,138,6,139,5,140,4,142,3,68,14,120,68,13,11
.section __TEXT, __const
	.align 3
class_info_offsets:

	.long 4,10,1,2
	.short 0
	.byte 131,109,7,99,24

.text
	.align 4
plt:
_mono_aot_GCDiscreetNotification_plt:
	.no_dead_strip plt_MonoTouch_UIKit_UIView__ctor_MonoTouch_Foundation_NSObjectFlag
plt_MonoTouch_UIKit_UIView__ctor_MonoTouch_Foundation_NSObjectFlag:
_p_1:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 164,421
	.no_dead_strip plt_System_Reflection_Assembly_op_Equality_System_Reflection_Assembly_System_Reflection_Assembly
plt_System_Reflection_Assembly_op_Equality_System_Reflection_Assembly_System_Reflection_Assembly:
_p_2:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 168,426
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_intptr_intptr:
_p_3:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 172,431
	.no_dead_strip plt_MonoTouch_Foundation_NSObject_set_Handle_intptr
plt_MonoTouch_Foundation_NSObject_set_Handle_intptr:
_p_4:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 176,436
	.no_dead_strip plt_MonoTouch_Foundation_NSObject_get_SuperHandle
plt_MonoTouch_Foundation_NSObject_get_SuperHandle:
_p_5:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 180,441
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_intptr_intptr:
_p_6:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 184,446
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_IntPtr_intptr_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_IntPtr_intptr_intptr_intptr:
_p_7:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 188,451
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_IntPtr_intptr_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_IntPtr_intptr_intptr_intptr:
_p_8:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 192,456
	.no_dead_strip plt_MonoTouch_UIKit_UIView__ctor_intptr
plt_MonoTouch_UIKit_UIView__ctor_intptr:
_p_9:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 196,461
	.no_dead_strip plt_MonoTouch_Foundation_NSString_CreateNative_string
plt_MonoTouch_Foundation_NSString_CreateNative_string:
_p_10:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 200,466
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_IntPtr_IntPtr_intptr_intptr_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_IntPtr_IntPtr_intptr_intptr_intptr_intptr:
_p_11:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 204,471
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_IntPtr_IntPtr_intptr_intptr_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_IntPtr_IntPtr_intptr_intptr_intptr_intptr:
_p_12:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 208,476
	.no_dead_strip plt_MonoTouch_Foundation_NSString_ReleaseNative_intptr
plt_MonoTouch_Foundation_NSString_ReleaseNative_intptr:
_p_13:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 212,481
	.no_dead_strip plt__jit_icall_mono_helper_ldstr
plt__jit_icall_mono_helper_ldstr:
_p_14:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 216,486
	.no_dead_strip plt__jit_icall_mono_arch_throw_exception
plt__jit_icall_mono_arch_throw_exception:
_p_15:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 220,506
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_IntPtr_bool_IntPtr_intptr_intptr_intptr_bool_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSend_IntPtr_bool_IntPtr_intptr_intptr_intptr_bool_intptr:
_p_16:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 224,534
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_IntPtr_intptr_intptr_intptr_bool_intptr
plt_MonoTouch_ObjCRuntime_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_IntPtr_intptr_intptr_intptr_bool_intptr:
_p_17:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 228,539
	.no_dead_strip plt_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
plt_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr:
_p_18:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 232,544
	.no_dead_strip plt_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
plt_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr:
_p_19:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 236,546
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Class_GetHandle_string
plt_MonoTouch_ObjCRuntime_Class_GetHandle_string:
_p_20:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 240,548
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_intptr_intptr:
_p_21:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 244,553
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_intptr_intptr:
_p_22:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 248,558
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_Double_intptr_intptr_double
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_Double_intptr_intptr_double:
_p_23:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 252,563
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_Double_intptr_intptr_double
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_Double_intptr_intptr_double:
_p_24:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 256,568
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_bool_intptr_intptr_bool
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_bool_intptr_intptr_bool:
_p_25:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 260,573
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_bool_intptr_intptr_bool
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_bool_intptr_intptr_bool:
_p_26:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 264,578
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_IntPtr_bool_intptr_intptr_intptr_bool
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_IntPtr_bool_intptr_intptr_intptr_bool:
_p_27:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 268,583
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_IntPtr_bool_intptr_intptr_intptr_bool
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_IntPtr_bool_intptr_intptr_intptr_bool:
_p_28:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 272,588
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_bool_bool_intptr_intptr_bool_bool
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_bool_bool_intptr_intptr_bool_bool:
_p_29:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 276,593
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_bool_bool_intptr_intptr_bool_bool
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_bool_bool_intptr_intptr_bool_bool:
_p_30:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 280,598
	.no_dead_strip plt_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
plt_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool:
_p_31:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 284,603
	.no_dead_strip plt_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
plt_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool:
_p_32:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 288,605
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Runtime_GetNSObject_intptr
plt_MonoTouch_ObjCRuntime_Runtime_GetNSObject_intptr:
_p_33:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 292,607
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_34:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 296,612
	.no_dead_strip plt_MonoTouch_Foundation_NSObject_MarkDirty
plt_MonoTouch_Foundation_NSObject_MarkDirty:
_p_35:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 300,647
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_IntPtr_intptr_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_IntPtr_intptr_intptr_intptr:
_p_36:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 304,652
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_IntPtr_intptr_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_IntPtr_intptr_intptr_intptr:
_p_37:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 308,657
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_int_objc_msgSend_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_int_objc_msgSend_intptr_intptr:
_p_38:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 312,662
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_int_objc_msgSendSuper_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_int_objc_msgSendSuper_intptr_intptr:
_p_39:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 316,667
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_int_intptr_intptr_int
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSend_int_intptr_intptr_int:
_p_40:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 320,672
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_int_intptr_intptr_int
plt_MonoTouch_ObjCRuntime_Messaging_void_objc_msgSendSuper_int_intptr_intptr_int:
_p_41:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 324,677
	.no_dead_strip plt_MonoTouch_Foundation_NSString_FromHandle_intptr
plt_MonoTouch_Foundation_NSString_FromHandle_intptr:
_p_42:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 328,682
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_bool_objc_msgSend_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_bool_objc_msgSend_intptr_intptr:
_p_43:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 332,687
	.no_dead_strip plt_MonoTouch_ObjCRuntime_Messaging_bool_objc_msgSendSuper_intptr_intptr
plt_MonoTouch_ObjCRuntime_Messaging_bool_objc_msgSendSuper_intptr_intptr:
_p_44:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 336,692
	.no_dead_strip plt_MonoTouch_UIKit_UIView_Dispose_bool
plt_MonoTouch_UIKit_UIView_Dispose_bool:
_p_45:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 340,697
	.no_dead_strip plt__icall_native__ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
plt__icall_native__ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr:
_p_46:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 344,702
	.no_dead_strip plt__jit_icall_mono_thread_interruption_checkpoint
plt__jit_icall_mono_thread_interruption_checkpoint:
_p_47:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 348,704
	.no_dead_strip plt__icall_native__ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
plt__icall_native__ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr:
_p_48:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 352,742
	.no_dead_strip plt__icall_native__ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
plt__icall_native__ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool:
_p_49:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 356,744
	.no_dead_strip plt__icall_native__ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
plt__icall_native__ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool:
_p_50:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_GCDiscreetNotification_got - . + 360,746
plt_end:
.section __TEXT, __const
	.align 3
image_table:

	.long 3
	.asciz "GCDiscreetNotification"
	.asciz "B685B271-6ACD-4DF4-942D-B69E9CF68D80"
	.asciz ""
	.asciz ""
	.align 3

	.long 0,0,0,0,0
	.asciz "monotouch"
	.asciz "0C632B79-769C-456D-B301-2641B7220F68"
	.asciz ""
	.asciz "84e04ff9cfb79065"
	.align 3

	.long 1,0,0,0,0
	.asciz "mscorlib"
	.asciz "E3F22CEB-454B-4F21-8D65-5E22A00B8616"
	.asciz ""
	.asciz "7cec85d7bea7798e"
	.align 3

	.long 1,2,0,5,0
.data
	.align 3
_mono_aot_GCDiscreetNotification_got:
	.space 368
got_end:
.section __TEXT, __const
	.align 2
assembly_guid:
	.asciz "B685B271-6ACD-4DF4-942D-B69E9CF68D80"
.section __TEXT, __const
	.align 2
runtime_version:
	.asciz ""
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "GCDiscreetNotification"
.data
	.align 3
_mono_aot_file_info:

	.long 95,0
	.align 2
	.long _mono_aot_GCDiscreetNotification_got
	.align 2
	.long methods
	.align 2
	.long 0
	.align 2
	.long blob
	.align 2
	.long class_name_table
	.align 2
	.long class_info_offsets
	.align 2
	.long method_info_offsets
	.align 2
	.long ex_info_offsets
	.align 2
	.long code_offsets
	.align 2
	.long method_addresses
	.align 2
	.long extra_method_info_offsets
	.align 2
	.long extra_method_table
	.align 2
	.long got_info_offsets
	.align 2
	.long methods_end
	.align 2
	.long unwind_info
	.align 2
	.long mem_end
	.align 2
	.long image_table
	.align 2
	.long plt
	.align 2
	.long plt_end
	.align 2
	.long assembly_guid
	.align 2
	.long runtime_version
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long globals
	.align 2
	.long assembly_name
	.align 2
	.long unbox_trampolines
	.align 2
	.long unbox_trampolines_end

	.long 41,368,51,42,10,118565375,0,1170
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,128,4,4,14
	.globl _mono_aot_module_GCDiscreetNotification_info
	.align 2
_mono_aot_module_GCDiscreetNotification_info:
	.align 2
	.long _mono_aot_file_info
.section __TEXT, __const
	.align 3
blob:

	.byte 0,1,3,0,1,3,2,4,5,1,4,4,6,5,7,7,1,4,4,6,5,8,8,1,4,1,5,1,4,1,5,1
	.byte 4,4,6,5,9,9,1,4,4,6,5,10,10,1,4,4,6,5,11,11,1,4,26,12,13,14,15,16,17,18,19,20
	.byte 21,22,9,10,11,23,24,25,26,27,28,29,30,31,32,33,34,1,4,1,34,1,4,2,23,23,1,4,2,24,24,1
	.byte 4,2,25,25,1,4,2,26,26,1,4,2,27,27,1,4,2,28,28,1,4,2,29,29,1,4,2,30,30,1,4,2
	.byte 31,31,1,4,2,32,32,1,4,5,12,35,12,35,36,1,4,5,13,37,13,37,36,1,4,4,14,38,14,38,1,4
	.byte 2,15,15,1,4,2,16,16,1,4,2,17,17,1,4,2,18,18,1,4,2,19,19,1,4,2,20,20,1,4,2,21
	.byte 21,1,4,2,22,22,1,4,1,39,1,3,2,3,40,1,3,2,3,40,1,3,2,3,40,1,3,2,3,40,255,252
	.byte 0,0,0,6,0,3,255,252,0,0,0,6,0,4,255,252,0,0,0,6,0,5,255,252,0,0,0,6,0,6,12,0
	.byte 39,42,47,19,0,194,0,0,3,0,16,1,3,5,16,2,69,1,129,112,16,2,122,1,129,251,16,2,122,1,129,252
	.byte 16,1,4,17,16,1,4,18,16,1,4,19,16,1,4,6,16,1,4,7,16,1,4,8,16,1,4,9,16,1,4,10
	.byte 16,1,4,11,16,1,4,12,16,1,4,13,16,1,4,14,16,1,4,15,16,1,4,16,16,1,4,20,16,1,4,21
	.byte 16,1,4,22,16,1,4,23,16,1,4,24,16,1,4,25,16,1,4,26,16,1,4,27,16,1,4,28,16,1,4,29
	.byte 17,0,131,149,16,1,4,30,11,2,128,167,1,16,2,70,1,129,119,11,2,128,166,1,11,2,128,156,1,16,2,130
	.byte 56,2,135,252,33,3,193,0,3,48,3,194,0,6,149,3,193,0,2,30,3,193,0,1,88,3,193,0,1,86,3,193
	.byte 0,2,31,3,193,0,2,32,3,193,0,2,33,3,193,0,3,49,3,193,0,0,196,3,193,0,2,41,3,193,0,2
	.byte 42,3,193,0,0,197,7,17,109,111,110,111,95,104,101,108,112,101,114,95,108,100,115,116,114,0,7,25,109,111,110,111
	.byte 95,97,114,99,104,95,116,104,114,111,119,95,101,120,99,101,112,116,105,111,110,0,3,193,0,2,77,3,193,0,2,78
	.byte 3,3,3,4,3,193,0,1,253,3,193,0,2,20,3,193,0,2,23,3,193,0,2,38,3,193,0,2,39,3,193,0
	.byte 2,21,3,193,0,2,43,3,193,0,2,50,3,193,0,2,51,3,193,0,2,55,3,193,0,2,56,3,5,3,6,3
	.byte 193,0,1,158,7,32,109,111,110,111,95,97,114,99,104,95,116,104,114,111,119,95,99,111,114,108,105,98,95,101,120,99
	.byte 101,112,116,105,111,110,0,3,193,0,1,107,3,193,0,2,34,3,193,0,2,35,3,193,0,2,44,3,193,0,2,45
	.byte 3,193,0,2,46,3,193,0,2,47,3,193,0,0,199,3,193,0,2,26,3,193,0,2,40,3,193,0,3,70,31,3
	.byte 7,35,109,111,110,111,95,116,104,114,101,97,100,95,105,110,116,101,114,114,117,112,116,105,111,110,95,99,104,101,99,107
	.byte 112,111,105,110,116,0,31,4,31,5,31,6,2,0,0,2,19,0,2,38,0,2,56,0,2,79,0,2,79,0,2,100
	.byte 0,2,125,0,2,128,155,0,2,19,0,2,0,0,2,38,0,2,38,0,2,128,183,0,2,128,204,0,2,128,204,0
	.byte 2,38,0,2,128,183,0,2,128,225,0,2,128,204,0,2,128,248,0,2,129,20,0,2,129,20,0,2,129,20,0,2
	.byte 56,0,2,38,0,2,79,0,2,38,0,2,128,225,0,2,38,0,2,128,204,0,2,38,0,2,128,183,0,2,129,42
	.byte 0,2,129,42,0,2,129,79,0,2,129,79,0,0,128,144,8,0,0,1,23,128,144,12,0,0,4,194,0,14,119,194
	.byte 0,14,133,194,0,16,110,194,0,14,131,194,0,14,118,194,0,14,91,194,0,14,92,194,0,14,93,194,0,14,94,194
	.byte 0,14,95,194,0,14,96,194,0,14,97,194,0,14,98,194,0,14,99,194,0,14,100,194,0,14,101,194,0,14,120,194
	.byte 0,14,102,194,0,14,103,194,0,14,104,194,0,14,105,194,0,14,121,194,0,14,90,4,128,196,2,8,4,0,1,194
	.byte 0,16,114,194,0,16,111,194,0,16,110,194,0,16,108,55,128,166,14,193,0,1,91,44,100,0,4,193,0,1,99,194
	.byte 0,16,111,193,0,1,91,194,0,16,108,193,0,1,87,193,0,1,92,37,193,0,1,95,193,0,1,90,15,193,0,2
	.byte 245,193,0,3,67,193,0,3,57,193,0,3,58,193,0,3,51,193,0,3,59,193,0,3,60,193,0,3,69,193,0,3
	.byte 68,193,0,3,64,193,0,3,63,193,0,3,62,193,0,3,61,193,0,3,60,193,0,3,59,193,0,3,58,193,0,3
	.byte 57,193,0,3,56,193,0,3,55,193,0,3,54,193,0,3,53,193,0,3,52,193,0,3,51,193,0,3,50,36,35,34
	.byte 33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,98,111,101,104,109,0
.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
.align	2
L_OBJC_SELECTOR_REFERENCES_0:
.long	L_OBJC_METH_VAR_NAME_0
L_OBJC_SELECTOR_REFERENCES_1:
.long	L_OBJC_METH_VAR_NAME_1
L_OBJC_SELECTOR_REFERENCES_2:
.long	L_OBJC_METH_VAR_NAME_2
L_OBJC_SELECTOR_REFERENCES_3:
.long	L_OBJC_METH_VAR_NAME_3
L_OBJC_SELECTOR_REFERENCES_4:
.long	L_OBJC_METH_VAR_NAME_4
L_OBJC_SELECTOR_REFERENCES_5:
.long	L_OBJC_METH_VAR_NAME_5
L_OBJC_SELECTOR_REFERENCES_6:
.long	L_OBJC_METH_VAR_NAME_6
L_OBJC_SELECTOR_REFERENCES_7:
.long	L_OBJC_METH_VAR_NAME_7
L_OBJC_SELECTOR_REFERENCES_8:
.long	L_OBJC_METH_VAR_NAME_8
L_OBJC_SELECTOR_REFERENCES_9:
.long	L_OBJC_METH_VAR_NAME_9
L_OBJC_SELECTOR_REFERENCES_10:
.long	L_OBJC_METH_VAR_NAME_10
L_OBJC_SELECTOR_REFERENCES_11:
.long	L_OBJC_METH_VAR_NAME_11
L_OBJC_SELECTOR_REFERENCES_12:
.long	L_OBJC_METH_VAR_NAME_12
L_OBJC_SELECTOR_REFERENCES_13:
.long	L_OBJC_METH_VAR_NAME_13
L_OBJC_SELECTOR_REFERENCES_14:
.long	L_OBJC_METH_VAR_NAME_14
L_OBJC_SELECTOR_REFERENCES_15:
.long	L_OBJC_METH_VAR_NAME_15
L_OBJC_SELECTOR_REFERENCES_16:
.long	L_OBJC_METH_VAR_NAME_16
L_OBJC_SELECTOR_REFERENCES_17:
.long	L_OBJC_METH_VAR_NAME_17
L_OBJC_SELECTOR_REFERENCES_18:
.long	L_OBJC_METH_VAR_NAME_18
L_OBJC_SELECTOR_REFERENCES_19:
.long	L_OBJC_METH_VAR_NAME_19
L_OBJC_SELECTOR_REFERENCES_20:
.long	L_OBJC_METH_VAR_NAME_20
L_OBJC_SELECTOR_REFERENCES_21:
.long	L_OBJC_METH_VAR_NAME_21
L_OBJC_SELECTOR_REFERENCES_22:
.long	L_OBJC_METH_VAR_NAME_22
L_OBJC_SELECTOR_REFERENCES_23:
.long	L_OBJC_METH_VAR_NAME_23
.section	__TEXT,__cstring,cstring_literals
L_OBJC_METH_VAR_NAME_0:
.asciz "label"
L_OBJC_METH_VAR_NAME_1:
.asciz "activityIndicator"
L_OBJC_METH_VAR_NAME_2:
.asciz "view"
L_OBJC_METH_VAR_NAME_3:
.asciz "setView:"
L_OBJC_METH_VAR_NAME_4:
.asciz "presentationMode"
L_OBJC_METH_VAR_NAME_5:
.asciz "setPresentationMode:"
L_OBJC_METH_VAR_NAME_6:
.asciz "textLabel"
L_OBJC_METH_VAR_NAME_7:
.asciz "setTextLabel:"
L_OBJC_METH_VAR_NAME_8:
.asciz "showActivity"
L_OBJC_METH_VAR_NAME_9:
.asciz "setShowActivity:"
L_OBJC_METH_VAR_NAME_10:
.asciz "isShowing"
L_OBJC_METH_VAR_NAME_11:
.asciz "initWithText:inView:"
L_OBJC_METH_VAR_NAME_12:
.asciz "initWithText:showActivity:inView:"
L_OBJC_METH_VAR_NAME_13:
.asciz "initWithText:showActivity:inPresentationMode:inView:"
L_OBJC_METH_VAR_NAME_14:
.asciz "showAnimated"
L_OBJC_METH_VAR_NAME_15:
.asciz "hideAnimated"
L_OBJC_METH_VAR_NAME_16:
.asciz "hideAnimatedAfter:"
L_OBJC_METH_VAR_NAME_17:
.asciz "show:"
L_OBJC_METH_VAR_NAME_18:
.asciz "hide:"
L_OBJC_METH_VAR_NAME_19:
.asciz "showAndDismissAutomaticallyAnimated"
L_OBJC_METH_VAR_NAME_20:
.asciz "showAndDismissAfter:"
L_OBJC_METH_VAR_NAME_21:
.asciz "setTextLabel:animated:"
L_OBJC_METH_VAR_NAME_22:
.asciz "setShowActivity:animated:"
L_OBJC_METH_VAR_NAME_23:
.asciz "setTextLabel:andSetShowActivity:animated:"
.section	__DATA,__objc_imageinfo,regular,no_dead_strip
.align	2
L_OBJC_IMAGE_INFO:
.long	0
.long	16
.section __TEXT, __const
	.align 3
Lglobals_hash:

	.short 11, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0
.data
	.align 3
globals:
	.align 2
	.long Lglobals_hash

	.long 0,0
.section __DWARF, __debug_info,regular,debug
LTDIE_1:

	.byte 17
	.asciz "System_Object"

	.byte 8,7
	.asciz "System_Object"

LDIFF_SYM3=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM3
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM4=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM4
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM5=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM5
LTDIE_0:

	.byte 5
	.asciz "ApiDefinition_Messaging"

	.byte 8,16
LDIFF_SYM6=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM6
	.byte 2,35,0,0,7
	.asciz "ApiDefinition_Messaging"

LDIFF_SYM7=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM7
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM8=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM8
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM9=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM9
	.byte 2
	.asciz "ApiDefinition.Messaging:.ctor"
	.long _ApiDefinition_Messaging__ctor
	.long Lme_0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM10=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM10
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM11=Lfde0_end - Lfde0_start
	.long LDIFF_SYM11
Lfde0_start:

	.long 0
	.align 2
	.long _ApiDefinition_Messaging__ctor

LDIFF_SYM12=Lme_0 - _ApiDefinition_Messaging__ctor
	.long LDIFF_SYM12
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24
	.align 2
Lfde0_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "ApiDefinition.Messaging:.cctor"
	.long _ApiDefinition_Messaging__cctor
	.long Lme_1

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM13=Lfde1_end - Lfde1_start
	.long LDIFF_SYM13
Lfde1_start:

	.long 0
	.align 2
	.long _ApiDefinition_Messaging__cctor

LDIFF_SYM14=Lme_1 - _ApiDefinition_Messaging__cctor
	.long LDIFF_SYM14
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,16
	.align 2
Lfde1_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_7:

	.byte 5
	.asciz "System_ValueType"

	.byte 8,16
LDIFF_SYM15=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM15
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM16=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM16
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM17=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM17
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM18=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM18
LTDIE_6:

	.byte 5
	.asciz "System_Boolean"

	.byte 9,16
LDIFF_SYM19=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM19
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM20=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM20
	.byte 2,35,8,0,7
	.asciz "System_Boolean"

LDIFF_SYM21=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM21
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM22=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM22
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM23=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM23
LTDIE_5:

	.byte 5
	.asciz "MonoTouch_Foundation_NSObject"

	.byte 20,16
LDIFF_SYM24=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM24
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM25=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM25
	.byte 2,35,8,6
	.asciz "super"

LDIFF_SYM26=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM26
	.byte 2,35,12,6
	.asciz "disposed"

LDIFF_SYM27=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM27
	.byte 2,35,16,6
	.asciz "IsDirectBinding"

LDIFF_SYM28=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM28
	.byte 2,35,17,6
	.asciz "registered_toggleref"

LDIFF_SYM29=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM29
	.byte 2,35,18,0,7
	.asciz "MonoTouch_Foundation_NSObject"

LDIFF_SYM30=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM30
LTDIE_5_POINTER:

	.byte 13
LDIFF_SYM31=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM31
LTDIE_5_REFERENCE:

	.byte 14
LDIFF_SYM32=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM32
LTDIE_4:

	.byte 5
	.asciz "MonoTouch_UIKit_UIResponder"

	.byte 20,16
LDIFF_SYM33=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM33
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIResponder"

LDIFF_SYM34=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM34
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM35=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM35
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM36=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM36
LTDIE_3:

	.byte 5
	.asciz "MonoTouch_UIKit_UIView"

	.byte 32,16
LDIFF_SYM37=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM37
	.byte 2,35,0,6
	.asciz "__mt_BackgroundColor_var"

LDIFF_SYM38=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM38
	.byte 2,35,20,6
	.asciz "__mt_Layer_var"

LDIFF_SYM39=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM39
	.byte 2,35,24,6
	.asciz "__mt_Subviews_var"

LDIFF_SYM40=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM40
	.byte 2,35,28,0,7
	.asciz "MonoTouch_UIKit_UIView"

LDIFF_SYM41=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM41
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM42=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM42
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM43=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM43
LTDIE_2:

	.byte 5
	.asciz "GCDiscreetNotification_GCDiscreetNotificationView"

	.byte 44,16
LDIFF_SYM44=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM44
	.byte 2,35,0,6
	.asciz "__mt_Label_var"

LDIFF_SYM45=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM45
	.byte 2,35,32,6
	.asciz "__mt_ActivityIndicator_var"

LDIFF_SYM46=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM46
	.byte 2,35,36,6
	.asciz "__mt_View_var"

LDIFF_SYM47=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM47
	.byte 2,35,40,0,7
	.asciz "GCDiscreetNotification_GCDiscreetNotificationView"

LDIFF_SYM48=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM48
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM49=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM49
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM50=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM50
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor
	.long Lme_6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM51=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM51
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM52=Lfde2_end - Lfde2_start
	.long LDIFF_SYM52
Lfde2_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor

LDIFF_SYM53=Lme_6 - _GCDiscreetNotification_GCDiscreetNotificationView__ctor
	.long LDIFF_SYM53
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde2_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_8:

	.byte 5
	.asciz "MonoTouch_Foundation_NSCoder"

	.byte 20,16
LDIFF_SYM54=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM54
	.byte 2,35,0,0,7
	.asciz "MonoTouch_Foundation_NSCoder"

LDIFF_SYM55=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM55
LTDIE_8_POINTER:

	.byte 13
LDIFF_SYM56=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM56
LTDIE_8_REFERENCE:

	.byte 14
LDIFF_SYM57=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM57
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSCoder
	.long Lme_7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM58=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM58
	.byte 1,86,3
	.asciz "coder"

LDIFF_SYM59=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM59
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM60=Lfde3_end - Lfde3_start
	.long LDIFF_SYM60
Lfde3_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSCoder

LDIFF_SYM61=Lme_7 - _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSCoder
	.long LDIFF_SYM61
	.byte 12,13,0,72,14,8,135,2,68,14,20,134,5,136,4,138,3,142,1,68,14,24
	.align 2
Lfde3_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_9:

	.byte 5
	.asciz "MonoTouch_Foundation_NSObjectFlag"

	.byte 8,16
LDIFF_SYM62=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM62
	.byte 2,35,0,0,7
	.asciz "MonoTouch_Foundation_NSObjectFlag"

LDIFF_SYM63=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM63
LTDIE_9_POINTER:

	.byte 13
LDIFF_SYM64=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM64
LTDIE_9_REFERENCE:

	.byte 14
LDIFF_SYM65=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM65
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSObjectFlag
	.long Lme_8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM66=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM66
	.byte 1,86,3
	.asciz "t"

LDIFF_SYM67=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM67
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM68=Lfde4_end - Lfde4_start
	.long LDIFF_SYM68
Lfde4_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSObjectFlag

LDIFF_SYM69=Lme_8 - _GCDiscreetNotification_GCDiscreetNotificationView__ctor_MonoTouch_Foundation_NSObjectFlag
	.long LDIFF_SYM69
	.byte 12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1,68,14,24
	.align 2
Lfde4_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_intptr
	.long Lme_9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM70=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM70
	.byte 1,86,3
	.asciz "handle"

LDIFF_SYM71=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM71
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM72=Lfde5_end - Lfde5_start
	.long LDIFF_SYM72
Lfde5_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_intptr

LDIFF_SYM73=Lme_9 - _GCDiscreetNotification_GCDiscreetNotificationView__ctor_intptr
	.long LDIFF_SYM73
	.byte 12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1,68,14,24
	.align 2
Lfde5_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_MonoTouch_UIKit_UIView
	.long Lme_a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM74=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 1,85,3
	.asciz "text"

LDIFF_SYM75=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM75
	.byte 2,125,0,3
	.asciz "view"

LDIFF_SYM76=LTDIE_3_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM76
	.byte 1,90,11
	.asciz "nstext"

LDIFF_SYM77=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM77
	.byte 1,84,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM78=Lfde6_end - Lfde6_start
	.long LDIFF_SYM78
Lfde6_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_MonoTouch_UIKit_UIView

LDIFF_SYM79=Lme_a - _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_MonoTouch_UIKit_UIView
	.long LDIFF_SYM79
	.byte 12,13,0,72,14,8,135,2,68,14,24,132,6,133,5,136,4,138,3,142,1,68,14,32
	.align 2
Lfde6_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_MonoTouch_UIKit_UIView
	.long Lme_b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM80=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM80
	.byte 1,85,3
	.asciz "text"

LDIFF_SYM81=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM81
	.byte 2,123,8,3
	.asciz "activity"

LDIFF_SYM82=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM82
	.byte 2,123,12,3
	.asciz "view"

LDIFF_SYM83=LTDIE_3_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM83
	.byte 1,90,11
	.asciz "nstext"

LDIFF_SYM84=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM84
	.byte 1,84,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM85=Lfde7_end - Lfde7_start
	.long LDIFF_SYM85
Lfde7_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_MonoTouch_UIKit_UIView

LDIFF_SYM86=Lme_b - _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_MonoTouch_UIKit_UIView
	.long LDIFF_SYM86
	.byte 12,13,0,72,14,8,135,2,68,14,28,132,7,133,6,136,5,138,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde7_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_10:

	.byte 8
	.asciz "GCDiscreetNotification_GCDNPresentationMode"

	.byte 4
LDIFF_SYM87=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM87
	.byte 9
	.asciz "Top"

	.byte 0,9
	.asciz "Bottom"

	.byte 1,0,7
	.asciz "GCDiscreetNotification_GCDNPresentationMode"

LDIFF_SYM88=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM88
LTDIE_10_POINTER:

	.byte 13
LDIFF_SYM89=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM89
LTDIE_10_REFERENCE:

	.byte 14
LDIFF_SYM90=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM90
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.ctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_GCDiscreetNotification_GCDNPresentationMode_MonoTouch_UIKit_UIView
	.long Lme_c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM91=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM91
	.byte 1,84,3
	.asciz "text"

LDIFF_SYM92=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM92
	.byte 2,123,12,3
	.asciz "activity"

LDIFF_SYM93=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM93
	.byte 2,123,16,3
	.asciz "presentationMode"

LDIFF_SYM94=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM94
	.byte 2,123,20,3
	.asciz "view"

LDIFF_SYM95=LTDIE_3_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM95
	.byte 1,90,11
	.asciz "nstext"

LDIFF_SYM96=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM96
	.byte 2,123,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM97=Lfde8_end - Lfde8_start
	.long LDIFF_SYM97
Lfde8_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_GCDiscreetNotification_GCDNPresentationMode_MonoTouch_UIKit_UIView

LDIFF_SYM98=Lme_c - _GCDiscreetNotification_GCDiscreetNotificationView__ctor_string_bool_GCDiscreetNotification_GCDNPresentationMode_MonoTouch_UIKit_UIView
	.long LDIFF_SYM98
	.byte 12,13,0,72,14,8,135,2,68,14,24,132,6,136,5,138,4,139,3,142,1,68,14,56,68,13,11
	.align 2
Lfde8_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:.cctor"
	.long _GCDiscreetNotification_GCDiscreetNotificationView__cctor
	.long Lme_d

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM99=Lfde9_end - Lfde9_start
	.long LDIFF_SYM99
Lfde9_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView__cctor

LDIFF_SYM100=Lme_d - _GCDiscreetNotification_GCDiscreetNotificationView__cctor
	.long LDIFF_SYM100
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,16
	.align 2
Lfde9_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_ClassHandle"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_ClassHandle
	.long Lme_e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM101=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM101
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM102=Lfde10_end - Lfde10_start
	.long LDIFF_SYM102
Lfde10_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_ClassHandle

LDIFF_SYM103=Lme_e - _GCDiscreetNotification_GCDiscreetNotificationView_get_ClassHandle
	.long LDIFF_SYM103
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24
	.align 2
Lfde10_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:ShowAnimated"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_ShowAnimated
	.long Lme_f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM104=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM104
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM105=Lfde11_end - Lfde11_start
	.long LDIFF_SYM105
Lfde11_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_ShowAnimated

LDIFF_SYM106=Lme_f - _GCDiscreetNotification_GCDiscreetNotificationView_ShowAnimated
	.long LDIFF_SYM106
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde11_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:HideAnimated"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_HideAnimated
	.long Lme_10

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM107=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM107
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM108=Lfde12_end - Lfde12_start
	.long LDIFF_SYM108
Lfde12_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_HideAnimated

LDIFF_SYM109=Lme_10 - _GCDiscreetNotification_GCDiscreetNotificationView_HideAnimated
	.long LDIFF_SYM109
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde12_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_11:

	.byte 5
	.asciz "System_Double"

	.byte 16,16
LDIFF_SYM110=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM110
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM111=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM111
	.byte 2,35,8,0,7
	.asciz "System_Double"

LDIFF_SYM112=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM112
LTDIE_11_POINTER:

	.byte 13
LDIFF_SYM113=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM113
LTDIE_11_REFERENCE:

	.byte 14
LDIFF_SYM114=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM114
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:hideAnimated"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_hideAnimated_double
	.long Lme_11

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM115=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM115
	.byte 1,90,3
	.asciz "timeInterval"

LDIFF_SYM116=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM116
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM117=Lfde13_end - Lfde13_start
	.long LDIFF_SYM117
Lfde13_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_hideAnimated_double

LDIFF_SYM118=Lme_11 - _GCDiscreetNotification_GCDiscreetNotificationView_hideAnimated_double
	.long LDIFF_SYM118
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,32
	.align 2
Lfde13_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:Show"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_Show_bool
	.long Lme_12

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM119=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM119
	.byte 1,90,3
	.asciz "animated"

LDIFF_SYM120=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM120
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM121=Lfde14_end - Lfde14_start
	.long LDIFF_SYM121
Lfde14_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_Show_bool

LDIFF_SYM122=Lme_12 - _GCDiscreetNotification_GCDiscreetNotificationView_Show_bool
	.long LDIFF_SYM122
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,24
	.align 2
Lfde14_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:Hide"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_Hide_bool
	.long Lme_13

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM123=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM123
	.byte 1,90,3
	.asciz "animated"

LDIFF_SYM124=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM124
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM125=Lfde15_end - Lfde15_start
	.long LDIFF_SYM125
Lfde15_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_Hide_bool

LDIFF_SYM126=Lme_13 - _GCDiscreetNotification_GCDiscreetNotificationView_Hide_bool
	.long LDIFF_SYM126
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,24
	.align 2
Lfde15_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:ShowAndDismissAutomaticallyAnimated"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAutomaticallyAnimated
	.long Lme_14

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM127=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM127
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM128=Lfde16_end - Lfde16_start
	.long LDIFF_SYM128
Lfde16_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAutomaticallyAnimated

LDIFF_SYM129=Lme_14 - _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAutomaticallyAnimated
	.long LDIFF_SYM129
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde16_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:ShowAndDismissAfter"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAfter_double
	.long Lme_15

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM130=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM130
	.byte 1,90,3
	.asciz "timeInterval"

LDIFF_SYM131=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM131
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM132=Lfde17_end - Lfde17_start
	.long LDIFF_SYM132
Lfde17_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAfter_double

LDIFF_SYM133=Lme_15 - _GCDiscreetNotification_GCDiscreetNotificationView_ShowAndDismissAfter_double
	.long LDIFF_SYM133
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,32
	.align 2
Lfde17_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:SetTextLabel"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool
	.long Lme_16

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM134=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM134
	.byte 1,86,3
	.asciz "text"

LDIFF_SYM135=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM135
	.byte 2,125,0,3
	.asciz "animated"

LDIFF_SYM136=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM136
	.byte 2,125,4,11
	.asciz "nstext"

LDIFF_SYM137=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM137
	.byte 1,85,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM138=Lfde18_end - Lfde18_start
	.long LDIFF_SYM138
Lfde18_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool

LDIFF_SYM139=Lme_16 - _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool
	.long LDIFF_SYM139
	.byte 12,13,0,72,14,8,135,2,68,14,20,133,5,134,4,136,3,142,1,68,14,32
	.align 2
Lfde18_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:SetShowActivity"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_SetShowActivity_bool_bool
	.long Lme_17

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM140=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM140
	.byte 1,90,3
	.asciz "activity"

LDIFF_SYM141=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM141
	.byte 2,125,0,3
	.asciz "animated"

LDIFF_SYM142=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM142
	.byte 2,125,4,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM143=Lfde19_end - Lfde19_start
	.long LDIFF_SYM143
Lfde19_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_SetShowActivity_bool_bool

LDIFF_SYM144=Lme_17 - _GCDiscreetNotification_GCDiscreetNotificationView_SetShowActivity_bool_bool
	.long LDIFF_SYM144
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,24
	.align 2
Lfde19_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:SetTextLabel"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool_bool
	.long Lme_18

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM145=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM145
	.byte 1,86,3
	.asciz "text"

LDIFF_SYM146=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM146
	.byte 2,123,8,3
	.asciz "activity"

LDIFF_SYM147=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM147
	.byte 2,123,12,3
	.asciz "animated"

LDIFF_SYM148=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM148
	.byte 2,123,16,11
	.asciz "nstext"

LDIFF_SYM149=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM149
	.byte 1,85,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM150=Lfde20_end - Lfde20_start
	.long LDIFF_SYM150
Lfde20_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool_bool

LDIFF_SYM151=Lme_18 - _GCDiscreetNotification_GCDiscreetNotificationView_SetTextLabel_string_bool_bool
	.long LDIFF_SYM151
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde20_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_12:

	.byte 5
	.asciz "MonoTouch_UIKit_UILabel"

	.byte 36,16
LDIFF_SYM152=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM152
	.byte 2,35,0,6
	.asciz "__mt_Font_var"

LDIFF_SYM153=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM153
	.byte 2,35,32,0,7
	.asciz "MonoTouch_UIKit_UILabel"

LDIFF_SYM154=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM154
LTDIE_12_POINTER:

	.byte 13
LDIFF_SYM155=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM155
LTDIE_12_REFERENCE:

	.byte 14
LDIFF_SYM156=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM156
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_Label"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_Label
	.long Lme_19

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM157=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM157
	.byte 1,90,11
	.asciz "ret"

LDIFF_SYM158=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM158
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM159=Lfde21_end - Lfde21_start
	.long LDIFF_SYM159
Lfde21_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_Label

LDIFF_SYM160=Lme_19 - _GCDiscreetNotification_GCDiscreetNotificationView_get_Label
	.long LDIFF_SYM160
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,138,3,142,1
	.align 2
Lfde21_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_13:

	.byte 5
	.asciz "MonoTouch_UIKit_UIActivityIndicatorView"

	.byte 32,16
LDIFF_SYM161=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM161
	.byte 2,35,0,0,7
	.asciz "MonoTouch_UIKit_UIActivityIndicatorView"

LDIFF_SYM162=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM162
LTDIE_13_POINTER:

	.byte 13
LDIFF_SYM163=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM163
LTDIE_13_REFERENCE:

	.byte 14
LDIFF_SYM164=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM164
	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_ActivityIndicator"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_ActivityIndicator
	.long Lme_1a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM165=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM165
	.byte 1,90,11
	.asciz "ret"

LDIFF_SYM166=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM166
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM167=Lfde22_end - Lfde22_start
	.long LDIFF_SYM167
Lfde22_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_ActivityIndicator

LDIFF_SYM168=Lme_1a - _GCDiscreetNotification_GCDiscreetNotificationView_get_ActivityIndicator
	.long LDIFF_SYM168
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,138,3,142,1
	.align 2
Lfde22_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_View"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_View
	.long Lme_1b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM169=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM169
	.byte 1,90,11
	.asciz "ret"

LDIFF_SYM170=LTDIE_3_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM170
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM171=Lfde23_end - Lfde23_start
	.long LDIFF_SYM171
Lfde23_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_View

LDIFF_SYM172=Lme_1b - _GCDiscreetNotification_GCDiscreetNotificationView_get_View
	.long LDIFF_SYM172
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,138,3,142,1
	.align 2
Lfde23_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:set_View"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_View_MonoTouch_UIKit_UIView
	.long Lme_1c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM173=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM173
	.byte 1,86,3
	.asciz "value"

LDIFF_SYM174=LTDIE_3_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM174
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM175=Lfde24_end - Lfde24_start
	.long LDIFF_SYM175
Lfde24_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_View_MonoTouch_UIKit_UIView

LDIFF_SYM176=Lme_1c - _GCDiscreetNotification_GCDiscreetNotificationView_set_View_MonoTouch_UIKit_UIView
	.long LDIFF_SYM176
	.byte 12,13,0,72,14,8,135,2,68,14,20,134,5,136,4,138,3,142,1,68,14,24
	.align 2
Lfde24_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_PresentationMode"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_PresentationMode
	.long Lme_1d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM177=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM177
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM178=Lfde25_end - Lfde25_start
	.long LDIFF_SYM178
Lfde25_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_PresentationMode

LDIFF_SYM179=Lme_1d - _GCDiscreetNotification_GCDiscreetNotificationView_get_PresentationMode
	.long LDIFF_SYM179
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde25_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:set_PresentationMode"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_PresentationMode_GCDiscreetNotification_GCDNPresentationMode
	.long Lme_1e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM180=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM180
	.byte 1,86,3
	.asciz "value"

LDIFF_SYM181=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM181
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM182=Lfde26_end - Lfde26_start
	.long LDIFF_SYM182
Lfde26_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_PresentationMode_GCDiscreetNotification_GCDNPresentationMode

LDIFF_SYM183=Lme_1e - _GCDiscreetNotification_GCDiscreetNotificationView_set_PresentationMode_GCDiscreetNotification_GCDNPresentationMode
	.long LDIFF_SYM183
	.byte 12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1,68,14,24
	.align 2
Lfde26_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_TextLabel"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_TextLabel
	.long Lme_1f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM184=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM184
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM185=Lfde27_end - Lfde27_start
	.long LDIFF_SYM185
Lfde27_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_TextLabel

LDIFF_SYM186=Lme_1f - _GCDiscreetNotification_GCDiscreetNotificationView_get_TextLabel
	.long LDIFF_SYM186
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde27_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:set_TextLabel"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_TextLabel_string
	.long Lme_20

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM187=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM187
	.byte 1,86,3
	.asciz "value"

LDIFF_SYM188=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM188
	.byte 2,125,0,11
	.asciz "nsvalue"

LDIFF_SYM189=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM189
	.byte 1,85,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM190=Lfde28_end - Lfde28_start
	.long LDIFF_SYM190
Lfde28_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_TextLabel_string

LDIFF_SYM191=Lme_20 - _GCDiscreetNotification_GCDiscreetNotificationView_set_TextLabel_string
	.long LDIFF_SYM191
	.byte 12,13,0,72,14,8,135,2,68,14,20,133,5,134,4,136,3,142,1,68,14,32
	.align 2
Lfde28_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_ShowActivity"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_ShowActivity
	.long Lme_21

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM192=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM192
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM193=Lfde29_end - Lfde29_start
	.long LDIFF_SYM193
Lfde29_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_ShowActivity

LDIFF_SYM194=Lme_21 - _GCDiscreetNotification_GCDiscreetNotificationView_get_ShowActivity
	.long LDIFF_SYM194
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde29_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:set_ShowActivity"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_ShowActivity_bool
	.long Lme_22

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM195=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM195
	.byte 1,90,3
	.asciz "value"

LDIFF_SYM196=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM196
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM197=Lfde30_end - Lfde30_start
	.long LDIFF_SYM197
Lfde30_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_set_ShowActivity_bool

LDIFF_SYM198=Lme_22 - _GCDiscreetNotification_GCDiscreetNotificationView_set_ShowActivity_bool
	.long LDIFF_SYM198
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,24
	.align 2
Lfde30_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:get_Showing"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_Showing
	.long Lme_23

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM199=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM199
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM200=Lfde31_end - Lfde31_start
	.long LDIFF_SYM200
Lfde31_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_get_Showing

LDIFF_SYM201=Lme_23 - _GCDiscreetNotification_GCDiscreetNotificationView_get_Showing
	.long LDIFF_SYM201
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1
	.align 2
Lfde31_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "GCDiscreetNotification.GCDiscreetNotificationView:Dispose"
	.long _GCDiscreetNotification_GCDiscreetNotificationView_Dispose_bool
	.long Lme_24

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM202=LTDIE_2_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM202
	.byte 1,90,3
	.asciz "disposing"

LDIFF_SYM203=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM203
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM204=Lfde32_end - Lfde32_start
	.long LDIFF_SYM204
Lfde32_start:

	.long 0
	.align 2
	.long _GCDiscreetNotification_GCDiscreetNotificationView_Dispose_bool

LDIFF_SYM205=Lme_24 - _GCDiscreetNotification_GCDiscreetNotificationView_Dispose_bool
	.long LDIFF_SYM205
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,32
	.align 2
Lfde32_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_14:

	.byte 5
	.asciz "System_Int32"

	.byte 12,16
LDIFF_SYM206=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM206
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM207=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM207
	.byte 2,35,8,0,7
	.asciz "System_Int32"

LDIFF_SYM208=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM208
LTDIE_14_POINTER:

	.byte 13
LDIFF_SYM209=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM209
LTDIE_14_REFERENCE:

	.byte 14
LDIFF_SYM210=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM210
	.byte 2
	.asciz "(wrapper managed-to-native) ApiDefinition.Messaging:IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr"
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
	.long Lme_26

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM211=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM211
	.byte 2,123,12,3
	.asciz "param1"

LDIFF_SYM212=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM212
	.byte 2,123,16,3
	.asciz "param2"

LDIFF_SYM213=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM213
	.byte 2,123,20,3
	.asciz "param3"

LDIFF_SYM214=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM214
	.byte 2,123,24,3
	.asciz "param4"

LDIFF_SYM215=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM215
	.byte 2,123,28,3
	.asciz "param5"

LDIFF_SYM216=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM216
	.byte 2,123,32,11
	.asciz "V_0"

LDIFF_SYM217=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM217
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM218=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM218
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM219=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM219
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM220=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM220
	.byte 2,123,8,11
	.asciz "V_4"

LDIFF_SYM221=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM221
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM222=Lfde33_end - Lfde33_start
	.long LDIFF_SYM222
Lfde33_start:

	.long 0
	.align 2
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr

LDIFF_SYM223=Lme_26 - _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSend_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
	.long LDIFF_SYM223
	.byte 12,13,0,72,14,8,135,2,72,14,48,132,12,133,11,134,10,136,8,137,7,138,6,139,5,140,4,142,3,68,14,128
	.byte 1,68,13,11
	.align 2
Lfde33_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper managed-to-native) ApiDefinition.Messaging:IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr"
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
	.long Lme_27

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM224=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM224
	.byte 2,123,12,3
	.asciz "param1"

LDIFF_SYM225=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM225
	.byte 2,123,16,3
	.asciz "param2"

LDIFF_SYM226=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM226
	.byte 2,123,20,3
	.asciz "param3"

LDIFF_SYM227=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM227
	.byte 2,123,24,3
	.asciz "param4"

LDIFF_SYM228=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM228
	.byte 2,123,28,3
	.asciz "param5"

LDIFF_SYM229=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM229
	.byte 2,123,32,11
	.asciz "V_0"

LDIFF_SYM230=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM230
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM231=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM231
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM232=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM232
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM233=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM233
	.byte 2,123,8,11
	.asciz "V_4"

LDIFF_SYM234=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM234
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM235=Lfde34_end - Lfde34_start
	.long LDIFF_SYM235
Lfde34_start:

	.long 0
	.align 2
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr

LDIFF_SYM236=Lme_27 - _wrapper_managed_to_native_ApiDefinition_Messaging_IntPtr_objc_msgSendSuper_IntPtr_bool_int_IntPtr_intptr_intptr_intptr_bool_int_intptr
	.long LDIFF_SYM236
	.byte 12,13,0,72,14,8,135,2,72,14,48,132,12,133,11,134,10,136,8,137,7,138,6,139,5,140,4,142,3,68,14,128
	.byte 1,68,13,11
	.align 2
Lfde34_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper managed-to-native) ApiDefinition.Messaging:void_objc_msgSend_IntPtr_bool_bool"
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
	.long Lme_28

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM237=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM237
	.byte 2,123,8,3
	.asciz "param1"

LDIFF_SYM238=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM238
	.byte 2,123,12,3
	.asciz "param2"

LDIFF_SYM239=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM239
	.byte 2,123,16,3
	.asciz "param3"

LDIFF_SYM240=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM240
	.byte 2,123,20,3
	.asciz "param4"

LDIFF_SYM241=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM241
	.byte 2,123,24,11
	.asciz "V_0"

LDIFF_SYM242=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM242
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM243=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM243
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM244=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM244
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM245=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM245
	.byte 1,84,11
	.asciz "V_4"

LDIFF_SYM246=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM246
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM247=Lfde35_end - Lfde35_start
	.long LDIFF_SYM247
Lfde35_start:

	.long 0
	.align 2
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool

LDIFF_SYM248=Lme_28 - _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSend_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
	.long LDIFF_SYM248
	.byte 12,13,0,72,14,8,135,2,72,14,48,132,12,133,11,134,10,136,8,137,7,138,6,139,5,140,4,142,3,68,14,120
	.byte 68,13,11
	.align 2
Lfde35_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper managed-to-native) ApiDefinition.Messaging:void_objc_msgSendSuper_IntPtr_bool_bool"
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
	.long Lme_29

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM249=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM249
	.byte 2,123,8,3
	.asciz "param1"

LDIFF_SYM250=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM250
	.byte 2,123,12,3
	.asciz "param2"

LDIFF_SYM251=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM251
	.byte 2,123,16,3
	.asciz "param3"

LDIFF_SYM252=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM252
	.byte 2,123,20,3
	.asciz "param4"

LDIFF_SYM253=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM253
	.byte 2,123,24,11
	.asciz "V_0"

LDIFF_SYM254=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM254
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM255=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM255
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM256=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM256
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM257=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM257
	.byte 1,84,11
	.asciz "V_4"

LDIFF_SYM258=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM258
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM259=Lfde36_end - Lfde36_start
	.long LDIFF_SYM259
Lfde36_start:

	.long 0
	.align 2
	.long _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool

LDIFF_SYM260=Lme_29 - _wrapper_managed_to_native_ApiDefinition_Messaging_void_objc_msgSendSuper_IntPtr_bool_bool_intptr_intptr_intptr_bool_bool
	.long LDIFF_SYM260
	.byte 12,13,0,72,14,8,135,2,72,14,48,132,12,133,11,134,10,136,8,137,7,138,6,139,5,140,4,142,3,68,14,120
	.byte 68,13,11
	.align 2
Lfde36_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.text
	.align 3
mem_end:
