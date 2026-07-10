#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 1. 更新插件源
./scripts/feeds update -a

# 关键：直接删除 passwall 源码文件夹，从根源杜绝警告
rm -rf package/feeds/luci/luci-app-passwall

# 2. 安装所有插件（此时passwall已删除，不会被加载）
./scripts/feeds install -a

# Add OpenClash
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# Add luci-app-bandix
git clone https://github.com/timsaya/openwrt-bandix.git package/bandix
git clone https://github.com/timsaya/luci-app-bandix.git package/luci-app-bandix

# 添加插件
git clone https://github.com/nhhqgirl/luci-app-onliner.git package/lean/luci-app-onliner
git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
