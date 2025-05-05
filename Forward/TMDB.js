// --- TMDB Lists Widget ---

var WidgetMetadata = {
    id: "forward.tmdb.media.lists",
    title: "TMDB榜单", // Refined Widget Title
    description: "聚合电影、剧集榜单与发现", // Refined Widget Description
    author: "阿米诺斯 ",
    site: "",
    version: "1.3.0", // Incremented version for title/emoji cleanup
    requiredVersion: "0.0.1",
    modules: [
      // --- Current & Trending ---
      {
        title: "正在热映", // Removed Emoji & TMDB prefix
        description: "当前影院或流媒体上映的电影/剧集", // Refined description
        requiresWebView: false,
        functionName: "tmdbNowPlaying",
        params: [
          { name: "type", title: "类型", type: "enumeration", enumOptions: [{ title: "电影", value: "movie" }, { title: "剧集", value: "tv" }], value: "movie" }, // Removed Emoji
          { name: "page", title: "页码", type: "page" }, // Removed Emoji
          { name: "language", title: "语言", type: "language", value: "zh-CN" }, // Removed Emoji
        ],
      },
      {
        title: "本日热门", // Removed Emoji & TMDB prefix
        description: "今日热门电影与剧集", // Refined description
        requiresWebView: false,
        functionName: "tmdbTrending",
        params: [
          { name: "time_window", title: "时间", type: "constant", value: "day" }, // Removed Emoji
          { name: "language", title: "语言", type: "constant", value: "zh-CN" }, // Removed Emoji
          { name: "page", title: "页码", type: "page" } // Removed Emoji
        ]
      },
      {
        title: "本周热门", // Removed Emoji & TMDB prefix
        description: "本周热门电影与剧集", // Refined description
        requiresWebView: false,
        functionName: "tmdbTrending",
        params: [
          { name: "time_window", title: "时间", type: "constant", value: "week" }, // Removed Emoji
          { name: "language", title: "语言", type: "constant", value: "zh-CN" }, // Removed Emoji
          { name: "page", title: "页码", type: "page" } // Removed Emoji
        ]
      },
      // --- General Discovery ---
      {
        title: "热门内容", // Removed Emoji & TMDB prefix
        description: "当前流行的电影或剧集 (按热度排序)", // Refined description
        requiresWebView: false,
        functionName: "tmdbPopular",
        params: [
          { name: "type", title: "类型", type: "enumeration", enumOptions: [{ title: "电影", value: "movie" }, { title: "剧集", value: "tv" }], value: "movie" }, // Removed Emoji
          { name: "language", title: "语言", type: "constant", value: "zh-CN" }, // Removed Emoji
          { name: "page", title: "页码", type: "page" } // Removed Emoji
        ]
      },
      {
        title: "高分内容", // Removed Emoji & TMDB prefix
        description: "高分电影或剧集 (按用户评分排序)", // Refined description
        requiresWebView: false,
        functionName: "tmdbTopRated",
        params: [
          { name: "type", title: "类型", type: "enumeration", enumOptions: [{ title: "电影", value: "movie" }, { title: "剧集", value: "tv" }], value: "movie" }, // Removed Emoji
          { name: "language", title: "语言", type: "language", value: "zh-CN" }, // Removed Emoji
          { name: "page", title: "页码", type: "page" } // Removed Emoji
        ]
      },
      // --- Specific Filters ---
      {
        title: "播出平台", // Removed Emoji
        description: "按播出平台筛选剧集内容，并支持排序",
        requiresWebView: false,
        functionName: "tmdbDiscoverByNetwork",
        params: [
          {
            name: "with_networks",
            title: "播出平台", // Removed Emoji
            type: "enumeration",
            description: "选择一个平台以查看其剧集内容",
            value: "2007",
            enumOptions: [
              { title: "腾讯视频 (Tencent)", value: "2007" },
              { title: "爱奇艺 (iQiyi)", value: "1330" },
              { title: "优酷 (Youku)", value: "1419" },
              { title: "哔哩哔哩 (Bilibili)", value: "1605" },
              { title: "芒果TV (MangoTV)", value: "1631" },
              { title: "奈飞 (Netflix)", value: "213" },
              { title: "迪士尼+ (Disney+)", value: "2739" },
              { title: "HBO Max / Max", value: "3186" },
              { title: "苹果 TV+ (Apple TV+)", value: "2552" },
              { title: "Hulu", value: "453" },
            ],
          },
          {
            name: "sort_by",
            title: "排序方式", // Removed Emoji
            type: "enumeration",
            description: "选择内容的排序方式",
            value: "",
            enumOptions: [
              { title: "默认", value: "" }, // Simplified TMDB Default
              { title: "热门度 ⬇️", value: "popularity.desc" },
              { title: "热门度 ⬆️", value: "popularity.asc" },
              { title: "评分 ⬇️", value: "vote_average.desc" },
              { title: "评分 ⬆️", value: "vote_average.asc" },
              { title: "首播日期 ⬇️ (最新)", value: "first_air_date.desc" },
              { title: "首播日期 ⬆️ (最早)", value: "first_air_date.asc" }
            ]
          },
          { name: "page", title: "页码", type: "page" }, // Removed Emoji
          { name: "language", title: "语言", type: "language", value: "zh-CN" }, // Removed Emoji
        ]
      },
      {
        title: "即将上映", // Removed Emoji & TMDB prefix
        description: "即将上映的电影 (可筛选)", // Refined description
        requiresWebView: false,
        functionName: "tmdbUpcomingMovies",
        params: [
          { name: "language", title: "语言", type: "language", value: "zh-CN" }, // Removed Emoji
          { name: "primary_release_date.gte", title: "起始日期 (含)", type: "input", description: "最早的上映日期 (格式 YYYY-MM-DD)，默认为今天", value: "" }, // Removed Emoji
          { name: "primary_release_date.lte", title: "结束日期 (含)", type: "input", description: "最晚的上映日期 (格式 YYYY-MM-DD, 可选)", value: "" }, // Removed Emoji
          { name: "with_release_type", title: "发行渠道", type: "enumeration", description: "选择电影的发行渠道 (可选)", value: "2|3", enumOptions: [ { title: "影院上映 (优先)", value: "2|3" }, { title: "全部渠道", value: "" }, { title: "数字发行", value: "4" }, { title: "实体发行", value: "5" }, { title: "电视播出", value: "6" } ] }, // Removed Emoji
          { name: "with_genres", title: "类型 (可选)", type: "enumeration", description: "选择一个电影类型", value: "", enumOptions: [ { title: "任意", value: "" }, { title: "动作", value: "28" }, { title: "冒险", value: "12" }, { title: "动画", value: "16" }, { title: "喜剧", value: "35" }, { title: "犯罪", value: "80" }, { title: "纪录", value: "99" }, { title: "剧情", value: "18" }, { title: "家庭", value: "10751" }, { title: "奇幻", value: "14" }, { title: "历史", value: "36" }, { title: "恐怖", value: "27" }, { title: "音乐", value: "10402" }, { title: "悬疑", value: "9648" }, { title: "爱情", value: "10749" }, { title: "科幻", value: "878" }, { title: "惊悚", value: "53" }, { title: "战争", value: "10752" }, { title: "西部", value: "37" }, { title: "电视电影", value: "10770" } ] }, // Removed Emoji
          { name: "vote_average.gte", title: "最低评分 (可选)", type: "input", description: "输入 TMDB 最低评分 (0-10, 如 7)", value: "" }, // Removed Emoji
          { name: "vote_count.gte", title: "最少评价数 (可选)", type: "input", description: "输入最少评价人数 (如 100)", value: "" }, // Removed Emoji
          { name: "with_keywords", title: "关键词 (可选)", type: "input", description: "输入关键词筛选 (如 'superhero', API 支持有限)", value: "" }, // Removed Emoji
          { name: "page", title: "页码", type: "page" } // Removed Emoji
        ]
      },
    ]
};

// --- Helper Functions ---
// (No changes needed in helper functions)
function formatItemDescription(item) {
    let description = item.description || '';
    if (item.rating) {
        if (!description.toLowerCase().includes('rating') && !description.toLowerCase().includes('评分')) {
             description = `评分: ${item.rating} | ${description}`;
        }
    }
     if (item.releaseDate) {
        const year = String(item.releaseDate).substring(0, 4);
         if (!description.toLowerCase().includes('year') && !description.toLowerCase().includes('年份') && !description.includes(year)) {
             description = `年份: ${year} | ${description}`;
         }
     }
    return description.trim().replace(/^\|\s*/, '').replace(/\s*\|$/, '');
}

function createErrorItem(id, title, error) {
    console.error(title, error);
    const errorMessage = String(error?.message || error || '未知错误');
    const uniqueId = `error-${id.replace(/[^a-zA-Z0-9]/g, '-')}-${Date.now()}`;
    return {
        id: uniqueId,
        type: "error",
        title: title || "加载失败",
        description: errorMessage
    };
}

// --- TMDB Functions ---
// (No changes needed in TMDB functions)
async function fetchTmdbData(api, params) {
  try {
    const tmdbParams = { ...params };
    delete tmdbParams.type;
    delete tmdbParams.time_window;

    console.log(`调用 TMDB API: ${api} with params:`, JSON.stringify(tmdbParams));
    const response = await Widget.tmdb.get(api, { params: tmdbParams });

    if (!response || !response.results) {
        if (response?.status_message) {
            throw new Error(`TMDB API Error: ${response.status_message} (Code: ${response.status_code})`);
        }
        throw new Error("获取 TMDB 数据失败或格式错误");
    }

    const data = response.results;
    const finalResults = data.map((item) => {
        let title, releaseDate, description, mediaType, rating, itemId;
        itemId = item.id;
        let tmdbRating = item.vote_average ? item.vote_average.toFixed(1) : undefined;

         if (api.startsWith('movie/') || api.startsWith('/discover/movie') || item.media_type === 'movie' || (!item.media_type && item.title)) {
              mediaType = 'movie'; title = item.title; releaseDate = item.release_date; description = item.overview;
          } else if (api.startsWith('tv/') || api.startsWith('/discover/tv') || item.media_type === 'tv' || (!item.media_type && item.name)) {
              mediaType = 'tv'; title = item.name; releaseDate = item.first_air_date; description = item.overview;
          } else if (item.media_type === 'person'){
              mediaType = 'person'; title = item.name; releaseDate = undefined;
              const knownForTitles = item.known_for ? item.known_for.map(k => k.title || k.name).join(', ') : '';
              description = `热门作品: ${knownForTitles || 'N/A'}`;
              tmdbRating = undefined;
          } else {
               mediaType = item.media_type || 'unknown'; title = item.title || item.name || "未知标题";
               releaseDate = item.release_date || item.first_air_date; description = item.overview || '';
               console.warn(`Unknown or mixed media type detected for item ID ${itemId}, attempting fallback mapping. Type: ${mediaType}`);
          }

        let baseDescription = formatItemDescription({ description: description, rating: tmdbRating ? (tmdbRating / 2).toFixed(1) : undefined, releaseDate: releaseDate });

        return {
            id: `${mediaType}.${itemId}`,
            type: "tmdb",
            mediaType: mediaType,
            title: title,
            description: baseDescription.trim(),
            releaseDate: releaseDate,
            backdropPath: item.backdrop_path ? `https://image.tmdb.org/t/p/w780${item.backdrop_path}`: undefined,
            posterPath: item.poster_path ? `https://image.tmdb.org/t/p/w500${item.poster_path}`: undefined,
            rating: tmdbRating ? (tmdbRating / 2).toFixed(1) : undefined,
            popularity: item.popularity
        };
    });

    return finalResults.filter(item => item && item.id && item.title && item.mediaType !== 'person');

  } catch (error) {
    console.error(`调用 TMDB API ${api} 失败:`, error);
    const sourceId = `fetchTmdbData-${api.replace(/[^a-zA-Z0-9]/g, '-')}`;
    return [createErrorItem(sourceId, '调用 TMDB API 失败', error)];
  }
}

async function tmdbNowPlaying(params) {
  const type = params.type || 'movie';
  let api = type === 'movie' ? "movie/now_playing" : "tv/on_the_air";
  return await fetchTmdbData(api, params);
}

async function tmdbTrending(params) {
  const timeWindow = params.time_window || 'day';
  const api = `trending/all/${timeWindow}`;
  return await fetchTmdbData(api, params);
}

async function tmdbPopular(params) {
  const type = params.type || 'movie';
  let api = type === 'movie' ? `movie/popular` : `tv/popular`;
  return await fetchTmdbData(api, params);
}

async function tmdbTopRated(params) {
  const type = params.type || 'movie';
  let api = type === 'movie' ? `movie/top_rated` : `tv/top_rated`;
  return await fetchTmdbData(api, params);
}

async function tmdbUpcomingMovies(params) {
    const api = "/discover/movie";
    const getTodayDate = () => {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    };
    const discoverParams = {
        language: params.language || 'zh-CN', page: params.page || 1,
        sort_by: 'primary_release_date.asc',
        'primary_release_date.gte': params['primary_release_date.gte'] || getTodayDate(),
        'with_release_type': (params['with_release_type'] === '2|3' || params['with_release_type'] === '') ? '2|3' : params['with_release_type'],
    };
    if (params['primary_release_date.lte']) discoverParams['primary_release_date.lte'] = params['primary_release_date.lte'];
    if (params['with_genres']) discoverParams['with_genres'] = params['with_genres'];
    if (params['vote_average.gte']) discoverParams['vote_average.gte'] = params['vote_average.gte'];
    if (params['vote_count.gte']) discoverParams['vote_count.gte'] = params['vote_count.gte'];
    if (params['with_keywords']) discoverParams['with_keywords'] = params['with_keywords'];

    return await fetchTmdbData(api, discoverParams);
}

async function tmdbDiscoverByNetwork(params) {
    const api = "/discover/tv";
    const discoverParams = {
        language: params.language || 'zh-CN',
        page: params.page || 1,
        ...(params.sort_by && { sort_by: params.sort_by }),
        with_networks: params.with_networks
    };
    if (!discoverParams.with_networks) {
         return [createErrorItem('discover-no-network', '未选择平台', { message: '请选择一个播出平台进行筛选。' })];
    }
    return await fetchTmdbData(api, discoverParams);
}
