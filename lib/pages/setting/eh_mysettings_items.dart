part of 'eh_mysettings_page.dart';

final _controller = Get.find<EhMySettingsController>();

Widget _buildSelectedProfileItem(BuildContext context,
    {bool hideLine = false}) {
  return Obx(() {
    final Map<String, String> actionMap = <String, String>{};
    for (final _profile in _controller.ehSetting.profilelist) {
      actionMap['${_profile.value}'] = _profile.name;
    }
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_selected,
      actionTitle: 'Selected Profile',
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.profileSelected ?? '',
      onValueChanged: (val) {
        print(val);
        if (val != _controller.ehSetting.profileSelected) {
          _controller.changeProfile(val);
        }
      },
    );
  });
}

Widget _buildLoadTypeItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_uh_0,
    '1': L10n.of(context).uc_uh_1,
    '2': L10n.of(context).uc_uh_2,
  };

  final Map<String, String> simpleActionMap = <String, String>{
    '0': L10n.of(context).uc_uh_0_s,
    '1': L10n.of(context).uc_uh_1_s,
    '2': L10n.of(context).uc_uh_2_s,
  };
  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_thor_hath,
      hideLine: hideLine,
      actionMap: actionMap,
      simpleActionMap: simpleActionMap,
      initVal: _controller.ehSetting.loadImageThroughHAtH ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(loadImageThroughHAtH: val),
    );
  });
}

Widget _buildImageSizeItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_auto,
    '5': '2400x',
    '4': '1600x',
    '3': '1280x',
    '2': '980x',
    '1': '780x',
  };
  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_res_res,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.imageSize ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(imageSize: val),
    );
  });
}

Widget _buildNameDisplayItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_tl_0,
    '1': L10n.of(context).uc_tl_1,
  };
  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_name_display,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.galleryNameDisplay ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(galleryNameDisplay: val),
    );
  });
}

Widget _buildArchiverSettingsItem(BuildContext context,
    {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_ar_0,
    '1': L10n.of(context).uc_ar_1,
    '2': L10n.of(context).uc_ar_2,
    '3': L10n.of(context).uc_ar_3,
    '4': L10n.of(context).uc_ar_4,
    '5': L10n.of(context).uc_ar_5,
  };
  final Map<String, String> sActionMap = <String, String>{
    '0': 'MM (Default)',
    '1': 'MA',
    '2': 'AOM',
    '3': 'AOA',
    '4': 'ARM',
    '5': 'ARA',
  };
  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_archiver_set,
      hideLine: hideLine,
      actionMap: actionMap,
      // simpleActionMap: sActionMap,
      initVal: _controller.ehSetting.archiverSettings ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(archiverSettings: val),
    );
  });
}

Widget _buildFrontPageSettingsItem(BuildContext context,
    {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '3': L10n.of(context).uc_dm_3,
    '4': L10n.of(context).uc_dm_4,
    '0': L10n.of(context).uc_dm_0,
    '2': L10n.of(context).uc_dm_2,
    '1': L10n.of(context).uc_dm_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_front_page_dis_mode,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.frontPageSettings ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(frontPageSettings: val),
    );
  });
}

Widget _buildFavoritesSortItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_fs_0,
    '1': L10n.of(context).uc_fs_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_fav_sort,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.frontPageSettings ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(frontPageSettings: val),
    );
  });
}

Widget _buildSearchResultCountItem(BuildContext context,
    {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': '25',
    '1': '50',
    '2': '100',
    '3': '200',
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_search_r_count,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.sortOrderFavorites ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(sortOrderFavorites: val),
    );
  });
}

Widget _buildThumbMouseOverItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_lt_0,
    '1': L10n.of(context).uc_lt_1,
  };

  final Map<String, String> sActionMap = <String, String>{
    '0': L10n.of(context).uc_lt_0_s,
    '1': L10n.of(context).uc_lt_1_s,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_mose_over_thumb,
      hideLine: hideLine,
      actionMap: actionMap,
      simpleActionMap: sActionMap,
      initVal: _controller.ehSetting.mouseOverThumbnails ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(mouseOverThumbnails: val),
    );
  });
}

Widget _buildThumbSizeItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_ts_0,
    '1': L10n.of(context).uc_ts_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_thumb_size,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.thumbnailSize ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(thumbnailSize: val),
    );
  });
}

Widget _buildThumbRowItem(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': '4',
    '1': '10',
    '2': '20',
    '3': '40',
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_thumb_row,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.thumbnailRows ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(thumbnailRows: val),
    );
  });
}

Widget _buildSortOrderComment(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_cs_0,
    '1': L10n.of(context).uc_cs_1,
    '2': L10n.of(context).uc_cs_2,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_comments_sort_order,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.sortOrderComments ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(sortOrderComments: val),
    );
  });
}

Widget _buildShowCommentVotes(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_sc_0,
    '1': L10n.of(context).uc_sc_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_comments_show_votes,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.showCommentVotes ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(showCommentVotes: val),
    );
  });
}

Widget _buildSortOrderTags(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_tb_0,
    '1': L10n.of(context).uc_tb_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_tag_short_order,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.sortOrderTags ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(sortOrderTags: val),
    );
  });
}

Widget _buildShowPageNumbers(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_pn_0,
    '1': L10n.of(context).uc_pn_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_show_page_num,
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.showGalleryPageNumbers ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(showGalleryPageNumbers: val),
    );
  });
}

Widget _buildOriginalImages(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_oi_0,
    '1': L10n.of(context).uc_oi_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_ori_image,
      actionTitle:
          'Use original images instead of the resampled versions where applicable?',
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.originalImages ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(originalImages: val),
    );
  });
}

Widget _buildMPVAlwaysUse(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_qb_0,
    '1': L10n.of(context).uc_qb_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_mpv_always,
      actionTitle:
          'Always use the Multi-Page Viewer? There will still be a link to manually start it if this is left disabled',
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.alwaysUseMpv ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(alwaysUseMpv: val),
    );
  });
}

Widget _buildMPVDisplayStyle(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_ms_0,
    '1': L10n.of(context).uc_ms_1,
    '2': L10n.of(context).uc_ms_2,
  };

  final Map<String, String> sActionMap = <String, String>{
    '0': 'Align left',
    '1': 'Align center 1',
    '2': 'Align center 2',
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_mpv_stype,
      actionTitle: 'Multi-Page Viewer Display Style',
      hideLine: hideLine,
      actionMap: actionMap,
      // simpleActionMap: sActionMap,
      initVal: _controller.ehSetting.mpvStyle ?? '',
      onValueChanged: (val) =>
          _controller.ehSetting = _controller.ehSetting.copyWith(mpvStyle: val),
    );
  });
}

Widget _buildMPVThumbPane(BuildContext context, {bool hideLine = false}) {
  final Map<String, String> actionMap = <String, String>{
    '0': L10n.of(context).uc_mt_0,
    '1': L10n.of(context).uc_mt_1,
  };

  return Obx(() {
    return SelectorItem<String>(
      key: UniqueKey(),
      title: L10n.of(context).uc_mpv_thumb_pane,
      actionTitle: 'Multi-Page Viewer Thumbnail Pane',
      hideLine: hideLine,
      actionMap: actionMap,
      initVal: _controller.ehSetting.mpvThumbnailPane ?? '',
      onValueChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(mpvThumbnailPane: val),
    );
  });
}

Widget _buildRatingsItem(BuildContext context, {bool hideLine = false}) {
  logger.d('ratings ${_controller.ehSetting.ratings}');
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_rating,
      placeholder: 'RRGGB',
      hideLine: hideLine,
      initValue: _controller.ehSetting.ratings ?? '',
      onChanged: (val) =>
          _controller.ehSetting = _controller.ehSetting.copyWith(ratings: val),
    );
  });
}

Widget _buildTagFilteringThreshold(BuildContext context) {
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_tag_ft,
      hideLine: true,
      initValue: _controller.ehSetting.tagFilteringThreshold ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(tagFilteringThreshold: val),
    );
  });
}

Widget _buildTagWatchingThreshold(BuildContext context) {
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_tag_wt,
      hideLine: true,
      initValue: _controller.ehSetting.tagWatchingThreshold ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(tagWatchingThreshold: val),
    );
  });
}

Widget _buildExcludedUploaders(BuildContext context) {
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_exc_up,
      hideLine: true,
      maxLines: null,
      initValue: _controller.ehSetting.excludedUploaders ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(excludedUploaders: val),
    );
  });
}

Widget _buildThumbnailScaling(BuildContext context) {
  // Thumbnail Scaling
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_thumb_scaling,
      suffixText: '%',
      placeholder: '100',
      hideLine: true,
      initValue: _controller.ehSetting.thumbnailScaling ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(thumbnailScaling: val),
    );
  });
}

Widget _buildViewportOverride(BuildContext context) {
  // Thumbnail Scaling
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_viewport_or,
      suffixText: 'px',
      hideLine: true,
      initValue: _controller.ehSetting.viewportOverride ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(viewportOverride: val),
    );
  });
}

Widget _buildHatHLocalNetworkHost(BuildContext context) {
  // Hentai@Home Local Network Host
  return Obx(() {
    return TextInputItem(
      title: 'IP Address:Port',
      hideLine: true,
      initValue: _controller.ehSetting.hentaiAtHomeLocalNetworkHost ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(hentaiAtHomeLocalNetworkHost: val),
    );
  });
}

Widget _buildSizeHorizontal(BuildContext context) {
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_img_horiz,
      suffixText: L10n.of(context).uc_pixels,
      hideLine: false,
      initValue: _controller.ehSetting.imageSizeHorizontal ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(imageSizeHorizontal: val),
    );
  });
}

Widget _buildSizeVertical(BuildContext context) {
  return Obx(() {
    return TextInputItem(
      title: L10n.of(context).uc_img_vert,
      suffixText: L10n.of(context).uc_pixels,
      hideLine: true,
      initValue: _controller.ehSetting.imageSizeVertical ?? '',
      onChanged: (val) => _controller.ehSetting =
          _controller.ehSetting.copyWith(imageSizeVertical: val),
    );
  });
}

Widget _buildTagNamespaces(BuildContext context) {
  return Obx(() {
    return MultiSelectorGroup(
      key: UniqueKey(),
      selectorMap: {
        'reclass': SingleSelectItemBean(
            title: L10n.of(context).uc_reclass,
            enable: _controller.ehSetting.xnReclass == '1'),
        'language': SingleSelectItemBean(
            title: L10n.of(context).uc_language,
            enable: _controller.ehSetting.xnLanguage == '1'),
        'parody': SingleSelectItemBean(
            title: L10n.of(context).uc_parody,
            enable: _controller.ehSetting.xnParody == '1'),
        'character': SingleSelectItemBean(
            title: L10n.of(context).uc_character,
            enable: _controller.ehSetting.xnCharacter == '1'),
        'group': SingleSelectItemBean(
            title: L10n.of(context).uc_group,
            enable: _controller.ehSetting.xnGroup == '1'),
        'artist': SingleSelectItemBean(
            title: L10n.of(context).uc_artist,
            enable: _controller.ehSetting.xnArtist == '1'),
        'male': SingleSelectItemBean(
            title: L10n.of(context).uc_male,
            enable: _controller.ehSetting.xnMale == '1'),
        'female': SingleSelectItemBean(
            title: L10n.of(context).uc_female,
            enable: _controller.ehSetting.xnFemale == '1'),
      },
      onValueChanged: (val) {
        _controller.ehSetting
          ..xnReclass = (val['reclass']?.enable ?? false) ? '1' : ''
          ..xnLanguage = (val['language']?.enable ?? false) ? '1' : ''
          ..xnParody = (val['parody']?.enable ?? false) ? '1' : ''
          ..xnCharacter = (val['character']?.enable ?? false) ? '1' : ''
          ..xnGroup = (val['group']?.enable ?? false) ? '1' : ''
          ..xnArtist = (val['artist']?.enable ?? false) ? '1' : ''
          ..xnMale = (val['male']?.enable ?? false) ? '1' : ''
          ..xnFemale = (val['female']?.enable ?? false) ? '1' : '';
      },
    );
  });
}